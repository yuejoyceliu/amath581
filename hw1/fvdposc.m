function f = fvdposc(t,y,epsilon)

f1 = y(2);
f2 = -epsilon*(y(1)^2-1)*y(2)-y(1);

f = [f1;f2];

