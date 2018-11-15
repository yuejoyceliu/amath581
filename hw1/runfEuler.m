
function [f,E,slope]=runfEuler(tini,tend,yini)
ynum(1) = yini;
for j=1:7
    dt(j) = 2^(-(j+1));
    t = tini:dt(j):tend;
    for i=2:length(t)
        ynum(i) = fEuler(t(i-1),ynum(i-1),dt(j));
    end
    ytrue = ftrue(t);
    E(j) = mean(abs(ytrue-ynum));
end

figure;
x = log10(dt);
y = log10(E);

p = polyfit(x,y,1);
slope = p(1);
y2 = p(1)*x+p(2);

plot(x,y,'.')
hold on
plot(x,y2)

f = ynum';