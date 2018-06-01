# CAB420 Assignment 3

* Convolutional Neural Networks
* Residual Networks
* Class Activation Mappings

## Dataset

Using a subset of the Caltech256 labelled image dataset we constructed a
dataset containing three classes. The classes are as follows;
land animals, water animals and air animals. Each of these classes is
made up of 9 classes from each of the broader categories from the original
dataset.

*bar graph here* 
Class frequencies per split.

## Motivation
The idea behind this project was to learn about the way convolution neural
networks (CNNs) learn features through applying them to a classification
problem involving classes with alot of internal variance.

## Initial Training
As the motivation of this project is to learn about how convolutional neural
networks learned features, the first task was to train a CNN to study. The
CNN that was trained was a 34 layer Residual Network (ResNet). *Residual
networks are neural networks made of of residual blocks. The purpose of
residual blocks is to allow a deep network to be trained without suffering
from the vanishing gradient problem.*

The vaishing gradient problem ...

How residual blocks fix this ... y = x + f(x)

## Pretrained Model

### Why
The network was instantiated with pretrained weights. These weights are a
result of training performed on the ImageNet dataset *cite*. ImageNet is a
large dataset containing many examples of many difference classes. The
Caltech256 dataset (especially our chosen subset) is very simalar to ImageNet,
meaning that the weights/convolutional filters learned that perform well on
ImageNet will also perform well on Caltech. The process of using pretrained
weights for a new task is known as transfer learning *cite*. Transfer learning
has multiple advantages over random weight initialisation techniques. The
most notable advantage is the faster training time; weights don't need to
change very much for the model to converge.

Pretrained networks also offer a large advantage when learning tasks from
a small dataset. This is because pretrained networks can prevent overfitting
on the small dataset, increasing generalisation capabilities *cit*.

### How
In order to use weights on a new dataset with different classes, the
original model must be altered to facilite this. This is done by simply
altering the final fully connected layers. Using the weights from a
network trained on a task of 50 classes for a task of 25 classes is as
easy as altering the amount of units in the final fully connected (FC) layer.
After altering the network, training must be performed to learn weights
for the new final layer.

The method taken for training a classifier for the subset of the Caltech256
closely follows the methods presented in Fastai's course "Deep Learning For
Coders". Details can be found 


### Finetuning

## Class Activation Mappings

## References

* grad cam paper
* csiro paper
* resnet paper
* fastai
* pytorch
* CNN paper
* Vanishing gradient problem
* ImageNet
* Caltech256
* transfer learning

