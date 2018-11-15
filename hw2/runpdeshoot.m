function [eigen_phi,eigen_e] = runpdeshoot(L,dx,e_start,tol)

xspan = -L:dx:L;
A = 1; % suggest A=phi(-L)=phi(L)

for modes=1:5
    e = e_start;
    de=0.01;
    for j=1:1000
        y0 = [A;A*sqrt(L^2-e)];
        
        [x,phi] = ode45( @(x,phi) pdefunc(x,phi,e), xspan ,y0);
        
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
    eigen_phi(:,modes) = phi(:,1)/sqrt(trapz(x,phi(:,1).^2));
    %{
    test_phi = phi(:,1)/norm(phi(:,1))*sqrt(10);
    if max(abs(test_phi-eigen_phi(:,modes)))<tol
        disp('pass')
    else
        disp('not pass')
    end
    %hold on
    %plot(x,eigen_phi(:,modes))
    %norm(eigen_phi(:,modes))
    trapz(x,test_phi.^2)
    %}
    e_start = e+0.2;
end

