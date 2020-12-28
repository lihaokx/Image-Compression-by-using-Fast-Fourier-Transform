# Image-Compression-by-using-Fast-Fourier-Transform
Compress an image by using FFT algorithm, and return the drop ratio and tolerance. 

**compression.m** shows The function takes as inputs the original image, X, and the drop tolerance parameter,
tol, and outputs a compressed image Y. It also returns the drop ratio, drop, which is
defined to be:

total number of Fourier coefficients dropped/total number of pixels in the image

`Total number' here means that the numbers from all 3 colour components are added
together. The drop ratio is a number between 0 and 1. If drop ratio = 0, then no Fourier
coefficient is dropped; if drop ratio = 1, then all Fourier coefficients are dropped.

Specifically, the MATLAB function do:

1. Compute the 2D Fourier coefficients (use fft2(single(Xblock))) for every 8*8
subblock for each colour.
2.For each subblock, set those Fourier coefficients having modulus less than tol to 0.
3. Record the number of coefficients dropped.
4. Reconstruct the compressed 8*8 image array by using the inverse 2D Fourier trans-
form (ifft2). Note: the reconstructed image array must be set to the real part of
the inverse transform.
5. After all the 8*8 subblocks for all the colour components have been processed, return
the entire compressed image as Y and the drop ratio as drop.

**compressionlevels.m.** does the following:
1. Specify four experimentally determined values of tol that result in drop ratios of 0,
0.4, 0.85, and 0.95 (approximately).
2. Display the four compressed images using subplot
