function [ distance ] = EuclideanDistance( data , clusterPoints )
%EUCLIDEANDISTANCE calculates the distance between data points and clusters
% using thhe euclidean distance formulate that :
%distance  = sqrt( (data - clusterPoint).^2 )
% distance = double.empty(length(data),length(clusterPoints));
%computer the distance to each clusterPoints over data elements
[r1,~] = size(data);
[r2,~] = size(clusterPoints);
for clusterNumber = 1:(r2)
    for idx = 1 : r1
        distance(idx,clusterNumber) =  sqrt(sum((clusterPoints(clusterNumber,:)- data(idx,:)).^2));
    end
end


end

