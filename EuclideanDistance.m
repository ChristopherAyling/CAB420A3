function [ distance ] = EuclideanDistance( data , clusterPoints )
%EUCLIDEANDISTANCE calculates the distance between data points and clusters
% using thhe euclidean distance formulate that :
%distance  = sqrt( (data - clusterPoint).^2 )
% distance = double.empty(length(data),length(clusterPoints));
%computer the distance to each clusterPoints over data elements
[r,~] = size(clusterPoints);
for clusterNumber = 1:(r)
    for idx = 1 : length(data)
        distance(idx,clusterNumber) =  sqrt(sum((clusterPoints(clusterNumber,:)- data(idx,:)).^2));
    end
end


end

