function  pixelLabels = colorSegment (input, Ioriginal)

%//%************************************************************************%
%//%*                         Color segmenter						       *%
%//%*           Segments the images by their colors                        *%
%//%*                                                                      *%
%//%*                                                                      *%
%//%*             Name: Dr. Preetham Manjunatha    		                   *%
%//%*             Github link: https://github.com/preethamam               %*
%//%*             Submission Date: 05/12/2025                              *%
%//%************************************************************************%
%//%*             Viterbi School of Engineering,                           *%
%//%*             Sonny Astani Dept. of Civil Engineering,                 *%
%//%*             University of Southern california,                       *%
%//%*             Los Angeles, California.                                 *%
%//%************************************************************************%
%
%************************************************************************%
%
% Usage: pixelLabels = colorSegment (input, Ioriginal)
% Inputs:   
%           input        - Input struct
%           colorspace   - color segmentation of annotatations by color
%                           space 'rgb' | 'hsv' | 'lab' | 'xyz' 
%                                 'ycbcr' | 'yiq' (NTSC)
%
%           input.RGBTriplet - [0,0,255]; % RGB value to segment
%           input.colorspace - 'rgb' % 'rgb' | 'hsv' |'lab' | 'xyz' 
                                        %  'ycbcr' | 'yiq' (NTSC)
