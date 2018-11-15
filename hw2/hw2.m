clf; clear all; close all; clc; 

%ex1---pde fucntion, using shooting method to solve
L=4; dx=0.1; e_start=0.5; tol=10^-4;
[phi_shoot,A6] = runpdeshoot(L,dx,e_start,tol);
A1=abs(phi_shoot(:,1));
A2=abs(phi_shoot(:,2));
A3=abs(phi_shoot(:,3));
A4=abs(phi_shoot(:,4));
A5=abs(phi_shoot(:,5));

%ex2--pde function, using direct method to solve
[phi_direct,e_direct] = runpdedirect(L,dx);
A7 = abs(phi_direct(:,1));
A8 = abs(phi_direct(:,2));
A9 = abs(phi_direct(:,3));
A10 = abs(phi_direct(:,4));
A11 = abs(phi_direct(:,5));
A12 = e_direct(1:5);

%ex3--consider nonlinear effect:
L=2;gama=0.05;A_start=0.2;
[phi_gamapos,A15] = pdenonlinear(L,dx,gama,e_start,A_start,tol);
A13 = abs(phi_gamapos(:,1));
A14 = abs(phi_gamapos(:,2));
gama=-0.05;
[phi_gamaneg,A18] = pdenonlinear(L,dx,gama,e_start,A_start,tol);
A16 = abs(phi_gamaneg(:,1));
A17 = abs(phi_gamaneg(:,2));

save A1.dat A1 -ascii
save A2.dat A2 -ascii
save A3.dat A3 -ascii
save A4.dat A4 -ascii
save A5.dat A5 -ascii
save A6.dat A6 -ascii
save A7.dat A7 -ascii
save A8.dat A8 -ascii
save A9.dat A9 -ascii
save A10.dat A10 -ascii
save A11.dat A11 -ascii
save A12.dat A12 -ascii
save A13.dat A13 -ascii
save A14.dat A14 -ascii
save A15.dat A15 -ascii
save A16.dat A16 -ascii
save A17.dat A17 -ascii
save A18.dat A18 -ascii

