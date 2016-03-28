function [xVel, yVel] = saveCentroid(centroid)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
xVel = zeros(size(centroid));
yVel = zeros(size(centroid));
[m, n] = size(centroid);
for i = 1 : m
    for j = 1 : n
        xVel(i, j) = centroid{i, j}(1);
        yVel(i, j) = centroid{i, j}(2);
    end
end
end