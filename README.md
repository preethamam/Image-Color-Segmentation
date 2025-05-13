# Image color segmentation
[![View Image color segmentation on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/181134-image-color-segmentation) [![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=preethamam/Image-Color-Segmentation)

This MATLAB-based repository provides a flexible framework for segmenting color images in two complementary ways:

1. **Color Picking**  
   Threshold-based segmentation by selecting a target color vector in one of three color spaces (RGB, HSV, or CIELAB) and isolating pixels within a user-specified tolerance.

2. **K-Means Clustering**  
   Unsupervised segmentation by grouping all pixels in the chosen color space into *k* clusters and visualizing each cluster as a distinct region.

---

## Repository Structure

- **`images/`**  
  Contains six test images covering a variety of textures and subjects:  
  - `Alligator1.jpg`  
  - `Alligator28.jpg`  
  - `fabric.png`  
  - `hestain.png`  
  - `peppers.png`  
  - `Thin39.jpg`

- **`assets/`**  
  Stores generated outputs used in the README demonstration, including:  
  - Segmentation maps from both Color-Picking and K-Means methods  
  - Pixel-value distribution plots  
  - RGB, HSV, and LAB K-Means segmentation maps  
  - Cluster-centroid visualizations for qualitative analysis

---

## Key Scripts

- **`main.m`**  
  - Reads each image from `images/`  
  - Configures parameters (color triplet, tolerance, number of clusters, color space)  
  - Invokes the appropriate segmentation routine  
  - Saves and/or displays results to `assets/`

- **`colorSegment.m`**  
  Implements the Color-Picking approach by:  
  1. Converting the image to the selected color space  
  2. Computing per-pixel Euclidean distance to the user-provided color vector  
  3. Thresholding distances to produce a binary mask and overlay image highlighting segmented regions

- **K-Means Clustering Routine**  
  (Called from `main.m` or helper functions)  
  - Transforms the image into the chosen color space  
  - Applies MATLAB’s `kmeans` function to cluster pixel vectors into *k* groups  
  - Generates a labeled segmentation map and displays each cluster in a unique color

- **`demo.m`**  
  Provides a hands-on example showing:  
  - How to call `colorSegment` with sample RGB triplets and tolerance levels  
  - How to plot pixel distributions (histograms over channel values or distance metrics)  
  - How to perform K-Means segmentation and visualize cluster centroids

---

## Demonstrated Results

For each of the six original images, the README showcases:

1. **Color-Picking Results**  
   - Segmentation maps in RGB, HSV, and LAB  
   - Corresponding pixel-distribution charts to justify the selected tolerance

2. **K-Means Clustering Results**  
   - Segmentation maps for each color space  
   - Visual summaries of each cluster’s centroid color to aid interpretation

---

## Use Cases & Extensions

- **Object or Background Extraction:** Remove unwanted regions by picking their dominant color.  
- **Preprocessing for Computer Vision:** Simplify color heterogeneity before applying feature detectors or classifiers.  
- **Artistic Effects and Color Analysis:** Automatically segment and recolorize images for design or research.  
- **Educational Demonstration:** Illustrate the impact of different color spaces on segmentation quality.

---

# 🖼️ Original Images:

| **Alligator1**<br><img src="images/Alligator1.jpg" width="300"/><br>`Alligator1.jpg` | **Alligator28**<br><img src="images/Alligator28.jpg" width="300"/><br>`Alligator28.jpg` | **Fabric**<br><img src="images/fabric.png" width="300"/><br>`fabric.png` |
|:---:|:---:|:---:|
| **Hestain**<br><img src="images/hestain.png" width="300"/><br>`hestain.png`    | **Peppers**<br><img src="images/peppers.png" width="300"/><br>`peppers.png`    | **Thin39**<br><img src="images/Thin39.jpg" width="300"/><br>`Thin39.jpg`      |


# Labeled images:
## 📊 Color Picking Results

### Segmentation Maps

| Dataset      | RGB                                                             | HSV                                                             | LAB                                                             |
|--------------|-----------------------------------------------------------------|-----------------------------------------------------------------|-----------------------------------------------------------------|
| **alligator1**   | <img src="assets/segmap_alligator1_rgb.png" width="350"/>   | <img src="assets/segmap_alligator1_hsv.png" width="350"/>   | <img src="assets/segmap_alligator1_lab.png" width="350"/>   |
| **alligator28**  | <img src="assets/segmap_alligator28_rgb.png" width="350"/>  | <img src="assets/segmap_alligator28_hsv.png" width="350"/>  | <img src="assets/segmap_alligator28_lab.png" width="350"/>  |
| **fabric**       | <img src="assets/segmap_fabric_rgb.png" width="350"/>       | <img src="assets/segmap_fabric_hsv.png" width="350"/>       | <img src="assets/segmap_fabric_lab.png" width="350"/>       |
| **hestain**      | <img src="assets/segmap_hestain_rgb.png" width="350"/>      | <img src="assets/segmap_hestain_hsv.png" width="350"/>      | <img src="assets/segmap_hestain_lab.png" width="350"/>      |
| **peppers**      | <img src="assets/segmap_peppers_rgb.png" width="350"/>      | <img src="assets/segmap_peppers_hsv.png" width="350"/>      | <img src="assets/segmap_peppers_lab.png" width="350"/>      |
| **thin39**       | <img src="assets/segmap_thin39_rgb.png" width="350"/>       | <img src="assets/segmap_thin39_hsv.png" width="350"/>       | <img src="assets/segmap_thin39_lab.png" width="350"/>       |

### Pixel Distributions

| Dataset      | RGB                                                                 | HSV                                                                 | LAB                                                                 |
|--------------|----------------------------------------------------------------------|----------------------------------------------------------------------|----------------------------------------------------------------------|
| **alligator1**   | <img src="assets/pixdistrib_alligator1_rgb.png" width="350"/>  | <img src="assets/pixdistrib_alligator1_hsv.png" width="350"/>  | <img src="assets/pixdistrib_alligator1_lab.png" width="350"/>  |
| **alligator28**  | <img src="assets/pixdistrib_alligator28_rgb.png" width="350"/> | <img src="assets/pixdistrib_alligator28_hsv.png" width="350"/> | <img src="assets/pixdistrib_alligator28_lab.png" width="350"/> |
| **fabric**       | <img src="assets/pixdistrib_fabric_rgb.png" width="350"/>      | <img src="assets/pixdistrib_fabric_hsv.png" width="350"/>      | <img src="assets/pixdistrib_fabric_lab.png" width="350"/>      |
| **hestain**      | <img src="assets/pixdistrib_hestain_rgb.png" width="350"/>     | <img src="assets/pixdistrib_hestain_hsv.png" width="350"/>     | <img src="assets/pixdistrib_hestain_lab.png" width="350"/>     |
| **peppers**      | <img src="assets/pixdistrib_peppers_rgb.png" width="350"/>     | <img src="assets/pixdistrib_peppers_hsv.png" width="350"/>     | <img src="assets/pixdistrib_peppers_lab.png" width="350"/>     |
| **thin39**       | <img src="assets/pixdistrib_thin39_rgb.png" width="350"/>      | <img src="assets/pixdistrib_thin39_hsv.png" width="350"/>      | <img src="assets/pixdistrib_thin39_lab.png" width="350"/>      |


## 🎨 K-means Clustering Results

### Segmentation Maps after Clustering

| Dataset      | RGB (k-means)                                                        | HSV (k-means)                                                        | LAB (k-means)                                                        |
|--------------|-----------------------------------------------------------------------|-----------------------------------------------------------------------|-----------------------------------------------------------------------|
| **alligator1**   | <img src="assets/segmap_alligator1_rgb_kmeans.png" width="350"/>  | <img src="assets/segmap_alligator1_hsv_kmeans.png" width="350"/>  | <img src="assets/segmap_alligator1_lab_kmeans.png" width="350"/>  |
| **alligator28**  | <img src="assets/segmap_alligator28_rgb_kmeans.png" width="350"/> | <img src="assets/segmap_alligator28_hsv_kmeans.png" width="350"/> | <img src="assets/segmap_alligator28_lab_kmeans.png" width="350"/> |
| **fabric**       | <img src="assets/segmap_fabric_rgb_kmeans.png" width="350"/>      | <img src="assets/segmap_fabric_hsv_kmeans.png" width="350"/>      | <img src="assets/segmap_fabric_lab_kmeans.png" width="350"/>      |
| **hestain**      | <img src="assets/segmap_hestain_rgb_kmeans.png" width="350"/>     | <img src="assets/segmap_hestain_hsv_kmeans.png" width="350"/>     | <img src="assets/segmap_hestain_lab_kmeans.png" width="350"/>     |
| **peppers**      | <img src="assets/segmap_peppers_rgb_kmeans.png" width="350"/>     | <img src="assets/segmap_peppers_hsv_kmeans.png" width="350"/>     | <img src="assets/segmap_peppers_lab_kmeans.png" width="350"/>     |
| **thin39**       | <img src="assets/segmap_thin39_rgb_kmeans.png" width="350"/>      | <img src="assets/segmap_thin39_hsv_kmeans.png" width="350"/>      | <img src="assets/segmap_thin39_lab_kmeans.png" width="350"/>      |

### Cluster Centroids Visualizations

| Dataset      | RGB (k-means)                                                        | HSV (k-means)                                                        | LAB (k-means)                                                        |
|--------------|-----------------------------------------------------------------------|-----------------------------------------------------------------------|-----------------------------------------------------------------------|
| **alligator1**   | <img src="assets/cluster_alligator1_rgb_kmeans.png" width="350"/> | <img src="assets/cluster_alligator1_hsv_kmeans.png" width="350"/> | <img src="assets/cluster_alligator1_lab_kmeans.png" width="350"/> |
| **alligator28**  | <img src="assets/cluster_alligator28_rgb_kmeans.png" width="350"/>| <img src="assets/cluster_alligator28_hsv_kmeans.png" width="350"/>| <img src="assets/cluster_alligator28_lab_kmeans.png" width="350"/>|
| **fabric**       | <img src="assets/cluster_fabric_rgb_kmeans.png" width="350"/>     | <img src="assets/cluster_fabric_hsv_kmeans.png" width="350"/>     | <img src="assets/cluster_fabric_lab_kmeans.png" width="350"/>     |
| **hestain**      | <img src="assets/cluster_hestain_rgb_kmeans.png" width="350"/>    | <img src="assets/cluster_hestain_hsv_kmeans.png" width="350"/>    | <img src="assets/cluster_hestain_lab_kmeans.png" width="350"/>    |
| **peppers**      | <img src="assets/cluster_peppers_rgb_kmeans.png" width="350"/>    | <img src="assets/cluster_peppers_hsv_kmeans.png" width="350"/>    | <img src="assets/cluster_peppers_lab_kmeans.png" width="350"/>    |
| **thin39**       | <img src="assets/cluster_thin39_rgb_kmeans.png" width="350"/>     | <img src="assets/cluster_thin39_hsv_kmeans.png" width="350"/>     | <img src="assets/cluster_thin39_lab_kmeans.png" width="350"/>     |

# Requirements
MATLAB <br />
Image Processing Toolbox <br />
Statistics and Machine Learning Toolbox

# Feedback
Please rate and provide feedback for the further improvements.
