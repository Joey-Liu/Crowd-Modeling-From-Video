function [centroids, idx] = runkMeans(fVels, initialCentroids, maxIters)
%runkMeans returns centroids, a k*2 matrix of the computed centroids and
%idx, a m*1 vector of centroid assignments
% NOTE: initialCentroids is a cell array, each element is a grid(vel field)
 
m = size(fVels, 1);
K = size(initialCentroids, 1);
centroids = initialCentroids;
%previousCentroids = centroids;
idx = zeros(m, 1);

for i = 1 : maxIters
    %Output progress
    fprintf('K-means iteration %d/%d...\n', i, maxIters);
    idx = findClosesetCentroids(fVels, centroids);
    
    %Gice the memberships, com[ute new centroids
    oldCentroids = centroids;
    centroids = computeCentroids(fVels, idx, oldCentroids);
%     shift = clusterCentroidsDistance(oldCentroids, centroids);
%     fprintf('shift distance of centroids %d\n', shift);
end

end

