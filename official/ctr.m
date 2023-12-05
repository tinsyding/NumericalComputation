a=0;
b=1;
n=10;
f11=@f1;
fprintf('复合梯形公式计算第一个积分=%d\n',CTR(n,a,b,f11));
a=1;
b=2;
n=8;
f22=@f2;
fprintf('复合梯形公式计算第一个积分=%d',CTR(n,a,b,f22));

function f=f1(x)
f=1/(1+sin(x)*sin(x));
end

function f=f2(x)
f=x*log10(x);
end

function f=f3(x)
f=exp(-x*x);
end

function f=f4(x)
f=x.^0.5;
end

function f=f5(x)
f=x/(4+x.^2);
end

function f=f6(x)
f=(4-sin(x).^2).^0.5;
end

function [r]=CTR(n,a,b,f)
h=(b-a)/n;
r=f(a)+f(b);
for k=1:n-1
    r=r+2*f(a+k*h);
end
r=r*(h/2);
end