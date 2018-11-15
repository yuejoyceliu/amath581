 clear all;close all; clc

%ex1a - Solve ODE using forward Euler method
[A1,A2,A3] = runfEuler(0,5,pi/sqrt(2));
save A1.dat A1 -ascii
save A2.dat A2 -ascii
save A3.dat A3 -ascii

%ex1b - Solve ODE using Heun's method
[A4,A5,A6] = runfHeun(0,5,pi/sqrt(2));
save A4.dat A4 -ascii
save A5.dat A5 -ascii
save A6.dat A6 -ascii

%ex2a - van der Pol oscillator
tspan = 0:0.5:32;
y0 = [sqrt(3);1];
epsilon=0.1;
[t,fosc1] = ode45( @(t,y) fvdposc(t,y,epsilon),tspan,y0);
epsilon=1;
[t,fosc2] = ode45( @(t,y) fvdposc(t,y,epsilon),tspan,y0);
epsilon=20;
[t,fosc3] = ode45( @(t,y) fvdposc(t,y,epsilon),tspan,y0);
A7 = [fosc1(:,1) fosc2(:,1) fosc3(:,1)];
save A7.dat A7 -ascii

%ex2b - find truncate error of oed45, oed23 and ode113
epsilon = 1;
y0 = [2;pi^2];
tspan = [0,32];
A8 = localerrode45(tspan,y0,epsilon);
A9 = localerrode23(tspan,y0,epsilon);
A10 = localerrode113(tspan,y0,epsilon);
save A8.dat A8 -ascii
save A9.dat A9 -ascii
save A10.dat A10 -ascii

%ex3 - explore interaction between neurons
A11 = run2fitzhugh([0,0]);
A12 = run2fitzhugh([0,0.2]);
A13 = run2fitzhugh([-0.1,0.2]);
A14 = run2fitzhugh([-0.3,0.2]);
A15 = run2fitzhugh([-0.5,0.2]);
save A11.dat A11 -ascii
save A12.dat A12 -ascii
save A13.dat A13 -ascii
save A14.dat A14 -ascii
save A15.dat A15 -ascii
