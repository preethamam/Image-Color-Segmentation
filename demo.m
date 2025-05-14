clear; close all; clc;

%$ Inputs
input_RGBTriplet = [0,0,255; 0,255,0; 255,0,0; 255,0,0; 220,70,190; 255,0,0]; % RGB value to segment
input_colorspace = {'xyz', 'ycbcr', 'yiq'}; % 'rgb' | 'hsv' |'lab' | 'xyz' 
                                        %  'ycbcr' | 'yiq' (NTSC)
input.tolerance = 70;
input.Kmeans = false; % If true uses K-means clustering. 
                     % Else, uses input.RGBTriplet
input.KClusters = 3; % K clusters
input.ShowPlots = true; % Show plots

%% Read image
images = dir("images");
images = images(3:end,:);

for j = 1:length(input_colorspace)
    input.colorspace = input_colorspace{j};
    for i = 1:length(images)    
        % Get RGB triplets        
        input.RGBTriplet = input_RGBTriplet(i,:);

        % Read images
        Ioriginal = imread(fullfile(images(i).folder, images(i).name));
        input.filename = images(i).name;

        % Get the pixel labels
        pixelLabels = colorSegment (input, Ioriginal);

        close all;
    end
end