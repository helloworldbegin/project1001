#include <stdio.h>
#include "./declare.h"


int main(int count, char** num)
{
	printf("%s;", (*num));
	int a, b;
	if(*(num+1)) a = chtoi(*(num+1)); else a = 0;
	if(*(num+2)) b = chtoi(*(num+2)); else b = 0;
	printf("%d %d\n", a, b);

	twonum(a, b, max);
        twonum(a, b, min);
        twonum(a, b, sum);


	return 0;
}

