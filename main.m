clear; close all; clc;

%$ Inputs
input.RGBTriplet = [255,0,0]; % RGB value to segment
input.colorspace = 'yiq'; % 'rgb' | 'hsv' |'lab' | 'xyz' 
                          %  'ycbcr' | 'yiq' (NTSC)
input.tolerance = 70;
input.Kmeans = true; % If true uses K-means clustering. 
                     % Else, uses input.RGBTriplet
input.KClusters = 3; % K clusters
input.ShowPlots = true; % Show plots

%% Read image
Ioriginal = imread('images/Thin39.jpg');

% Get the pixel labels
input.filename = 'Thin39.jpg';
pixelLabels = colorSegment (input, Ioriginal);