function Recon=nearpropFT(Comp1,sizex,sizey,dx,dy,shiftx,shifty,wa,d)

x1 = -sizex/2;
x2 = sizex/2-1;
y1 = -sizey/2;
y2 = sizey/2-1;
[Fx,Fy]=meshgrid(x1:1:x2,y1:1:y2);
i = sqrt(-1);

FresR=exp(i*pi*((Fx.^2)*(dx^2)+(Fy.^2)*(dy^2))/(wa*d));
Comp1 = Comp1.*FresR;

Decline = exp(i*2*pi*((shiftx*Fx/sizex)+(shifty*Fy/sizey)));
size(Decline);

Comp1 = Comp1.*Decline;

Recon = fftshift(fft2(fftshift(Comp1)))/sqrt(sizex*sizey);
