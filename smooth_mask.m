function [smoothMask] = smooth_mask(edgeMask)

se = strel('disk',6);

for i = 1:size(edgeMask,3)
    smoothMask(:,:,i) = imdilate(edgeMask(:,:,i),se);
end

end