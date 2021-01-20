#ifndef FILE_IO_H
#define FILE_IO_H
#include <CL/opencl.h>

unsigned long load_file_to_memory(const char *filename, char **result, uint aligned);
unsigned long save_memory_to_file(const char* filename, char **buf, unsigned long size);

#endif
