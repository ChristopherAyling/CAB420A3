function [redAssignment,greenAssignment,blueAssignment,Error] = KmeansLearner(redX,greenX,blueX,numberOfClusters,labels)
%KMEANSLEARNER Performs K means clustering over RGB data spilt and given 
[ redCentroids ] = InitCentroids( redX , numberOfClusters , 1 );
[ greenCentroids ] = InitCentroids( greenX , numberOfClusters , 1 );
[ blueCentroids ] = InitCentroids( blueX , numberOfClusters  , 1);
% preform initiallisation assignment
[ blueAssignment ] = AssignToClosest( blueX ,  blueCentroids );
[ greenAssignment ] = AssignToClosest( greenX ,  greenCentroids );
[ redAssignment ] = AssignToClosest( redX ,  redCentroids );
%compute steps of centroids
K = 30;
%step the centroids based off assignment
Error  = zeros(K,numberOfClusters);
for k = 1:K
    %compute the new centriods means
    for class = 1:numberOfClusters
       redCentroids(class,:) = mean(redX(redAssignment == class));
       greenCentroids(class,:) = mean(greenX(greenAssignment == class));
       blueCentroids(class,:) = mean(blueX(blueAssignment == class));
    end
    %compute new assignments
    [ redAssignment ] = AssignToClosest( redX ,  redCentroids );
    [ greenAssignment ] = AssignToClosest( greenX ,  greenCentroids );
    [ blueAssignment ] = AssignToClosest( blueX ,  blueCentroids );
    %check errors of current iteration of centroids
    [ Error(k,1) , ~ ] = ComputeError( redAssignment , labels );
    [ Error(k,2) , ~ ] = ComputeError( greenAssignment , labels );
    [ Error(k,3) , ~ ] = ComputeError( blueAssignment , labels );
    fprintf('iteration %d complete \n',k)
end
fprintf('the current step iteration of %d is complete \n',K)
end

