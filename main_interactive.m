clear; close all; clc;

%$ Inputs
input.colorspace = 'hsv'; % 'rgb' | 'hsv' |'lab'
input.tolerance = 70;
input.Kmeans = false; % If true uses K-means clustering. 
                     % Else, uses input.RGBTriplet
input.KClusters = 3; % K clusters
input.ShowPlots = true; % Show plots

%% Read image
Ioriginal = imread('images/peppers.png');

% Get the pixel labels
input.filename = 'peppers.png';

%% Interactive window
figure('Name','Select Region','NumberTitle','off');
imshow(Ioriginal);
title('Draw a region with the mouse, double‐click to finish');

% Draw a freehand ROI ---
hFH = drawfreehand('Color','r','LineWidth',1.5);

% Wait until the ROI is completed (double‐click)
position = hFH.Position;
mask = hFH.createMask(); 

% Extract RGB values within the mask
% Separate channels
R = Ioriginal(:,:,1);
G = Ioriginal(:,:,2);
B = Ioriginal(:,:,3);

% Vector of values inside the ROI
rVals = double(R(mask));
gVals = double(G(mask));
bVals = double(B(mask));

% Compute mean values
input.RGBTriplet = [mean(rVals), mean(gVals), mean(bVals)]; % RGB value to segment
 

%% Process and get the pixel labels
pixelLabels = colorSegment (input, Ioriginal);