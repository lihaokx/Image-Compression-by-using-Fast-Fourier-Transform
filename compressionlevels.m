clc
clear
close all

% read the original image
X=imread('image1.jpg');


%set the tolerance
tol =0
%get the compressed image Y and drop ratio
[Y, drop] = compress(X, tol);
imwrite(Y, 'c1.jpg')
figure(1)
subplot(2,2,1)
image(Y)
title(['Tol: ',num2str(tol),',  Drop: ', num2str(drop)],'FontSize',15 )
axis image
axis off


%set the tolerance
tol =10
%get the compressed image Y and drop ratio
[Y, drop] = compress(X, tol);
imwrite(Y, 'c2.jpg')
subplot(2,2,2)
image(Y)

title(['Tol: ',num2str(tol),',  Drop: ', num2str(drop)],'FontSize',15 )
axis image
axis off


%set the tolerance
tol =182
%get the compressed image Y and drop ratio
[Y, drop] = compress(X, tol);
imwrite(Y, 'c3.jpg')
subplot(2,2,3)
image(Y)
title(['Tol: ',num2str(tol),',  Drop: ', num2str(drop)],'FontSize',15 )
axis image
axis off


%set the tolerance
tol =500
%get the compressed image Y and drop ratio
[Y, drop] = compress(X, tol);
imwrite(Y, 'c4.jpg')
subplot(2,2,4)
image(Y)
title(['Tol: ',num2str(tol),',  Drop: ', num2str(drop)],'FontSize',15 )
axis image
axis off

set(gcf, 'Position', [0, 0, 1000, 1000],'color', 'w');
saveas(gcf, 'compressedIm.jpg')