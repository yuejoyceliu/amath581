clear all; clf; close all; clc

%{
hw3--1
Using the spdiags command, generate the three matrices A = dx2 + dy2,
B = dx and C = dy which take derivatives in two dimensions.
%}
x = -10:10; n = 8;
[A1 A2 A3] = buildmatrix(x,x,n);
spy(A1)
figure;spy(A2);
figure;spy(A3);
A1 = full(A1);
A2 = full(A2);
A3 = full(A3);

%hw3--2
load('Fmat.mat');%the permuted matrix 
%inverse permutation vector.if it is [3 1 ...]: put the 3th block as the 1st one,1st block to the 2nd...
load('permvec.mat');
[A4 A5]=decryimage(Fmat,permvec);
%figure;imshow(uint8(A5))

save A1.dat A1 -ascii
save A2.dat A2 -ascii
save A3.dat A3 -ascii
save A4.dat A4 -ascii
save A5.dat A5 -ascii