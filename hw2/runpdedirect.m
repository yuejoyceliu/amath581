function [phi_sort,eng] = runpdedirect(L,dx)

xspan = -L:dx:L;
max = length(xspan)-2;
A = zeros(max,max);
phi_sort = zeros(max+2,max+2);
% build up A matrix which doesn't consider phi(x1) and phi(xn). A is built
% based on 2nd order central difference. The first and last row don't
% consider x1 and xn, use FDF and BDF and approximation to make phi(x2) and
% phi(x3) express phi(x1); phi(xn-2) and phi(xn-1) express phi(xn).
A(1,1:2) = [2/3/dx^2+xspan(2)^2,-2/3/dx^2];
A(end,end-1:end) = [-2/3/dx^2,2/3/dx^2+xspan(end-1)^2];
i = 2;
while i<max
    A(i,i-1) = -1/dx^2;
    A(i,i+1) = -1/dx^2;
    A(i,i) = 2/dx^2+xspan(i+1)^2;
    i=i+1;
end
%phi function only contains [phi(2),phi(3),...phi(n-2),phi(n-1)]
[phi,e]=eig(A);

%sort phi function based on ascending energy.
for i=1:max
    eng(i,1) = e(i,i);
end

[eng, Index_eng] = sort(eng);

%only get the first five phi functions. 
%phi(1)/phi(N) are calculated based on FDF/BDF method without approximation.
for i =1:5
    phi_sort(2:end-1,i) = phi(:,Index_eng(i));
    phi_sort(1,i) = (4*phi_sort(2,i)-phi_sort(3,i))/(3+2*dx*sqrt(L^2-eng(i)));
    phi_sort(end,i) = (4*phi_sort(end-1,i)-phi_sort(end-2,i))/(3+2*dx*sqrt(L^2-eng(i)));
    phi_sort(:,i) = phi_sort(:,i)/sqrt(trapz(xspan,phi_sort(:,i).^2));
end
