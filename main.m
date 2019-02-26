img=imread('street.jpg');


img=glitch(img,20,80,0.3,0.8,-0.8,50,1); %rectangled cmyk


%img=randomglitch(img);
%img=glitch(img,30,50,0.1,0.8,0.6,50,2); %rectangled rgb
%img=glitch(img,2,2,0.1,0.4,0.5,50,2); % lines rgb
%img=glitch(img,5,25,1,0.8,-0.6,20,2);%ghost
%img=glitch(img,10,20,0.3,0.7,1,20,1); %cmykgrift
%img=glitch(img,60,120,0.3,0.7,0,20,2); %mge







% twosided exp
img=permute(img,[2 1 3]); %rotate
img=glitch(img,40,60,0.3,0.8,-0.6,0,1); %glitch again
img=permute(img,[2 1 3]); % rotate again

imshow(img);
imwrite(img,'ady.png');