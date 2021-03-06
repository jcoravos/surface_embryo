function [ maskProjCh1, maskProjCh2, maskProjCh3 ] = batch_maskProj(directory,channels)

    switch channels
        case 3
        [ch1vol,ch2vol,ch3vol] = vol_builder(directory,channels);
        pch1vol = permute(ch1vol,[3,1,2]);
        pch2vol = permute(ch2vol,[3,1,2]);
        pch3vol = permute(ch3vol,[3,1,2]);
        
        pEdgeMask = edge_mask(pch1vol,pch2vol,pch3vol);
        edgeMask = permute(pEdgeMask,[2,3,1]);
        edgeMask_smooth = smooth_mask(edgeMask);
        maskedVolCh1 = volume_mask(edgeMask_smooth,ch1vol);
        maskProjCh1 = mask_projection(maskedVolCh1,ch1vol);


        maskedVolCh2 = volume_mask(edgeMask_smooth,ch2vol);
        maskProjCh2 = mask_projection(maskedVolCh2,ch2vol);


        maskedVolCh3 = volume_mask(edgeMask_smooth,ch3vol);
        maskProjCh3 = mask_projection(maskedVolCh3,ch3vol);
    end
    
end