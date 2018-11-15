function [A B C] = buildmatrix(x,y,n)
%x = -10:10; n = 8;
dxoy = (x(end)-x(1))/n;
e1 = ones(n^2,1);
%e01=zeros(n,1); e01(1,1)=1; e01=repmat(e01,8,1);
%e02=zeros(n,1); e02(n,1)=1; e02=repmat(e02,8,1);
%AY = spdiags([e01 e1 e1 e02],[-(n-1) -1 1 7],n^2,n^2);


%A = dx^2+dy^2

%A = (AD+AX+AY)/dx/dy; AD=-4y(m,n),AX=y(m-1,n)+y(m+1,n), AY=y(m,n-1)+y(m,n+1)
AD = spdiags(-4*e1,0,n^2,n^2);
AX = spdiags([e1 e1 e1 e1],[-(n-1)*n -n n n*(n-1)],n^2,n^2);
AY = spdiags([e1 e1],[-1 1],n^2,n^2);
for i=1:n
    AY(1+n*(i-1),n*i) = 1;
    AY(n*i,1+n*(i-1)) = 1;
    if i==8
        break
    else
        AY(n*i,1+n*i) = 0;
        AY(1+n*i,n*i) = 0;
    end
end

A = (AD+AX+AY)/(dxoy^2);

%figure;spy(A)

%B = dx
%B = (y(m+1,n)-y(m-1,n))/(2*dx)
B = spdiags([e1 -e1 e1 -e1],[-(n-1)*n -n n n*(n-1)],n^2,n^2)/(2*dxoy);

%figure;spy(B);

%C = dy
%C = (y(m,n+1)-y(m,n-1))/(2*dy)
C = spdiags([-e1 e1],[-1,1],n^2,n^2);
for i=1:n
    C(1+n*(i-1),n*i) = -1;
    C(n*i,1+n*(i-1)) = 1;
    if i==8
        break
    else
        C(n*i,1+n*i) = 0;
        C(1+n*i,n*i) = 0;
    end
end
C = C/(2*dxoy);

%figure;spy(C);
