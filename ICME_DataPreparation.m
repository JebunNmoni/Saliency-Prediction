% -------------------------------------------------------------------------
% This code is used to read the data from the text file,
% and generate the saliency map, heat map for ASD children and TD children.
% Eye tracker: Tobii T120 17 inch
% -------------------------------------------------------------------------
clc
clear all

%%
% Please set the following paths as your own file path
PathASD = 'F:\DATA\ICME_GC\ICME_GC\ASD\';
PathTD = 'F:\DATA\ICME_GC\ICME_GC\TD\';
PathImage = 'F:\DATA\ICME_GC\ICME_GC\Image\';
PathFixPtsASD = 'F:\DATA\ICME_GC\ICME_GC\ASD_FixPts\';
PathFixMapsASD = 'F:\DATA\ICME_GC\ICME_GC\ASD_FixMaps\';
PathHeatMapsASD = 'F:\DATA\ICME_GC\ICME_GC\ASD_HeatMaps\';
PathFixPtsTD = 'F:\DATA\ICME_GC\ICME_GC\TD_FixPts\';
PathFixMapsTD = 'F:\DATA\ICME_GC\ICME_GC\TD_FixMaps\';
PathHeatMapsTD = 'F:\DATA\ICME_GC\ICME_GC\TD_HeatMaps\';

FileFolder = fullfile(PathImage);
Files = dir(fullfile(PathImage));

%%
for cnt = 1:length(Files)
    if ((strcmp(Files(cnt).name,'.')==1) || (strcmp(Files(cnt).name,'..')==1))
        continue;
    else
        FileName = Files(cnt).name
        FileName(end-3:end) = [];
        DataASD = importdata([PathASD,'ASD_scanpath_',FileName,'.txt']);
        dataASD = DataASD.data;
        DataTD = importdata([PathTD,'TD_scanpath_',FileName,'.txt']);
        dataTD = DataTD.data;
    end
    
    Img = imread([PathImage,FileName,'.png']);
    [ImgRow,ImgCol,~] = size(Img);
    
    %% ASD
    % fixation map initialization
    FixationPoints = zeros(ImgRow,ImgCol);

    X_ASD = dataASD(:,2);
    Y_ASD = dataASD(:,3);
    for cntFixPts = 1:size(dataASD,1)
        FixationPoints(Y_ASD(cntFixPts),X_ASD(cntFixPts)) = 1;
    end

    % write fixation points
    imwrite(FixationPoints,[PathFixPtsASD,FileName,'_f.png']);

    % write fixation map
    window = fspecial('gaussian', 43*6, 43);
    window = window/sum(sum(window));
    FixationMapTemp = imfilter(FixationPoints, window, 'conv');
    FixationMap = mat2gray(FixationMapTemp);
    imwrite(FixationMap,[PathFixMapsASD,FileName,'_s.png']);

    % heat map
    figure(1)
    imshow(Img)
    hold on
    [meshX, meshY] = meshgrid(1:ImgCol, 1:ImgRow);
    HeatMap=pcolor(meshX,meshY,FixationMap);
    colorbar;
    shading interp
    alpha(0.4)
    %saveas(HeatMap,[WritePath,ImgNameWrite,'_heatMapASD.bmp']);
    saveas(HeatMap,[PathHeatMapsASD,FileName,'_h.png']);
    hold off
    close all
    
    %% TD
    % fixation map initialization
    FixationPoints = zeros(ImgRow,ImgCol);

    X_TD = dataTD(:,2);
    Y_TD = dataTD(:,3);
    for cntFixPts = 1:size(dataTD,1)
        FixationPoints(Y_TD(cntFixPts),X_TD(cntFixPts)) = 1;
    end

    % write fixation points
    imwrite(FixationPoints,[PathFixPtsTD,FileName,'_f.png']);

    % write fixation map
    window = fspecial('gaussian', 43*6, 43);
    window = window/sum(sum(window));
    FixationMapTemp = imfilter(FixationPoints, window, 'conv');
    FixationMap = mat2gray(FixationMapTemp);
    imwrite(FixationMap,[PathFixMapsTD,FileName,'_s.png']);

    % heat map
    figure(2)
    imshow(Img)
    hold on
    [meshX, meshY] = meshgrid(1:ImgCol, 1:ImgRow);
    HeatMap=pcolor(meshX,meshY,FixationMap);
    colorbar;
    shading interp
    alpha(0.4)
    %saveas(HeatMap,[WritePath,ImgNameWrite,'_heatMapASD.bmp']);
    saveas(HeatMap,[PathHeatMapsTD,FileName,'_h.png']);
    hold off
    close all
    
    clear DataASD DataTD dataASD dataTD
end