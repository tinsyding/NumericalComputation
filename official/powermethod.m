n=input('请选择你的行数（请小于20）:');
for j=1:n
    fprintf('请输入矩阵第%d行的数值',j);
    for i=1:n
        A(j,i)=input('');
    end
end
for i=1:n
    u(i)=input('请输入初次迭代向量:');
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
fprintf('矩阵特征值=%f\n',y);
fprintf('矩阵特征向量x：\n');
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