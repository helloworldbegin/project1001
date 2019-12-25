#include <stdio.h>
int sum(int a, int b)
{
	printf("The sum is : ");
	return a + b;
}
int max(int a, int b)
{
	printf("The max number is : ");
	return a > b ? a : b;
}
int min(int a, int b)
{
	printf("The min number is : ");
	return a < b ? a : b;
}

int chtoi(char * p)
{
	char * head = p;
	int i = 0;
	const int zero = 48, nine = 57;
	while(*p >= zero && *p <= nine)
	{
		i = i + 1;
		p = p + 1;
		if (*p == 0) break;
		if (*p < zero || *p > nine)
		{
			return 0;
		}
	}
	int w = 1;
	for (int n = 0; n < i - 1; n = n + 1)
	{
		w = w * 10;
	}
	p = head;
	int num = 0;
	for (int j = i; j > 0; j = j - 1)
	{
		switch(*p)
		{
			case 48 : num += 0; break;
			case 49 : num += 1 * w; break;
			case 50 : num += 2 * w; break;
			case 51 : num += 3 * w; break;
			case 52 : num += 4 * w; break;
			case 53 : num += 5 * w; break;
			case 54 : num += 6 * w; break;
			case 55 : num += 7 * w; break;
			case 56 : num += 8 * w; break;
			case 57 : num += 9 * w; break;
		}
		w = w / 10;
		p = p + 1;
	}

	return num;
}

int twonum(int a, int b, int (*funptr)(int, int))
{
	int answer;
	answer = (*funptr)(a, b);

	printf("%d\n", answer);

	return answer;
}
