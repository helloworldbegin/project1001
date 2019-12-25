#include <stdio.h>

int main(int count, char** fname)
{
    FILE * fp = fopen(*(fname+1), "r");
    if (fp == NULL)
    {
	printf("New file will be created\n");
	fp = fopen(*(fname+1), "w+");
    }
    else
    {
	fclose(fp);
	printf("Opening file\n");
	fp = fopen(*(fname+1), "r+");
    }
    int ch = fgetc(fp);
    while(ch != -1)
    {
	putchar(ch);
	ch = fgetc(fp);
    }

    fclose(fp);
    return 0;
}
