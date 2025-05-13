# Image color segmentation
[![View Image stitching cylindrical/spherical/planar given R and K on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/178979-image-stitching-cylindrical-spherical-planar-given-r-and-k) [![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=preethamam/Image-Stitcher-RK-Matrices-Cylindrical-Spherical-Planar)

# Labeled images:
## 📊 Color Picking Results

<details>
<summary>Pixel Distributions</summary>

| Dataset      | RGB                                                                 | HSV                                                                 | LAB                                                                 |
|--------------|----------------------------------------------------------------------|----------------------------------------------------------------------|----------------------------------------------------------------------|
| **alligator1**   | <img src="assets/pixdistrib_alligator1_rgb.png" width="120"/>  | <img src="assets/pixdistrib_alligator1_hsv.png" width="120"/>  | <img src="assets/pixdistrib_alligator1_lab.png" width="120"/>  |
| **alligator28**  | <img src="assets/pixdistrib_alligator28_rgb.png" width="120"/> | <img src="assets/pixdistrib_alligator28_hsv.png" width="120"/> | <img src="assets/pixdistrib_alligator28_lab.png" width="120"/> |
| **fabric**       | <img src="assets/pixdistrib_fabric_rgb.png" width="120"/>      | <img src="assets/pixdistrib_fabric_hsv.png" width="120"/>      | <img src="assets/pixdistrib_fabric_lab.png" width="120"/>      |
| **hestain**      | <img src="assets/pixdistrib_hestain_rgb.png" width="120"/>     | <img src="assets/pixdistrib_hestain_hsv.png" width="120"/>     | <img src="assets/pixdistrib_hestain_lab.png" width="120"/>     |
| **peppers**      | <img src="assets/pixdistrib_peppers_rgb.png" width="120"/>     | <img src="assets/pixdistrib_peppers_hsv.png" width="120"/>     | <img src="assets/pixdistrib_peppers_lab.png" width="120"/>     |
| **thin39**       | <img src="assets/pixdistrib_thin39_rgb.png" width="120"/>      | <img src="assets/pixdistrib_thin39_hsv.png" width="120"/>      | <img src="assets/pixdistrib_thin39_lab.png" width="120"/>      |

</details>

<details>
<summary>Segmentation Maps</summary>

| Dataset      | RGB                                                             | HSV                                                             | LAB                                                             |
|--------------|-----------------------------------------------------------------|-----------------------------------------------------------------|-----------------------------------------------------------------|
| **alligator1**   | <img src="assets/segmap_alligator1_rgb.png" width="120"/>   | <img src="assets/segmap_alligator1_hsv.png" width="120"/>   | <img src="assets/segmap_alligator1_lab.png" width="120"/>   |
| **alligator28**  | <img src="assets/segmap_alligator28_rgb.png" width="120"/>  | <img src="assets/segmap_alligator28_hsv.png" width="120"/>  | <img src="assets/segmap_alligator28_lab.png" width="120"/>  |
| **fabric**       | <img src="assets/segmap_fabric_rgb.png" width="120"/>       | <img src="assets/segmap_fabric_hsv.png" width="120"/>       | <img src="assets/segmap_fabric_lab.png" width="120"/>       |
| **hestain**      | <img src="assets/segmap_hestain_rgb.png" width="120"/>      | <img src="assets/segmap_hestain_hsv.png" width="120"/>      | <img src="assets/segmap_hestain_lab.png" width="120"/>      |
| **peppers**      | <img src="assets/segmap_peppers_rgb.png" width="120"/>      | <img src="assets/segmap_peppers_hsv.png" width="120"/>      | <img src="assets/segmap_peppers_lab.png" width="120"/>      |
| **thin39**       | <img src="assets/segmap_thin39_rgb.png" width="120"/>       | <img src="assets/segmap_thin39_hsv.png" width="120"/>       | <img src="assets/segmap_thin39_lab.png" width="120"/>       |

</details>


## 🎨 K-means Clustering Results

<details>
<summary>Cluster Centroids Visualizations</summary>

| Dataset      | RGB (k-means)                                                        | HSV (k-means)                                                        | LAB (k-means)                                                        |
|--------------|-----------------------------------------------------------------------|-----------------------------------------------------------------------|-----------------------------------------------------------------------|
| **alligator1**   | <img src="assets/cluster_alligator1_rgb_kmeans.png" width="120"/> | <img src="assets/cluster_alligator1_hsv_kmeans.png" width="120"/> | <img src="assets/cluster_alligator1_lab_kmeans.png" width="120"/> |
| **alligator28**  | <img src="assets/cluster_alligator28_rgb_kmeans.png" width="120"/>| <img src="assets/cluster_alligator28_hsv_kmeans.png" width="120"/>| <img src="assets/cluster_alligator28_lab_kmeans.png" width="120"/>|
| **fabric**       | <img src="assets/cluster_fabric_rgb_kmeans.png" width="120"/>     | <img src="assets/cluster_fabric_hsv_kmeans.png" width="120"/>     | <img src="assets/cluster_fabric_lab_kmeans.png" width="120"/>     |
| **hestain**      | <img src="assets/cluster_hestain_rgb_kmeans.png" width="120"/>    | <img src="assets/cluster_hestain_hsv_kmeans.png" width="120"/>    | <img src="assets/cluster_hestain_lab_kmeans.png" width="120"/>    |
| **peppers**      | <img src="assets/cluster_peppers_rgb_kmeans.png" width="120"/>    | <img src="assets/cluster_peppers_hsv_kmeans.png" width="120"/>    | <img src="assets/cluster_peppers_lab_kmeans.png" width="120"/>    |
| **thin39**       | <img src="assets/cluster_thin39_rgb_kmeans.png" width="120"/>     | <img src="assets/cluster_thin39_hsv_kmeans.png" width="120"/>     | <img src="assets/cluster_thin39_lab_kmeans.png" width="120"/>     |

</details>

<details>
<summary>Segmentation Maps after Clustering</summary>

| Dataset      | RGB (k-means)                                                        | HSV (k-means)                                                        | LAB (k-means)                                                        |
|--------------|-----------------------------------------------------------------------|-----------------------------------------------------------------------|-----------------------------------------------------------------------|
| **alligator1**   | <img src="assets/segmap_alligator1_rgb_kmeans.png" width="120"/>  | <img src="assets/segmap_alligator1_hsv_kmeans.png" width="120"/>  | <img src="assets/segmap_alligator1_lab_kmeans.png" width="120"/>  |
| **alligator28**  | <img src="assets/segmap_alligator28_rgb_kmeans.png" width="120"/> | <img src="assets/segmap_alligator28_hsv_kmeans.png" width="120"/> | <img src="assets/segmap_alligator28_lab_kmeans.png" width="120"/> |
| **fabric**       | <img src="assets/segmap_fabric_rgb_kmeans.png" width="120"/>      | <img src="assets/segmap_fabric_hsv_kmeans.png" width="120"/>      | <img src="assets/segmap_fabric_lab_kmeans.png" width="120"/>      |
| **hestain**      | <img src="assets/segmap_hestain_rgb_kmeans.png" width="120"/>     | <img src="assets/segmap_hestain_hsv_kmeans.png" width="120"/>     | <img src="assets/segmap_hestain_lab_kmeans.png" width="120"/>     |
| **peppers**      | <img src="assets/segmap_peppers_rgb_kmeans.png" width="120"/>     | <img src="assets/segmap_peppers_hsv_kmeans.png" width="120"/>     | <img src="assets/segmap_peppers_lab_kmeans.png" width="120"/>     |
| **thin39**       | <img src="assets/segmap_thin39_rgb_kmeans.png" width="120"/>      | <img src="assets/segmap_thin39_hsv_kmeans.png" width="120"/>      | <img src="assets/segmap_thin39_lab_kmeans.png" width="120"/>      |

</details>


# Requirements
MATLAB <br />
Image Processing Toolbox <br />
Statistics and Machine Learning Toolbox

# Feedback
Please rate and provide feedback for the further improvements.
