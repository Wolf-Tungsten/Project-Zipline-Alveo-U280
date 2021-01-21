#include "stdio.h"
#include "file_io.h"
#include "string.h"
#include "opencl_helper.h"
#include <CL/opencl.h>

int main(int argc, char * argv[]){

	////////////////////////////////////////////
	// 读取参数
	char* xclbin_path = argv[1];
	char* input_file_path = argv[2];

	////////////////////////////////////////////
	// 初始化 OpenCL Host 环境
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
	// 清理 OpenCL Host 环境
	opencl_clean_up(&platform_id,         // platform id
		&device_id,             // compute device id
		&context,                 // compute context
		&commands,
		&program,                 // compute programs
		&kernel);

}

// char* file_content;
	// long file_size = load_file_to_memory(argv[1], &file_content, 1);
	// printf("0x%lx\n", (long)file_content);
	// for(long i=file_size-10; i < file_size; i++){
	// 	printf("0x%02X\n", (unsigned char)file_content[i]);
	// }
    // save_memory_to_file(strcat(argv[1], ".gz"), &file_content, file_size);
	// free(file_content);
