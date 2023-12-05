#include<cstdio>
#include <cmath>
#define n 3
int main()
{
  double a[n+1][n+1]={0,0,0,0,0,8.,-3,2.,0,4.,11.,-1.,0,2.,1.,4.};
  double b[n+1]={0,20.,33.,12.},x0[n+1]={0,0,0,0},x[n+1];
  double sum,sum1,tol;
  int N_max,k,i,j;
  double maxnorm_vectorerror(double *x,double *x0);
  N_max=20;
	tol=0.00005;
	k=1;
	  while (k<N_max)
	   {
	     for (i=1;i<=n;i++)
		   {
			   sum=0.;
		   for (j=2;j<=n;j++)
			   sum=sum+a[1][j]*x0[j];
		   x[1]=(b[1]-sum)/a[1][1];
		   for (i=2;i<=n-1;i++)
		   {
			   sum=0.;
			   for (j=1;j<=i-1;j++)
				   sum=sum+a[i][j]*x[j];
			   sum1=0.;
			   for (j=i+1;j<=n;j++)
				   sum1=sum1+a[i][j]*x0[j];
			    x[i]=(b[i]-sum-sum1)/a[i][i];
             }
		   sum=0.;
		   for (j=1;j<=n-1;j++)
			   sum=sum+a[n][j]*x[j];
		   x[n]=(b[n]-sum)/a[n][n];
			  
			   
		   }
		   if (maxnorm_vectorerror(x,x0)<tol)
		   {
		     printf("Gauss-seidel interative successful within the allowed N_max\n");
			   printf("the iterative step=%d\n",k);
			   for (i=1;i<=n;i++)
			   {
				   printf("%12.8f\n",x[i]);
			   }
			   break;
       }
       for (i=1;i<=n;i++)
		   {
			   x0[i]=x[i];
		   }
       k=k+1;
       
		   
	   }
	    if (k==N_max)
	 {
		 printf("Mamximum number of iterations exceeds(unsuccessful)\n");
	 }
  return 0;
}
double maxnorm_vectorerror(double *x,double *x0)
{
  double r;
  int i;
  r=fabs(x[1]-x0[1]);
  for (i=2;i<=n;i++)
  {
    if (r<fabs(x[i]-x0[i]))
    r=fabs(x[i]-x0[i]);
  }
  return r;
}
