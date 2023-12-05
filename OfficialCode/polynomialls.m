n=9;
m=2;
G=zeros(m+1,m+1);
d=zeros(1,m+1);
a=zeros(1,m+1);
x=[0.,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9];
y=[0.,5.1234,5.3057,5.5680,5.9378,6.4370,7.0978,7.9493,9.0253,10.3627];
w=[0.,1.,1.,1.,1.,1.,1.,1.,1.,1.]; %便于计算，第一个元素不考虑

fprintf('正则方程组的系数矩阵');
for k=0:m
    for j=0:m
        G(k+1,j+1)=0;
        for i=1:n
            G(k+1,j+1)=G(k+1,j+1)+w(i+1)*x(i+1).^(k+j);
        end
    end
end
G

fprintf('正则方程组的右端向量');
for j=0:m
    d(j+1)=0;
    for i=1:n
        d(j+1)=d(j+1)+w(i+1)*y(i+1)*x(i+1).^j;
    end
end
d

a=gauss(G,d,m);
fprintf('拟合的二次多项式');
for i=0:m
    if a(i+1)<0
        fprintf('(%d)',a(i+1));
    else
        fprintf('%d',a(i+1));
    end
    j=1;
    if j<=i
    for j=1:i-1
        fprintf('x*');
    end
    j=j+1;
    end
    if j==i
        fprintf('x');
    end
    if i==m
        break;
    end
         fprintf('+');
end

function [x]=gauss(a,b,m)
for k=0:m-1
    for i=k+1:m
        l(i+1,k+1)=a(i+1,k+1)/a(k+1,k+1);
        b(i+1)=b(i+1)-l(i+1,k+1)*b(k+1);
        for j=k+1:m
            a(i+1,j+1)=a(i+1,j+1)-l(i+1,k+1)*a(k+1,j+1);
        end
    end
end
x(m+1)=b(m+1)/a(m+1,m+1);
for k=m-1:-1:0
    sum=0;
    for j=k+1:m
        sum=sum+a(k+1,j+1)*x(j+1);
    end
    x(k+1)=(b(k+1)-sum)/a(k+1,k+1);
end
end
