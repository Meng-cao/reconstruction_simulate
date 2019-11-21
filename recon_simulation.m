close all

sizex = 100;
sizey = 100;
image = zeros(sizey,sizex);
recondata = zeros(100,100,10);

%{set inflorence dot}
%set random number R between 1 to 98
for layer = 2: +3: 8
   
    dx = 10e-3;
    dy = 10e-3;
    shiftx = 0;
    shifty = 0;
    wa = 532e-6;

if layer <= 2
    mkdir final
    R = randi(98);
    image(R,R) = 1;
    image(R,R+1) = 1;
    image(R+1,R) = 1;
    image(R+1,R+1) = 1;
    
   
    k = 1;
    for d = -10: +10 :80 
    
         i = sqrt(-1);
         recon = func_angularprop(image,sizex,dx,dy,wa,d);
         %recon = atan2(real(recon),imag(recon));
         recon = abs(recon).^2;
         %figure(),imshow(recon);
         %OutputFileName = sprintf('./secondlayer/recon_%d.tif',d);
         %imwrite((recon),OutputFileName);

         %obj =obj./max(max(abs(obj)));
         figure(),imshow(recon,[]);
         %OutputFileName = sprintf('./d350image/obj_%d.tif',d);
         %imwrite((image),OutputFileName);
         recondata(:,:,k) = recon; 
         k = k+1;
    end
    

    
    image(R,R) = 0;
    image(R,R+1) = 0;
    image(R+1,R) = 0;
    image(R+1,R+1) = 0;
    
elseif layer == 5
    mkdir fifthlayer
    
    R = randi(98);
    image(R,R) = 1;
    image(R,R+1) = 1;
    image(R+1,R) = 1;
    image(R+1,R+1) = 1;
    
    
    k = 1;
    for d = -40: +10 :50 
    
         i = sqrt(-1);
         recon = func_angularprop(image,sizex,dx,dy,wa,d);
         %recon = atan2(real(recon),imag(recon));
         recon = abs(recon).^2;
         %figure(),imshow(recon);
         %OutputFileName = sprintf('./secondlayer/recon_%d.tif',d);
         %imwrite((recon),OutputFileName);

         %obj =obj./max(max(abs(obj)));
         figure(),imshow(recon,[]);
         %OutputFileName = sprintf('./d350image/obj_%d.tif',d);
         %imwrite((image),OutputFileName);
         recondata(:,:,k) = recondata(:,:,k)+recon; 
         k = k+1;
 
    end
    
    image(R,R) = 0;
    image(R,R+1) = 0;
    image(R+1,R) = 0;
    image(R+1,R+1) = 0;
    
else 
    mkdir eighthlayer
    R = randi(98);
    image(R,R) = 1;
    image(R,R+1) = 1;
    image(R+1,R) = 1;
    image(R+1,R+1) = 1;

    
    k = 1;
    for d = -70: +10 :20 
    
         i = sqrt(-1);
         recon =func_angularprop(image,sizex,dx,dy,wa,d);
         %recon = atan2(real(recon),imag(recon));
         recon = abs(recon).^2;
         %figure(),imshow(recon);
         %OutputFileName = sprintf('./secondlayer/recon_%d.tif',d);
         %imwrite((recon),OutputFileName);

         %obj =obj./max(max(abs(obj)));
         figure(),imshow(recon,[]);
         %OutputFileName = sprintf('./d350image/obj_%d.tif',d);
         %imwrite((image),OutputFileName);
         recondata(:,:,k) = recondata(:,:,k)+recon; 
         k = k+1;

    end
    image(R,R) = 0;
    image(R,R+1) = 0;
    image(R+1,R) = 0;
    image(R+1,R+1) = 0;
    
end

    

end

    for k = 1:10
        recon = recondata(:,:,k);
        
        OutputFileName = sprintf('./final/recon_%d.tif',k);
        imwrite((recon),OutputFileName);
    end
    
