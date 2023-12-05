#include<cstdio>
#include <cmath>
#define n 3
int main()
{
  double a[n+1][n+1]={0,0,0,0,0,0.2641,0.1735,0.8642,0,0.9411,-0.0175,0.1463,0,-0.8641,-0.4243,0.0711};
  double b[n+1]={0,-0.7521,0.6310,0.2501},l[n+1][n+1],x[n+1],sum,t;
  int k,i,j,ll,p;
  
    
  for (k=1;k<=n-1;k++)
{   
      p=k;  
for (i=k+1;i<=n;i++)
{
  if (fabs(a[i][k])>fabs(a[p][k]))
     p=i;
}

  if (p!=k)
{
      for (j=k;j<=n;j++)
   {
        t=a[k][j];
        a[k][j]=a[p][j];
       a[p][j]=t;
     }
      t=b[k];
      b[k]=b[p];
      b[p]=t;
  }
    
             
     for (i=k+1;i<=n;i++)
     {
         l[i][k]=a[i][k]/a[k][k];
         b[i]=b[i]-l[i][k]*b[k];
         
        for (j=k+1;j<=n;j++)
            {
       a[i][j]=a[i][j]-l[i][k]*a[k][j]; 
            }
     }
}


    
x[n]=b[n]/a[n][n];
  for (k=n-1;k>=1;k--)
{
    sum=0;
   for (ll=k+1;ll<=n;ll++)
    {
    sum=sum+a[k][ll]*x[ll];
    }  
     x[k]=(b[k]-sum)/a[k][k];
}
  for (i=1;i<=n;i++)
  printf("%f\n",x[i]);
  return 0;
}
