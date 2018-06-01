function [ ClusterAssignment ] = AssignToClosest( data ,  clusters )
%ASSIGNTOCLOSEST creates an assignment index vector where each row shows
%that examples beloning cluster
%for each cluster compute exmaples distance to cluster point
[distances] = EuclideanDistance( data , clusters );
%find the closest cluster to each point and assignment it to that cluster
[~,ClusterAssignment] = min(distances,[],2);
end

