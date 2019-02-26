


function map = cmyk2rgb(cmyk)
    
    c = cmyk(:,:,1); m = cmyk(:,:,2); y = cmyk(:,:,3); k = cmyk(:,:,4);

    r = (1-c).*(1-k);
    g = (1-m).*(1-k);
    b = (1-y).*(1-k);
    
    map(:,:,1) = r*255;
    map(:,:,2) = g*255;
    map(:,:,3) = b*255;
    map=uint8(map);