%           input.tolerance - 70; % tolerance value
%           input.Kmeans - true; % If true uses K-means clustering. 
%                                % Else, uses input.RGBTriplet
%           input.KClusters - 3; % K clusters
%           input.ShowPlots - true; % Show plots
%           Ioriginal    - Input color image
%
%
% Outputs:  pixelLabels  - Output pixels labels
%           
%

    % Check the number of input arguments
    if nargin < 2
        error('Not enough input arguments. Usage: pixelLabels = colorSegment(Ioriginal, input)');
    end

    % Validate the input struct fields
    requiredFields = {'RGBTriplet', 'colorspace', 'tolerance', 'Kmeans', 'KClusters', 'ShowPlots'};
    for i = 1:length(requiredFields)
        if ~isfield(input, requiredFields{i})
            error('Input struct is missing the required field: %s', requiredFields{i});
        end
    end

    % Validate colorspace
    validColorSpaces = {'rgb', 'hsv', 'lab', 'xyz', 'ycbcr', 'yiq'};
    if ~ismember(lower(input.colorspace), validColorSpaces)
        error('Invalid colorspace. Valid options are: ''rgb'', ''hsv'', ''lab'', ''xyz'', ''ycbcr'', ''yiq''.');
    end

    % Validate RGBTriplet
    if ~isnumeric(input.RGBTriplet) || numel(input.RGBTriplet) ~= 3
        error('RGBTriplet must be a numeric array with 3 elements.');
    end

    % Validate tolerance
    if ~isnumeric(input.tolerance) || input.tolerance < 0
        error('Tolerance must be a non-negative numeric value.');
    end

    % Validate Kmeans
    if ~islogical(input.Kmeans)
        error('Kmeans must be a logical value (true or false).');
    end

    % Validate KClusters
    if ~isnumeric(input.KClusters) || input.KClusters <= 0 || mod(input.KClusters, 1) ~= 0
        error('KClusters must be a positive integer.');
    end

    % Validate ShowPlots
    if ~islogical(input.ShowPlots)
        error('ShowPlots must be a logical value (true or false).');
    end

    % Read the original color image and get sizes
    [imheight, imwidth, imbytesppix]  = size(Ioriginal);
    centroids = [];
    
    if sum(input.RGBTriplet>1)
        input.RGBTriplet = input.RGBTriplet/255;
    end

    % Convert RGB image to a target HSV or L*a*b* color space
    switch input.colorspace
        case 'rgb' 
            % Convert to double
            Itransformed = im2double(Ioriginal);

            % Target RGB color triplet
            targetTriplet = input.RGBTriplet;
        case 'hsv'
            % Convert the image to HSV space
            Itransformed = rgb2hsv(Ioriginal);  

            % Target HSV color triplet
            targetTriplet = rgb2hsv(input.RGBTriplet);
        case 'lab'
            % Convert image from RGB colorspace to lab color space.
            cform = makecform('srgb2lab');
            Itransformed = applycform(im2double(Ioriginal),cform);

            % Target L*a*b* color triplet
            targetTriplet = rgb2lab(input.RGBTriplet);

        case 'xyz'
            % Convert the image to HSV space
            Itransformed = rgb2xyz(Ioriginal);  

            % Target HSV color triplet
            targetTriplet = rgb2xyz(input.RGBTriplet);

        case 'ycbcr'
            % Convert the image to HSV space
            Itransformed = rgb2ycbcr(im2double(Ioriginal));  

            % Target HSV color triplet
            targetTriplet = rgb2ycbcr(input.RGBTriplet);

        case 'yiq'
            % Convert the image to HSV space
            Itransformed = rgb2ntsc(Ioriginal);  

            % Target HSV color triplet
            targetTriplet = rgb2ntsc(input.RGBTriplet);
        otherwise
            error('colorSpace must be ''RGB'', ''Lab'', ''HSV'', ''XYZ'', ''YCBCR'', or ''YIQ''');
    end

    if input.Kmeans
        % Segmentation map and clustering
        segMaptic = tic;
        [N,M,L] = size(Itransformed);
        ItransFeatureVec = reshape(Itransformed,[N*M, L]);
        
        % Get clusters indices/classes
        [idx,centroids] = kmeans(ItransFeatureVec, input.KClusters);
        
        % Reshape to segmentation map
        pixelLabels = reshape(idx, [N,M]);
        segMapruntime = toc(segMaptic);
        fprintf('K-mean segmentation map execution time: %.4f seconds\n', segMapruntime)
    else
        % Segmentation map by color tolerance distance 
        Channel1 = Itransformed(:,:,1);          % Get the first channel
        Channel2 = Itransformed(:,:,2);          % Get the second channel
        Channel3 = Itransformed(:,:,3);          % Get the third channel                    
        
        C1Standard = targetTriplet(1) * ones(imheight, imwidth);
        C2Standard = targetTriplet(2) * ones(imheight, imwidth);
        C3Standard = targetTriplet(3) * ones(imheight, imwidth);
        
        switch input.colorspace
            case {'rgb', 'xyz', 'ycbcr', 'yiq'}
                % Create the delta images: delta R, delta G, and delta B.
                % delta X, delta Y, and delta Z.
                % delta Y, delta Cb, and delta Cr.
                % delta Y, delta I, and delta Q.
                deltaC1 = Channel1 - C1Standard;
                deltaC2 = Channel2 - C2Standard;
                deltaC3 = Channel3 - C3Standard;

                deltaC1 = deltaC1 * 255;  
                deltaC2 = deltaC2 * 255;  
                deltaC3 = deltaC3 * 255;
            case 'hsv'
                % Create the delta images: delta H, delta S, and delta V.
                deltaC1 = abs(Channel1 - C1Standard);
                deltaC1 = min(deltaC1, 1 - deltaC1);        
                deltaC2 = Channel2 - C2Standard;
                deltaC3 = Channel3 - C3Standard;
        
                deltaC1 = deltaC1 * 255;  
                deltaC2 = deltaC2 * 255;  
                deltaC3 = deltaC3 * 255; 
            case 'lab'
                % Create the delta images: delta L, delta A, and delta B.
                deltaC1 = Channel1 - C1Standard;
                deltaC2 = Channel2 - C2Standard;
                deltaC3 = Channel3 - C3Standard;
            otherwise
                error('colorSpace must be ''RGB'', ''Lab'', ''HSV'', ''XYZ'', ''YCBCR'', or ''YIQ''');
        end
                
        % Euclidean “distance” in color space
        deltaE = sqrt(deltaC1.^2 + deltaC2.^2 + deltaC3.^2);

        % Threshold and obtain the pixel labels
        pixelLabels  = deltaE <= input.tolerance;
    end

    % Show plots
    if input.ShowPlots
        labelsKmeansPlots(input, Ioriginal, Itransformed, pixelLabels, centroids);
    end
end


