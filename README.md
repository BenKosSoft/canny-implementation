# Canny Edge Detector Implementation

MATLAB implementation for Canny edge detector, including example input and outputs

**Implemented by:**

* @mbenlioglu
* @mertkosan

## About

This project covers a custom implementation of John F. Canny's edge detection algorithm and some experimental improvements
explainedin the articles of [Zhou et al (2011)](/docs/articles/An_Improved_Canny_Algorithm_for_Edge_Detection.pdf) and
[Tao and Yue-hong (2015)](/docs/articles/Improvement_and_Implementation_for_Canny_Edge_Detection.pdf). The implementation includes:

* **Pre-processing**
    Gray-scale conversion and double precision to improve image's reliability
    
* **Smoothing**
    Eliminating possible noise using a smoothing kernel (Gaussian kernel in this case)

* **Derivation**
    Edge detection step along x & y axes.

* **Non-max Suppression**
    First signature step of Canny's algorithm, which makes the detected edge length to 1 pixel.

* **Hysteresis Thresholding**
	Second signature step of Canny's algorithm, which keeps the weak edges if they're neighbouring strong edges and eliminate
	otherwise.

In addition classical methods of implementing these steps, there is also other ways of thresholding (such as otsu thresholding)
is tried to obtain different results for comparison.

#### _System architecture followed for the project:_
![System Architecture Img](/docs/img/SysArch.png)

For further information refer to [final report of the project](/docs/report/FinalReport.pdf)

## Getting Started

* The entry-point of the project is the file _"thecleverguy.m"_. Running this file should automatically use needed scripts from
the repository or from the MATLAB library.
 
* Input image is can be changed by modifying the 9<sup>th</sup> line of the _"thecleverguy.m"_ which is the following:
 
 ```javascript
 img = imread('images\Taryn Harbridge.png');
 ```
