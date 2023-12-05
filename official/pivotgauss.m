n=3;
a=[2,1,2;4,3,1;6,1,5];
b=[6,11,13];
l=zeros(n+1,n+1);
x=zeros(1,n+1);
sum=0;
t=0;
k=0;
i=0;
j=0;
ll=0;
p=0;

for k=1:n-1
    
    p=k;
    for i=k+1:n
        if (abs(a(i,k))>abs(a(p,k)))
            p=i;
        end
    end
    
    if p~=k
        for j=k:n
            t=a(k,j);
            a(k,j)=a(p,j);
            a(p,j)=t;
        end
        t=b(k);
        b(k)=b(p);
        b(p)=t;
    end
    
    for i=k+1:n
        l(i,k)=a(i,k)/a(k,k);
        b(i)=b(i)-l(i,k)*b(k);
        for j=k+1:n
            a(i,j)=a(i,j)-l(i,k)*a(k,j);
        end
    end
    
end

x(n)=b(n)/a(n,n);
for k=n-1:-1:1
    sum=0;
    for ll=k+1:n
        sum=sum+a(k,ll)*x(ll);
    end
    x(k)=(b(k)-sum)/a(k,k);
end

for i=1:n
    x(i)
end