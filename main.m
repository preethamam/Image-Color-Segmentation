clear; close all; clc;

%$ Inputs
input.RGBTriplet = [255,0,0]; % RGB value to segment
input.colorspace = 'hsv'; % 'rgb' | 'hsv' |'lab'
input.tolerance = 70;
input.Kmeans = true; % If true uses K-means clustering. 
                     % Else, uses input.RGBTriplet
input.KClusters = 3; % K clusters
input.ShowPlots = true; % Show plots

%% Read image
Ioriginal = imread('images/peppers.png');

% Get the pixel labels
input.filename = 'peppers.png';
pixelLabels = colorSegment (Ioriginal, input);