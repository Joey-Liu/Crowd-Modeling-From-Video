function [nextCentroids] = computeCentroids(fVels, idx, centroids)
%Centroids is a cell array, each element is a grid(vel field)

K = size(centroids, 1);
%nextCentroids 在原有的基础之上进行变化
nextCentroids = centroids;

for i = 1 : K
    %Compute the I matrix in page 4
    %First caculate the centroid
    countCentroids = ones(size(fVels{1}));
    [m, n] = find(cellfun(@(x)isequal(x, [0 0]), nextCentroids{i}));
    for index = 1 : length(m)
        countCentroids(m(index), n(index)) = 0;
    end

    index = find(idx == i);
    for j = 1 : length(index)
        [nextCentroids{i}, countCentroids] = composeVelFields(nextCentroids{i}, fVels{index(j)}, countCentroids);
    end
    
    %Last step, do the special operation
    for m = 1 : size(countCentroids, 1)
        for n = 1 : size(countCentroids, 2)
            if(0 == countCentroids(m,n))
                continue;
            end
            nextCentroids{i}{m, n} = nextCentroids{i}{m, n} / countCentroids(m, n);
        end
    end

end

