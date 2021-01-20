#include "stdio.h"
#include "file_io.h"
#include "string.h"
#include <CL/opencl.h>

int main(int argc, char * argv[]){
	char* file_content;
	long file_size = load_file_to_memory(argv[1], &file_content, 1);
	printf("0x%lx\n", (long)file_content);
	for(long i=file_size-10; i < file_size; i++){
		printf("0x%02X\n", (unsigned char)file_content[i]);
	}
    save_memory_to_file(strcat(argv[1], ".gz"), &file_content, file_size);
	free(file_content);
}
