n=input('��ѡ�������������С��20��:');
for j=1:n
    fprintf('����������%d�е���ֵ',j);
    for i=1:n
        A(j,i)=input('');
    end
end
for i=1:n
    u(i)=input('��������ε�������:');
end
y=MAX_(u,n);
while 1
    z=y;
    u=LOOP(A,u,n);
    y=MAX_(u,n);
    for i=1:n
        x(i)=u(i)/y;
        u(i)=x(i);
    end
    if abs(z-y)<0.0000005
        break;
    end
end
fprintf('��������ֵ=%f\n',y);
fprintf('������������x��\n');
x

function [x]=LOOP(a,u,n)
for i=1:n
    U(i)=u(i);
end
for i=1:n
    S=0;
    for j=1:n
        S=S+a(i,j)*U(j);
    end
    x(i)=S;
end
end

function [max]=MAX_(u,n)
max=u(1);
for i=1:n
    if u(i)>max
        max=u(i);
    end
end
end