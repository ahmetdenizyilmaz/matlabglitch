function img2 = randomglitch(img)

hmin=randi([1 60]);
hmax=randi([1 60]);
cintensity=rand-0.3;
gintensity=rand+0.3;
overlay=(rand-0.5)*2;
shift=randi([5 60]);
type=randi([1 2]);
img2 = glitch(img,hmin,hmax,cintensity,gintensity,overlay,shift,type);