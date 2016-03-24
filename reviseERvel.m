function [velItem] = reviseERvel(ERvel, distanceWeightedMat,cW, rW ,omega, delta)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

velItem = cell(size(ERvel));
velItem(:, :) = {[0, 0]};
dWM = exp(-distanceWeightedMat / omega);
cW = exp(-cW / omega);
rW = exp(-rW / omega);

for i = 1 : size(velItem , 1)
    for j = 1 : size(velItem, 2)
        %velItem(i, j) = cellfun((), ERvel);
        velItem{i, j} = computeVelGrid(dWM, cW, rW, i, j, ERvel, delta);
    end
end

end

