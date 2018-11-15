function y = f2fitzhugh(t,y0,d)

a1=0.05; a2=0.25; b=0.01; c=0.01; I=0.1;
v1=y0(1); v2=y0(2); w1=y0(3); w2=y0(4);

dv1 = -v1^3+(1+a1)*v1^2-a1*v1-w1+I+d(1)*v2;
dw1 = b*v1-c*w1;
dv2 = -v2^3+(1+a2)*v2^2-a2*v2-w2+I+d(2)*v1;
dw2 = b*v2-c*w2;

y = [dv1;dv2;dw1;dw2];
