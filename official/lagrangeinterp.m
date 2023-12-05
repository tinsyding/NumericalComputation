n=7;
m=4;
x=[0.5,0.7,0.9,1.1,1.3,1.5,1.7,1.9];
y=[0.48,0.64,0.78,0.89,0.96,1.00,0.99,0.95];
a=[0.74,1.6,0.55,1.2,1.85];

for i=0:m
    Ln=lagrange(x,y,a(i+1),n)
end

function [Ln]=lagrange(x,y,x0,n)
Ln=0;
for i=0:n
    l=1;
    for j=0:n
        if j~=i
            l=l*(x0-x(j+1))/(x(i+1)-x(j+1));
        end
    end
    Ln=Ln+y(i+1)*l;
end
end