function [ maskProj ] = mask_projection(maskedVol,channel)

disp('projecting masked pixels...')
[m,n,p] = size(maskedVol);

maskedPixels = maskedVol.*channel;
sortedPixels = sort(maskedPixels,3,'descend');

maskProj = sum(sortedPixels(:,:,[1,2]),3);

end



