


function [Y, drop] = compress(X, tol)
% Usage: [Y, drop] = compress(X, tol)
% Compute a compressed image 'Y' from an
% original input image 'X' by dropping
% Fourier modes with modulus smaller
% than tolerance parameter 'tol'. The
% drop ratio is also returned via the
% parameter 'drop'.

s=size(X);

offset1 = mod(8-mod(s(1),8),8);
offset2 = mod(8-mod(s(2),8),8);
if offset1 ~= 0 | offset2 ~= 0
  X(s(1)+offset1, s(2)+offset2, 3) = 0;
end
%get the size of X
s=size(X);
% initialize the number of drop
num=0;
% initialize the output matrix Y
Y= zeros(s(1),s(2),s(3),'uint8' );
% divide the image into 8*8 blocks
for k=1:s(3)
    for i =1:8:s(1)
        for j= 1:8:s(2)
            %compress subblocks
        [num, newCurrX] = comprSubBlock(num, X(i:i+7, j:j+7,k), tol);
        Y(i:i+7, j:j+7,k) = newCurrX;
        end
    end
end

%calculate the drop ratio
drop = num/(s(1)*s(2)*s(3));

end

% sub fuction to compress the sub-block
function [num, newCurrX] = comprSubBlock(num, currX, tol)
%use fft2 to transfer the subblock
fft_cX = fft2(currX);
  for i =1:8
   for j= 1:8
       % if the fft2 is smaller than the tolerance, set the value as 0
       if abs(fft_cX(i,j)) < tol
          fft_cX(i,j) = 0+0i ;
          num = num+1;
       end      
   end

end
 % inverse fft2, and get the real part of it
newCurrX=uint8(real(ifft2(fft_cX)));
end



