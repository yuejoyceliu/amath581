function [result1,result2]=decryimage(Fmat,permvec)
%clear all; close all; clc

F = Fmat(161:240,161:240); %only the center of the matrix be permuted
cellF = mat2cell(F,[20 20 20 20],[20 20 20 20]); %divide it into 16 blocks
[Iperm Jperm] = ind2sub(size(cellF),permvec); %get subscripts of blocks 

%permute the F matrix:
k=0;
for n=1:4
    for m=1:4
        k=k+1;
        permF(m,n)=cellF(Iperm(k),Jperm(k));
    end
end

Fmat(161:240,161:240) = cell2mat(permF);
%shift matrix from center to corners
Fshift = ifftshift(Fmat);

%perform inverse fft to recover this image
Ftshift = ifft2(Fshift);

result1 = abs(Fmat);
result2 = abs(Ftshift);

%imshow(uint8(abs(Ftshift)))