function [velItem] = initializeVel(ERCenters, gridCenters, i, delta)
% ERCenters is the exits region's center point
% gridCenters represents the center of the grid divided by delta,
% represented by a cell array
%UNDONE

%vel = zeros(size(gridCenters));
[row, col] = size(gridCenters);
velItem = cell(row, col);
%velTmp = cell(row, col);
for k = 1 : row
    for j = 1 : col
        %ATTENTION! ���ｫĿǰͼƬ�е��ϰ����Ѿ�ȷ��
        if((row - k)* delta > 420 && j * delta > 310 && j * delta < 460)
            velItem{k, j} = [0 0];
        else
            velItem{k, j} = faNorm(ERCenters(i, :) - gridCenters{k, j}, delta);
            %velTmp{k, j} = ERCenters(i, :) - gridCenters{k, j};
        end
    end
end

end