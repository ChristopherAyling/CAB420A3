function [ centroids ] = InitCentroids( data , numberOfClusters , method )
%INITCENTROIDS randomally chooses a cnetroids for clusters based off data
%and number of clusters , will choose an example that exists in data
%The purpose of this function is to find the best clusters so that the
%distance between each one is farest from each other
 [r, ~ ] = size(data);
% centroids = int8.empty(numberOfClusters,c);
if method == 1
    Idx = randperm(r);
    for i = 1:numberOfClusters
        %select a random example and make it a centroid
        centroids(i,:) = data(Idx(i),:);
    end
end
if method == 2
    %grab a random data element as frist centroid
    firstClusterIDX = randi(r);
    centroids(1,:) = data(firstClusterIDX,:);
    %now search for the next data point which is farest from each other cluster
    for cluster = 2:numberOfClusters
    clusterIDX = -1;
    %compute distance of each data point to new centroid
    distances =  EuclideanDistance( data , centroids(cluster-1,:) );
    %find the data point with the most distances
    [value,idx] = max(distances);
    fprintf('The max distance to the %d cluster is %2.4f \n',cluster,value)
    clusterIDX = idx;
    %set the new centroid to the found data point
    centroids(end+1,:) = data(clusterIDX,:);
    end
    
end

end

