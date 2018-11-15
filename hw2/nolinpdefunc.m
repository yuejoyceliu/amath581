function f = nolinpdefunc(x,y,gama,e)

f1 = y(2);
f2 = (gama*y(1)^2+x^2-e)*y(1);

f=[f1;f2];