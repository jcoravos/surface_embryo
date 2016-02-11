%% Master script for finding the outer surface of an embryo

%User Inputs
sourcepath = '/Volumes/CORAVOS3/67;15 shDia(HMS) - 568adducin, 647MBS/JSC_shDia_L23_Sum'
channels = 3

%% Construct a 3D volume 

[ch1vol, ch2vol, ch3vol] = vol_builder(sourcepath, channels);
[m,n,p] = size(ch1vol);
[X,Y,Z] = meshgrid(1:n,1:m);


%% Find the edge of the embryo in each column of the volume

%% Record these points. These are the edges of the embryo.