# CAB420 Assignment 3 Project Proposal

## Group Members

* Adam Banham N7176546
* Alexander Wilson N9732462
* Christopher Ayling N9713581

## Objective 

To explore the the performance of different machine learning algorithms and architectures in
completing tasks of categorizing images of classes they have never seen before.

Our group hopes to find approaches that can work without the need to extract features or use heavy pre-processing of images before the approach can be used with an impactful effect on the field. 
Often pre-processing is needed due to images having a lot of noise which can occur when all examples aren’t taken with the same environmental settings. 

Lighting, focus, colour and centring of the object are common causes of noise and need to be pre-processed to find meaningful data between all examples.

If these approaches are used in fields like described before this could lead to a new era where information can be extracted from any image to provide new insights into patterns and knowledge which would have taken extreme amounts of work from humans.

Various CNN architectures as well as clustering methods will be implemented.
The results of these will be analysed to see how each method learns and how
well they can generalise to broad classes.

Techniques such as transfer learning will be integrated with the aim of
improving accuracy.

## Dataset Info

The data used to train and evaluate the algorithms will be a subset of the Caltech256 dataset
(http://www.vision.caltech.edu/Image_Datasets/Caltech256/details.html)

The subset contains 8 classes of water animals, 11 classes of air animals and 23 classes of
land animals. Each of these classes contains a minimum of 80 images each.
