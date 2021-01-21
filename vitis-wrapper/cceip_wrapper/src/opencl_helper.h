#ifndef OPENCL_HELPER_H
#define OPENCL_HELPER_H
#include <CL/opencl.h>

cl_uint init_opencl_env(
    cl_platform_id *platform_id,         // platform id
    cl_device_id *device_id,             // compute device id
    cl_context *context,                 // compute context
    cl_command_queue *commands
    );

cl_uint create_kernel(
    char* xclbin_path,
	cl_device_id *device_id,
    cl_context *context,                 // compute context
    cl_program *program,                 // compute programs
    cl_kernel *kernel                   // compute kernel
    );

void opencl_clean_up(
    cl_platform_id *platform_id,         // platform id
    cl_device_id *device_id,             // compute device id
    cl_context *context,                 // compute context
    cl_command_queue *commands,
    cl_program *program,                 // compute programs
    cl_kernel *kernel                   // compute kernel
);
#endif
