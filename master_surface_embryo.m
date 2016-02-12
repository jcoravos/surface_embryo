
folderDirectory = '/Volumes/CORAVOS3/6715shWhite(III)-568Dcad647MBS/'
rFolderList = struct2cell(dir(folderDirectory))
folderList = cell(0)

%%
for i = 1:length(rFolderList)
    if rFolderList{4,i} == 1
        if isempty(regexp(rFolderList{1,i},'^\.','match')) == true
            folderList{end+1} = rFolderList(1,i)
        end
    end

end 

%% cleaning up
%{
for i = 1:length(folderList)
    directory = char(strcat(folderDirectory,folderList{i},'/'))
    rmdir(char(strcat(directory,'/sp_data')),'s')
end
%}
%%
for i = 1:length(folderList)
    directory = char(strcat(folderDirectory,folderList{i},'/'))  
    [sp.Ch1,sp.Ch2,sp.Ch3] = batch_maskProj(directory,3);
    
    mkdir(char(strcat(directory,'/sp_data/')));
    Ch1uint8 = uint8((sp.Ch1./max(max(sp.Ch1)))*255);
    Ch2uint8 = uint8((sp.Ch2./max(max(sp.Ch2)))*255);
    Ch3uint8 = uint8((sp.Ch3./max(max(sp.Ch3)))*255);
    
    disp('writing files...')
        
    imwrite(Ch1uint8,char(strcat(directory,'/sp_data/sp_c001.tif')));
    imwrite(Ch2uint8,char(strcat(directory,'/sp_data/sp_c002.tif')));
    imwrite(Ch3uint8,char(strcat(directory,'/sp_data/sp_c003.tif')));
    
end
