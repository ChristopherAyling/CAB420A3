function  ShowInsideCluster(numberOfClusters,examplesWanted,data,Assignment)
%SHOWINSIDECLUSTER Summary of this function goes here
%   Detailed explanation goes here
%check what is inside each cluster
for class = 1 : numberOfClusters   
    h = figure();
    hold on;
    subplot(1,examplesWanted,1);
    idx = find(Assignment==class);
    count = 1;
    if length(idx) > examplesWanted-1
        for i = 1:examplesWanted
        remakeImage = uint8(reshape(data(idx(i),:,:),[100 100 3]));
        subplot(1,examplesWanted,count);
        imshow(remakeImage)
        count = count + 1; 
        end
    else
        fprintf('not enough examples in this class \n')
        close(h);
    end
    axesscale;
    hold off;
end

