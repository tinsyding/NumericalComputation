n=5;
x0=0.596;
x=[0.4,0.55,0.65,0.8,0.9,1.05];
y=[0.41075,0.57815,0.69675,0.88811,1.02652,1.25385];
f=zeros(1,7);
fn=zeros(1,6);

for k=1:n+1
    f(k)=y(k);
end

fn(1)=f(n+1);
k=1;
for i=1:n
    k=k+1;
    fn(k)=(f(n)-f(n+1))/(x(n+1-i)-x(n+1));
    f(n+1)=fn(k);
    for j=n-1:-1:i
        f(j+1)=(f(j)-f(j+1))/(x(j+1-i)-x(j+1));
    end
end

Nn=f(1);
for k=1:n
    l=1;
    for j=0:k-1
        l=l*(x0-x(j+1));
    end
    Nn=Nn+f(k+1)*l;
end

f(n+2)=Nn;
for k=1:n+1
    f(n+2)=(fn(k)-f(n+2))/(x(n+2-k)-x0);
end

l=1;
for j=0:n
    l=l*(x0-x(j+1));
end

Rn=f(n+2)*l;
Nn
Rn