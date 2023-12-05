f1=inline('x*x*x-3.*x-1','x');
d_d1 = inline('3.*x*x-3.','x');
x_0 = 0;
epsilon = 0.5e-5;
[x,n] = newiteration_1(f1,d_d1,x_0,epsilon)

function [x,n] = newiteration_1(f1,f_d1,x_0,epsilon)
a=feval(f1,x_0);
b=a+1;
n=0;

while(abs(a-b) >= epsilon) 
        a = feval(f1,x_0) ;
        df = feval(f_d1,x_0);
        if (feval(f_d1,x_0) == 0)
            break
        else
            x_0 = x_0 - a/df;
        end
        b = feval(f1,x_0);  
        n = n + 1;
end

x = x_0;
end
