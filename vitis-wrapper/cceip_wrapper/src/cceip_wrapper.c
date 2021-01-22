#include "stdio.h"
#include "file_io.h"
#include "string.h"
#include "opencl_helper.h"
#include <CL/opencl.h>

#define MEM_ALIGNMENT 4096
int main(int argc, char * argv[]){

	////////////////////////////////////////////
	// 1 - 读取参数
	////////////////////////////////////////////
	char* xclbin_path = argv[1];
	char* input_file_path = argv[2];
	

	////////////////////////////////////////////
	// 2 - 初始化 OpenCL Host 环境
	////////////////////////////////////////////
	cl_int err = 0;                            
    cl_uint check_status = 0;
	// OpenCL 需要的变量
    cl_platform_id platform_id;         // platform id
    cl_device_id device_id;             // compute device id
    cl_context context;                 // compute context
    cl_command_queue commands;          // compute command queue
    cl_program program;                 // compute programs
    cl_kernel kernel;                   // compute kernel
	// 初始化 platform_id、device_id、context、commands
	err = init_opencl_env( &platform_id, &device_id, &context, &commands );
	if(err != CL_SUCCESS){
		return 1;
	}
	// 创建 program、加载 kernel
	err = create_kernel( xclbin_path, &device_id, &context, &program, &kernel);
	if(err != CL_SUCCESS){
		return 1;
	}

	////////////////////////////////////////////
	// 3 - 创建 Host 内存指针
	////////////////////////////////////////////
	char* h_input_file_buf_ptr;
	cl_long* h_output_size_ptr;
	char* h_output_file_buf_ptr;

	////////////////////////////////////////////
	// 4 - 装载文件、分配区域
	////////////////////////////////////////////
    // 将输入文件内容装载到一个 4KB 对齐的 Host 内存区域
	cl_long input_file_size;
	input_file_size = load_file_to_memory(input_file_path, &h_input_file_buf_ptr, 1);
	// 一个4KB的区域存储输出size
	h_output_size_ptr = (cl_long *)aligned_alloc(MEM_ALIGNMENT, MEM_ALIGNMENT);

	////////////////////////////////////////////
	// 5 - 在 Device 上划分用于输入和输出的内存空间
	////////////////////////////////////////////
	cl_mem d_input_buf_ptr; // 存储输入数据
	cl_mem d_output_size_ptr; // 存储输出数据的大小（单位：byte）
	cl_mem d_output_buf_ptr; // 存储输出数据
	d_input_buf_ptr = clCreateBuffer(context,
                     CL_MEM_READ_ONLY,
                     input_file_size, NULL, &err);
	if(err != CL_SUCCESS){
		printf("ERROR: Failed to allocate device memory for input buffer\n");
	}
	d_output_size_ptr = clCreateBuffer(context, 
						CL_MEM_READ_WRITE,
						MEM_ALIGNMENT, NULL, &err);
	if(err != CL_SUCCESS){
		printf("ERROR: Failed to allocate device memory for output size\n");
	}
	d_output_buf_ptr = clCreateBuffer(context,
						CL_MEM_WRITE_ONLY,
						input_file_size, NULL, &err);
	if(err != CL_SUCCESS){
		printf("ERROR: Failed to allocate device memory for output buffer\n");
	}

	////////////////////////////////////////////
	// 6 - 将输入数据传输到 Device (并等待结束)
	////////////////////////////////////////////
	err = clEnqueueWriteBuffer(commands, d_input_buf_ptr, CL_TRUE, 0,
      input_file_size, h_input_file_buf_ptr, 0, NULL, NULL);
	if(err != CL_SUCCESS){
		printf("ERROR: Failed to transfer input data to device\n");
	}

	////////////////////////////////////////////
	// 7 - 设置 kernel 参数
	////////////////////////////////////////////
	err = 0;
	err |= clSetKernelArg(kernel, 0, sizeof(cl_long), &input_file_size); 
    err |= clSetKernelArg(kernel, 1, sizeof(cl_mem), &d_input_buf_ptr); 
    err |= clSetKernelArg(kernel, 2, sizeof(cl_mem), &d_output_size_ptr);
    err |= clSetKernelArg(kernel, 3, sizeof(cl_mem), &d_output_buf_ptr); 
	if(err != CL_SUCCESS){
		printf("ERROR: Failed to set kernel arguments\n");
	}

	////////////////////////////////////////////
	// 8 - 启动 kernel (并等待结束)
	////////////////////////////////////////////
	size_t global[1];
    size_t local[1];
    global[0] = 1;
    local[0] = 1;
    err = clEnqueueNDRangeKernel(commands, kernel, 1, NULL, (size_t*)&global, (size_t*)&local, 0, NULL, NULL);
    if (err) {
        printf("ERROR: Failed to execute kernel! %d\n", err);
    }
	clFinish(commands);

	////////////////////////////////////////////
	// 9 - 读回输出 size
	////////////////////////////////////////////
	err = clEnqueueReadBuffer(commands, d_output_size_ptr, CL_TRUE, 0, sizeof(cl_long),
	 h_output_size_ptr, 0, NULL, NULL);	
	if(err != CL_SUCCESS){
		printf("ERROR: Failed to read output size\n");
	}

	////////////////////////////////////////////
	// 10 - 读回压缩结果
	////////////////////////////////////////////
	h_output_file_buf_ptr = (char *)aligned_alloc(MEM_ALIGNMENT,
			((*h_output_size_ptr / MEM_ALIGNMENT) + 1) * MEM_ALIGNMENT);
	err = clEnqueueReadBuffer(commands, d_output_buf_ptr, CL_TRUE, 0, *h_output_size_ptr,
	 h_output_file_buf_ptr, 0, NULL, NULL);

	////////////////////////////////////////////
	// 11 - 结果保存到文件
	////////////////////////////////////////////
	save_memory_to_file(strcat(input_file_path, ".gz"), &h_output_file_buf_ptr, *h_output_size_ptr);

	////////////////////////////////////////////
	// 清理环境
	////////////////////////////////////////////
	clReleaseMemObject(d_input_buf_ptr);
	clReleaseMemObject(d_output_size_ptr);
	clReleaseMemObject(d_output_buf_ptr);

	free(h_input_file_buf_ptr);
	free(h_output_file_buf_ptr);
	free(h_output_size_ptr);
	
	// 清理 OpenCL 环境
	opencl_clean_up(&platform_id,         // platform id
		&device_id,             // compute device id
		&context,                 // compute context
		&commands,
		&program,                 // compute programs
		&kernel);

	printf("INFO: done\n");
}

// char* file_content;
	// long file_size = load_file_to_memory(argv[1], &file_content, 1);
	// printf("0x%lx\n", (long)file_content);
	// for(long i=file_size-10; i < file_size; i++){
	// 	printf("0x%02X\n", (unsigned char)file_content[i]);
	// }
    // save_memory_to_file(strcat(argv[1], ".gz"), &file_content, file_size);
	// free(file_content);
