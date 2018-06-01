% cleanup
clc; close all; clear;
% import alexnet
net = alexnet;
% image size for alexnet
sz = net.Layers(1).InputSize;
% import caltech
I = imageDatastore('256_ObjectCategories', 'IncludeSubfolders', ...
    true, 'labelSource', 'foldernames');
% split randomly into training and test data (80%, 20%)
[ITrain,ITest] = splitEachLabel(I,0.8,'randomized');
% augment the training data
pixelRange = [-5 5];
rotationRange = [-10, 10];
imageAugmenter = imageDataAugmenter( ...
    'RandXReflection',true, ...
    'RandXTranslation',pixelRange, ...
    'RandYTranslation',pixelRange, ...
    'RandRotation', rotationRange);
AugITrain = augmentedImageDatastore(sz,ITrain, 'ColorPreprocessing',...
    'gray2rgb', 'DataAugmentation', imageAugmenter);
AugITest = augmentedImageDatastore(sz,ITest, 'ColorPreprocessing',...
    'gray2rgb');
%imshow(readimage(ITrain,21)); % show any image code 
% find number of classes
numClasses = 4;
% extract all but last three layers of AlexNet
layersTransfer = net.Layers(1:end-3);
% layers added
layers = [
    layersTransfer
    fullyConnectedLayer(numClasses,'WeightLearnRateFactor',20,'BiasLearnRateFactor',20)
    softmaxLayer
    classificationLayer
];
% options 
options = trainingOptions('sgdm', ...
    'MiniBatchSize',50, ...
    'MaxEpochs',6, ...
    'InitialLearnRate',1e-4, ...
    'ValidationData',AugITest, ...
    'ValidationFrequency',100, ...
    'ValidationPatience',Inf, ...
    'Verbose',false, ...
    'Plots','training-progress');

%% do all the training 

netTransfer = trainNetwork(AugITrain,layers,options);

%% classify all testing images

[YPred,scores] = classify(netTransfer,AugITest);

%% show some classifications in random order

i = randperm(length(ITest.Files));
f = figure();

hold on;
h = 1;
for i = i
    gca = subplot(5,5,h);
    imshow(readimage(ITest, i));
    title(string(YPred(i)));
    gca.Position = gca.Position + [0,0, 0.03, 0.03];
    h = h +1;
    if h == 26 
        
        hold off;
        h=1;
        pause;
        f = figure();
        hold on;
    end
end

%% classify the image test.jpg (which can be changed to any image)
h=1;
%%

if (~exist('netTransfer'))
    load('NeuralNet.mat');
end
   
gca = subplot(5,5,h);
test = imread('test.jpg');
test = imresize(test,sz(1:2));
imshow(test);
[label, score] = classify(netTransfer,test);
title(string(label));
gca.Position = gca.Position + [0,0, 0.03, 0.03];
disp(" ");disp(" ");
disp(score(1)*100 + "% Air");
disp(score(2)*100 + "% Land");
disp(score(3)*100 + "% Plant");
disp(score(4)*100 + "% Water");
h = h+1;