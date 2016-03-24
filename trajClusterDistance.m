function [distance] = trajClusterDistance(ERVelItem, fVelItem)
% ERVelItem and fVelItem (vel fields)are cell arrays, ths distance is
% scaler
[row, col] = size(ERVelItem);
distance = 0.0;
for i = 1 : row
    for j = 1 : col
        % �������ٶȳ���Ϊ0�����ĸ���
        if([0, 0] == fVelItem{i, j})
            continue;
        end
        tmp = ERVelItem{i, j} - fVelItem{i, j};
        distance = distance + sqrt(tmp * tmp');
    end
end

end

