clc;
clear all;
close all; 

saliencyMap = imread('E:\DELL -  Education & Jobs\MS-CSE - NSU\Fall 2021\CSE 583 Digital Image Processing\Assignment-Saliency Prediction\New folder\Murray model (Chromatic Induction Wavelet Model)\SIM\Outputs\5-ot.png');

fixationMap = imread('E:\DELL -  Education & Jobs\MS-CSE - NSU\Fall 2021\CSE 583 Digital Image Processing\Assignment-Saliency Prediction\TrainingData\ASD_FixMaps\5_s.png');


% created: Zoya Bylinskii, Aug 2014

% This finds the normalized scanpath saliency between two different 
% saliency maps as the mean value of the normalized saliency map at 
% fixation locations.

%function score = NSS(saliencyMap, fixationMap)
% saliencyMap is the saliency map
% fixationMap is the human fixation map (binary matrix)
map = double(imresize(saliencyMap,size(fixationMap)));

% normalize saliency map
map = (map - mean(map(:)))/std(map(:)); 

% mean value at fixation locations
score = mean(map(logical(fixationMap)));
