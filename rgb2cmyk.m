% RGB2CMYK - Basic conversion of RGB colour table to cmyk 
% Argument:    map -  N x 3 table of RGB values (assumed 0 - 1)
% Returns:    cmyk -  N x 4 table of cmyk values
%

function cmyk = rgb2cmyk(map)
height=size(map,1);
width=size(map,2);
map = double(map);
map=map/256;
    for i=1:height
        for j=1:width
           
          k(i,j) = min(  [1-map(i,j,1),1-map(i,j,2),1-map(i,j,3)] ) ;  
        end
    end



   
    size(k);
    denom = (1 - k + eps) ;  % Add eps to avoid divide by 0
    c(:,:) = (1-map(:,:,1) - k)./denom;
    
    m(:,:) = (1-map(:,:,2) - k)./denom;
    y(:,:) = (1-map(:,:,3) - k)./denom;
    
    cmyk(:,:,1) = c;
    cmyk(:,:,2) = m;
    cmyk(:,:,3) = y;
    cmyk(:,:,4) = k;

