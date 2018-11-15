function [eigen_phi,eigen_e]=pdenonlinear(L,dx,gama,e_start,A_start,tol)
%clc; clear all; clf
%L=2;dx=0.1;gama=0.05;e_start=0.5;A_start=0.2;tol=10^-4;
xspan = -L:dx:L;

for modes=1:2
    e = e_start;
    de=0.01;
    for j=1:1000
        A = A_start;
        dA = 0.1;
        for a=1:1000
            y0 = [A;A*sqrt(L^2-e)];
            
            [x,phi] = ode45( @(x,phi) nolinpdefunc(x,phi,gama,e), xspan ,y0);
         
            AA = trapz(x,phi(:,1).^2);
           
            if abs(AA-1)<tol
                opt_A(modes,1)=A;
                break;
            end
            if AA>1
                A = A-dA;
            else
                dA = dA/2;
                A = A+dA;
            end       
        end
        
        rightbc = phi(end,2)+sqrt(L^2-e)*phi(end,1);
        if abs(rightbc)<tol
            eigen_e(modes,1)=e;
            break;
        end
        
        if (-1)^(1+modes)*rightbc>0
            e = e+de;
        else
            de = de/2;
            e = e-de;
        end
    end
    e_start = e+1;
    A_start = A+1;
    %trapz(x,phi(:,1).^2)
    eigen_phi(:,modes) = phi(:,1)/sqrt(trapz(x,phi(:,1).^2));
    
    %hold on
    %plot(x,eigen_phi(:,modes))
    
end
