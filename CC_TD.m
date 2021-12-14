clc;
clear all;
close all; 

saliencyMap = imread('E:\DELL -  Education & Jobs\MS-CSE - NSU\Fall 2021\CSE 583 Digital Image Processing\Assignment-Saliency Prediction\New folder\Murray model (Chromatic Induction Wavelet Model)\SIM\Outputs\86-ot.png');

fixationMap = imread('E:\DELL -  Education & Jobs\MS-CSE - NSU\Fall 2021\CSE 583 Digital Image Processing\Assignment-Saliency Prediction\TrainingData\TD_FixMaps\86_s.png');

% created: Zoya Bylinskii, Aug 2014

% This finds the linear correlation coefficient between two different 
% saliency maps (also called Pearson's linear coefficient).
% score=1 or -1 means the maps are correlated
% score=0 means the maps are completely uncorrelated

function score = CC(saliencyMap1, saliencyMap2)
% saliencyMap1 and saliencyMap2 are 2 real-valued matrices

map1 = im2double(imresize(saliencyMap1, size(saliencyMap2)));
map2 = im2double(saliencyMap2);

% normalize both maps
map1 = (map1 - mean(map1(:))) / std(map1(:)); 
map2 = (map2 - mean(map2(:))) / std(map2(:)); 

score = corr2(map2, map1);
