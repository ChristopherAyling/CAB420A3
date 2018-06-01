function [redAssignment,greenAssignment,blueAssignment] = ExploreCluster(ClusterData,ClusterLabels)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%spilt X into RGB data
ClusterRed = ClusterData(:,:,1);
ClusterGreen = ClusterData(:,:,2);
ClusterBlue = ClusterData(:,:,3);
%set the number of clusters wanted
numberOfClusters = 3;
%Run the k means clustering previous used on on the larger set
[redAssignment,greenAssignment,blueAssignment,Error] = KmeansLearner(ClusterRed,ClusterGreen,ClusterBlue,numberOfClusters,ClusterLabels);
%check whats going on with each cluster
examplesWanted = 10;
% The red pixel range only makes one clear cluster
    fprintf('This is the breakdown of clusters inside red pixel range \n')
    ShowInsideCluster(numberOfClusters,examplesWanted,ClusterData,redAssignment);
    fprintf('This is the end for inside red pixel range \n')
% green pixel range only makes one clear cluster
%     fprintf('This is the breakdown of clusters inside green pixel range \n')
%     ShowInsideCluster(numberOfClusters,examplesWanted,ClusterData,greenAssignment);
%     fprintf('This is the end for inside green pixel range \n')
% the blue range only makes two clear clusters
    fprintf('This is the breakdown of clusters inside blue pixel range \n')
    ShowInsideCluster(numberOfClusters,examplesWanted,ClusterData,blueAssignment);
    fprintf('This is the end for inside blue pixel range \n')
%plot the error graph
figure();
hold on;
plot(1:30,Error(:,1),'r');
plot(1:30,Error(:,2),'g');
plot(1:30,Error(:,3),'b');
legend('red error rate','green error rate','blue error rate');
title('Accuracy of groups over iterations');
xlabel('iteration')
ylabel('error rate')
hold off;
end