% Plotting auxiliary function
function labelsKmeansPlots(input, Ioriginal, Itransformed, pixelLabels, centroids)  
%
%************************************************************************%
%
% Usage: labelsKmeansPlots(input, Ioriginal, Itransformed, pixelLabels, centroids)
% Inputs:   
%           input        - Input struct
%           colorspace   - color segmentation of annotatations by color
%                           space 'rgb' | 'hsv' | 'lab'
%                           (keep 'hsv')
%           input.RGBTriplet - [0,0,255]; % RGB value to segment
%           input.colorspace - 'rgb' % 'rgb' | 'hsv' |'lab'
%           input.tolerance - 70; % tolerance value
%           input.Kmeans - true; % If true uses K-means clustering. 
%                                % Else, uses input.RGBTriplet
%           input.KClusters - 3; % K clusters
%           input.ShowPlots - true; % Show plots
%           Ioriginal    - Input color image
%           Itransformed - RGB, HSV or LAB transformed images
%           pixelLabels  - Output pixels labels
%           centroids    - Cluster color centroids 
%
%
% Outputs:  Plots
%           
%
    % Label overlay
    labImg = labeloverlay(Ioriginal, pixelLabels, 'Colormap','jet'); 
    
    % Get fileparts
    [filepath,name,ext] = fileparts(input.filename);

    % Show figure
    figure;
    t = tiledlayout(1,2,TileSpacing="tight",Padding="compact");
    nexttile; imshow(Ioriginal); title('Original image', FontSize=16);
    nexttile; imshow(labImg); title('Labeled image', FontSize=16);
    
    % Export graphics
    if input.Kmeans
        exportgraphics(gcf, fullfile('assets', ['segmap_' lower(name) '_' input.colorspace '_kmeans' '.png']))
    else
        exportgraphics(gcf, fullfile('assets', ['segmap_' lower(name) '_' input.colorspace '.png']))
    end
    
    if input.Kmeans
        % Convert color space
        switch lower(input.colorspace)
            case 'rgb'
                channelLabels = {'R','G','B'};
            case 'lab'
                % Requires Image Processing Toolbox
                channelLabels = {'L*','a*','b*'};
            case 'hsv'
                channelLabels = {'H','S','V'};
            case 'xyz'
                channelLabels = {'X','Y','Z'};
            case 'ycbcr'
                channelLabels = {'Y','Cb','Cr'};
            case 'yiq'
                channelLabels = {'Y','I','Q'};
            otherwise
                 error('colorSpace must be ''RGB'', ''Lab'', ''HSV'', ''XYZ'', ''YCBCR'', or ''YIQ''');
        end

        % Reshape the data
        [rows, cols, ~] = size(Itransformed);
        IoriData = reshape(Ioriginal, rows*cols, 3);
        ItransData = reshape(Itransformed, rows*cols, 3);
        pixelColors = mat2gray(reshape(Ioriginal, rows*cols, 3));
        
        % Pixel colors for the clusters
        if strcmp(input.colorspace, 'rgb')
            RGBnorm = centroids;  
        elseif strcmp(input.colorspace,'hsv')
            RGBnorm = hsv2rgb(centroids);
        elseif strcmp(input.colorspace,'lab')
            RGBnorm = lab2rgb(centroids);
        elseif strcmp(input.colorspace,'xyz')
            RGBnorm = xyz2rgb(centroids);
        elseif strcmp(input.colorspace,'ycbcr')
            RGBnorm = ycbcr2rgb(centroids);
        else
            RGBnorm = ntsc2rgb(centroids);
        end

        pixelClusterColors = squeeze(ind2rgb(reshape(pixelLabels, rows*cols, 1), RGBnorm));  
        
        % 3D scatter plot of raw pixels color distribution
        figure;
        scatter3(IoriData(:,1), IoriData(:,2), IoriData(:,3), 2, pixelColors, 'filled');
        xlabel(channelLabels{1});
        ylabel(channelLabels{2});
        zlabel(channelLabels{3});
        title('Image pixel color distribution');
        grid on;
        
        % Export graphics
        exportgraphics(gcf, fullfile('assets', ['pixdistrib_' lower(name) '_' input.colorspace '.png']))

        % 3D scatter plot of clustered pixels
        figure;
        scatter3(ItransData(:,1), ItransData(:,2), ItransData(:,3), 2, pixelClusterColors, 'filled');
        xlabel(channelLabels{1});
        ylabel(channelLabels{2});
        zlabel(channelLabels{3});
        title(sprintf('K-means Clustering (%d clusters) in %s space', input.KClusters, upper(input.colorspace)));
        grid on;
        
        % Export graphics
        exportgraphics(gcf, fullfile('assets', ['cluster_' lower(name) '_' input.colorspace '_kmeans' '.png']))
    end
end