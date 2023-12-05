a=0;
b=1;
y0=0;
N=5;
f=@f1;
RK4_(f,a,b,y0,N);

function f=f0(x,y)
f=-x.^2+1+y;
end

function f=f1(x,y)
f=(-y+x*x+4*x-1)/2;
end

function f=ff(x)
f=1+(x.^5)/5;
end

function f=f2(x,y)
f=3*y/(1+x);
end

function f=f3(x,y)
f=y-2*x/y;
end

function RK4_(f,a,b,y0,N)
y(1)=y0;
h=(b-a)/N;
for k=0:N
    x(k+1)=a+k*h;
end
for k=0:N-1
    K_1=f(x(k+1),y(k+1));
    K_2=f(x(k+1)+h/2,y(k+1)+h/2*K_1);
    K_3=f(x(k+1)+h/2,y(k+1)+h/2*K_2);
    K_4=f(x(k+1)+h,y(k+1)+h*K_3);
    y(k+2)=y(k+1)+h/6*(K_1+2*K_2+2*K_3+K_4);
end
x
y
end