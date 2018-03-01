#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
	FILE * overlay_file;
	FILE * patch;
	int overlay_size, patch_size, result;
	char * patch_buffer;
	
	
	printf("Overlay (C) 2012 William D. Jones\n");
	
	if(argc != 4)
	{
		printf("Syntax: overlay.exe [file to overlay] [patch] [offset (bytes)]");
		exit(1);
	}
	
	overlay_file = fopen(argv[1], "rb+");
	patch = fopen(argv[2], "rb");
	
	if(overlay_file == NULL || patch == NULL)
	{
		fputs("File error.\n", stderr);
		exit(2);
	}
	
	fseek(overlay_file, 0, SEEK_END);
	overlay_size = ftell(overlay_file);
	rewind(overlay_file);
	
	fseek(patch, 0, SEEK_END);
	patch_size = ftell(patch);
	rewind(patch);
	
	if(patch_size > overlay_size)
	{
		fputs("Patch size error.\n", stderr);
		exit(3);
	}	
	
	patch_buffer = (char*) malloc (sizeof(char)*patch_size);
	
	if(patch_buffer == NULL)
	{
		fputs("Memory error.\n", stderr); 
		exit(4);
	}

	// copy the file into the buffer:
	result = fread(patch_buffer, 1, patch_size, patch);
	if(result != patch_size)
	{
		fputs("Reading error.\n", stderr); 
		exit(5);
	}
	
	fseek(overlay_file, atoi(argv[3]), SEEK_SET);
	result = fwrite(patch_buffer, 1, patch_size, overlay_file);
	
	if(result != patch_size)
	{
		fputs("Writing error.\n", stderr); 
		exit(6);
	}
	
	printf("\"%s\" overlayed using \"%s\" (patch size: %i) sucessfully.\n", argv[1], argv[2], patch_size);
	
	fclose(patch);
	fclose(overlay_file);
	return 0;
}
