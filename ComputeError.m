function [ Error , highestLabel ] = ComputeError( Assignments , Y_labels )
%COMPUTEERROR computes the error based off the assignment array of the
%clustering
%   Detailed explanation goes here

for class = 1:3
    %find original class index
   class_idx = find(Y_labels==class);
   % find corsponding assignments
   classBelongs = (Assignments(class_idx));
   %find the unique assignments in that portion 
   values = unique(classBelongs);
   %find how many assignments were in a single class
   for i = 1:length(values)
       numberOfAssignments(i) = length( classBelongs(classBelongs == values(i)) );
   end
   [highestAssignments(class),idx] = max(numberOfAssignments);
   highestLabel(class) = idx;
end
Error = 1 - sum(highestAssignments)/length(Y_labels);  
end

