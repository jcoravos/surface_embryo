function [ varargout ] = vol_builder( directory,channels )
%vol_builder This function makes a volume image out of an image sequence
%of a fixed embryo
home = pwd;
cd(directory);

L  = dir();
L = L(3:length(L));

if channels == 3
    for i = 1:3:length(L) %building 3d image volumes
        ch1vol(:,:,i) = double(imread(L(i).name));
        ch2vol(:,:,i) = double(imread(L(i+1).name));
        ch3vol(:,:,i) = double(imread(L(+2).name));
    end
    varargout = {ch1vol,ch2vol,ch3vol};

    
elseif channels == 2
    for i = 1:3:length(L) %building 3d image volumes
        ch1vol(:,:,i) = double(imread(L(i).name));
        ch2vol(:,:,i) = double(imread(L(i+1).name));
    end
    varargout = {ch1vol,ch2vol};

    
elseif channels == 1
    for i = 1:3:length(L) %building 3d image volumes
        ch1vol(:,:,i) = double(imread(L(i).name));
    end
    varargout = {ch1vol};
end

cd(home)

end

