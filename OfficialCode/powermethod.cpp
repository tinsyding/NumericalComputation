//幂法
#include<stdio.h>
#include<math.h>
void LOOP(float a[20][20], float u[20], int);
//矩阵最高阶数是 20， 可以更改最高阶数
float MAX(float u[20], int);
void main(void)
{
	float a[20][20], u[20], x[20], y, z;
	int i, j, n;
	printf("请输入方阵阶数:\n");
	scanf("%d", &n);
	printf("请按行输入各矩阵元素值:");
	for (i = 0; i <= n - 1; i++)
	{
		for (j = 0; j <= n - 1; j++)
		{
			scanf("%f", &a[i][j]);
		}
	}
	printf("请输入初次迭代向量:");
	for (i = 0; i <= n - 1; i++)
	{
		scanf("%f", &u[i]);
	}
	y = MAX(u, n);
	do
	{
		z = y;
		LOOP(a, u, n);
		y = MAX(u, n);
		for (i = 0; i <= n - 1; i++)
		{
			x[i] = u[i] / y;
			u[i] = x[i];
		}
	} while (fabs(z - y) >= 0.0000005);
	printf("矩阵特征值λ=%f\n", y);
	printf("矩阵特征向量 x:\n");
	for (i = 0; i <= n - 1; i++)
	{
		printf("%10f\n", x[i]);
	}
}
void LOOP(float a[20][20], float u[20], int n)
{
	float S, U[20];
	int i, j;
	for (i = 0; i <= n - 1; i++)
	{
		U[i] = u[i];
	}
	for (i = 0; i <= n - 1; i++)
	{
		S = 0.0;
		for (j = 0; j <= n - 1; j++)
		{
			S = S + a[i][j] * U[j];
		}
		u[i] = S;
	}
}
float MAX(float u[20], int n)
{
	float max;
	int i;
	max = u[0];
	for (i = 0; i <= n - 1; i++)
	{
		if (u[i] > max)
		{
			max = u[i];
		}
	}
	return(max);
}

//反幂法
#include<stdio.h>
#include<math.h>
#define MAX_N 20 //矩阵最大维数
#define MAXREPT 100
#define epsilon 0.00001 //求解精度
int main()
{
	int n;
	int i, j, k;
	double xmax, oxmax;
	static double a[MAX_N][MAX_N];
	static double l[MAX_N][MAX_N], u[MAX_N][MAX_N];
	static double x[MAX_N], nx[MAX_N];
	printf("\n请输入矩阵阶数n:"); //输入矩阵维数
	scanf("%d", &n);
	if (n > MAX_N)
	{
		printf("the input n is larger than MAX_N,please redefine the MAX_N.\n");
		return 1;
	}
	if (n <= 0)
	{
		printf("please input a number between 1 and %d.\n", MAX_N);
		return 1;
	}
	//输入A矩阵
	printf("请输入矩阵的值a[i][j] i,j=0...%d;\n", n - 1);
	for (i = 0; i < n; i++)
		for (j = 0; j < n; j++)
			scanf("%lf", &a[i][j]);
	for (i = 0; i < n; i++)
		x[i] = 1;
	oxmax = 0;
	for (i = 0; i < MAXREPT; i++)
	{
		for (j = 0; j < n; j++) //幂乘
		{
			nx[j] = 0;
			for (k = 0; k < n; k++)
				nx[j] += a[j][k] * x[k];
		}
		xmax = 0.0;
		for (j = 0; j < n; j++) //规范化
			if (fabs(nx[j]) > xmax)
				xmax = fabs(nx[j]);
		for (j = 0; j < n; j++)
			nx[j] /= xmax;
		for (j = 0; j < n; j++)
			x[j] = nx[j];
		if (fabs(xmax - oxmax) < epsilon)
		{
			printf("solve...max lamda=%lf\n", xmax); //输出
			printf("the vector is:\n");
			for (i = 0; i < n; i++)
				printf("%f\n", nx[i]);
			break;
			//return 0;
		}
		oxmax = xmax;
	}
	//printf("after %d repeat ,max no result ...\n",MAXREPT);
	for (i = 0; i < n; i++)
		u[i][i] = 1; //U矩阵对角元为
	for (k = 0; k < n; k++)
	{
		for (i = k; i < n; i++) //计算L矩阵
		{
			l[i][k] = a[i][k];
			for (j = 0; j <= k - 1; j++)
				l[i][k] -= (l[i][j] * u[j][k]);
		}
		for (j = k + 1; j < n; j++) //计算U矩阵
		{
			u[k][j] = a[k][j];
			for (i = 0; i <= k - 1; i++)
				u[k][j] -= (l[k][i] * u[i][j]);
			u[k][j] /= l[k][k];
		}
	}
	for (i = 0; i < n; i++)
		x[i] = 1;
	for (i = 0; i < MAXREPT; i++)
	{
		for (j = 0; j < n; j++) //反幂乘
		{
			nx[j] = x[j];
			for (k = 0; k <= j - 1; k++)
				nx[j] -= l[j][k] * nx[k];
			nx[j] /= l[j][j];
		}
		for (j = n - 1; j >= 0; j--)
		{
			x[j] = nx[j];
			for (k = j + 1; k < n; k++)
				x[j] -= u[j][k] * x[k];
		}
		xmax = 0.0;

		for (j = 0; j < n; j++)
			if (fabs(x[j]) > xmax)
				xmax = fabs(x[j]);
		for (j = 0; j < n; j++)
			x[j] /= xmax;
		if (fabs(xmax - oxmax) < epsilon)
		{
			printf("solve... min lamda=%lf\n", 1 / xmax); //输出
			printf("the vector is:\n");
			for (i = 0; i < n; i++)
				printf("%f\n", x[i]);
			break;
			//return 0;
		}
		oxmax = xmax;
	}
	return 1;
}
