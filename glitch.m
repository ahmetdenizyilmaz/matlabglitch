%img image
%hmin hmax glitch line height 
%color intensity 0-1 interval
%glitch intensity 0-1 interval
%overlay 0-1
%shift 0-100
%type 1-cmyk 2-rgb 
function img2 = glitch(img,hmin,hmax,cintensity,gintensity,overlay,shift,type)
height=size(img,1);
width=size(img,2);
if(hmin>hmax)
hmin=hmax;
end
channel=3;
if(type==1)
img=rgb2cmyk(img);
channel=4;
end
%img2=cmyk2rgb(imgcmyk);
%imshow(img2);
temph=1;
while temph<height-hmax
    ln=randi([hmin hmax]);
    if(rand<gintensity)
        temppart=img(temph:temph+ln,:,:);
        
         rands=rand+0.3;
         if(rand>0.5)
             rands=-rands;
         end
         c=1+rands*4*cintensity;
         m=1-rands*4*cintensity;
         

         temppart(:,:,1)= min(255,c*temppart(:,:,1)); 
         temppart(:,:,2)= min(255,m*temppart(:,:,2)); 

      
        ratio=rand+overlay;
        vshift=zeros(1,channel);
        vshift(randi([1 channel]))=randi([-shift shift]);
        vshift(randi([1 channel]))=randi([-shift shift]);
        vshift(randi([1 channel]))=randi([-shift shift]);
        for i=1:ln
            for j=1:width
                for k=1:channel
                    img(i+temph-1,j,k)=ratio*temppart(i,max(1,min(j+vshift(k),width)),k)+(1-ratio)*img(i+temph-1,j,k);
                   
                end
            end
        end
        
    end
    temph=ln+temph;
end
if(type==1)
  
img2=cmyk2rgb(img);
else
    img2=img;
end


