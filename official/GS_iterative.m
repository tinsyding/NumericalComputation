n=3;
a=[8.,-3,2.;4.,11.,-1.;2.,1.,4.];
b=[20.,33.,12.];
x0=zeros(1,n);
x=zeros(1,n);
sum=0;
N_max=20;
k=1;
i=0;
e=0;
j=0;
tol=0.00005;

while k<N_max
    for i=1:n
        sum=0;
        for j=2:n
            sum=sum+a(1,j)*x0(j);
        end
        x(1)=(b(1)-sum)/a(1,1);
        for i=2:n-1
            sum=0;
            for j=1:(i-1)
                sum=sum+a(i,j)*x(j);
            end
            sum1=0;
            for j=(i+1):n
                sum1=sum1+a(i,j)*x0(j);
            end
            x(i)=(b(i)-sum-sum1)/a(i,i);
        end
        sum=0;
        for j=1:n-1
            sum=sum+a(n,j)*x(j);
        end
        x(n)=(b(n)-sum)/a(n,n);
    end
    
    if maxnorm_vectorerror(x,x0,n)<tol
        fprintf('Gauss-seidel interative successful within the allowed N_max');
        fprintf('the iterative step=%d',k);
        for i=1:n
            x(i)
        end
        break;
    end
    
    for i=1:n
        x0(i)=x(i);
    end
    
    k=k+1;
end

if k==N_max
    fprintf('Mamximum number of iterations exceeds(unsuccessful)');
end

function[r]=maxnorm_vectorerror(x,x0,n)
r=abs(x(1)-x0(1));
for i=2:n
    if r<abs(x(i)-x0(i))
        r=abs(x(i)-x0(i));
    end
end
end
