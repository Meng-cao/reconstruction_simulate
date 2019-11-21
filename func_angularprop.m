function output = func_angularprop(input,SIZE,dx,dy,lamda,z)

i=sqrt(-1);

fdata1 = fftshift(fft2(fftshift(input)));

sizex = SIZE*dx;
sizey = SIZE*dy;

delta_alpha = lamda/sizex;
delta_beta = lamda/sizey;

alpha2 = zeros(SIZE);
alpha = delta_alpha*[-SIZE/2:SIZE/2-1];
for loop1=1:SIZE
    alpha2(loop1,1:SIZE) = alpha(1,1:SIZE);
end

beta2 = zeros(SIZE);
beta = delta_beta*[-SIZE/2:SIZE/2-1];
for loop1=1:SIZE
    beta2(1:SIZE,loop1) = beta(1,1:SIZE);
end

mat1 = exp(i*2.0*pi*z*sqrt(1.^2-alpha2.*alpha2-beta2.*beta2)/lamda);
fdata11 = fdata1.*mat1;
output = fftshift(ifft2(fftshift(fdata11)));

