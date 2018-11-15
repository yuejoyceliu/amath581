function slope = localerrode23(tspan,y0,epsilon)
for i =1:7
    tol(i) = 10^(-i-3);
    options = odeset('AbsTol',tol(i),'RelTol',tol(i));
    [T,Y] = ode23( @(t,y) fvdposc(t,y,epsilon),tspan,y0,options);
    tstep(i) = mean(diff(T));
end

x= log10(tstep);
y = log10(tol);

figure;
plot(x,y,'x')
hold on;

p = polyfit(x,y,1);
plot(x,p(1)*x+p(2));
slope = p(1);