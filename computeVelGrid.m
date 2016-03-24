function [velItemComp] = computeVelGrid(dWM, cW, rW, r, c, ERvel, delta)
%x,y 是将要修改的速度块的坐标（使用r,c坐标(数组索引)表示）
%   Detailed explanation goes here
[row, col] = size(ERvel);
velItemComp = [0, 0];
for i = 1 : row
    for j = 1 : col
        if (r == i && c == j)
            velItemComp = velItemComp + ERvel{i,j};
        elseif(c == j)
            velItemComp = velItemComp + ERvel{i,j} * rW(abs(r - i));
        elseif(r == i)
            velItemComp = velItemComp + ERvel{i,j} * cW(abs(c - j));
        else
            velItemComp = velItemComp + ERvel{i,j} * dWM(abs(r - i), abs(c - j));
        end
    end
end
velItemComp = faNorm(velItemComp, delta);

end

