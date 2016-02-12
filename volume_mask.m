function [ maskedVol ] = volume_mask(mask,imVol)
%Takes a volume of masks with the same dimensions as a grayscale volume
%and returns the masked pixels as maskedVol. Could be use for any masks 
%(e.g. cellular membranes, ventral region, nuclei).
disp('masking volumes...')

[m,n,p] = size(imVol);
maskedVol = zeros(m,n,p);

for i = 1:p
    maskedVol(:,:,i) = [mask(:,:,i).*imVol(:,:,i)];    
end

end