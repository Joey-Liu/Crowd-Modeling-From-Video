function idx = findClosesetCentroids(fVels, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])

%K = size(centroids, 1);
idx = zeros(size(fVels, 1), 1);

for i = 1 : size(fVels, 1)
%    fVelItem = fVels{i ,1};
%    mini = trajClusterDistance(centroids{1 ,1}, fVelItem);
%    idx(i) = 1;
%    %代码向量化之前先这样做
%    for j = 2 : size(centroids, 1)
%        tmp = trajClusterDistance(centroids{j, 1}, fVelItem);
%        if(tmp < mini)
%            idx(i) = j;
%            mini = tmp;
%        end
%    end
    %cellfun(@(x)trajClusterDistance(x, testVel), ERvels);
    [tmp, idx(i)] = min(cellfun(@(x)trajClusterDistance(x, fVels{i, 1}), centroids));
end

end

