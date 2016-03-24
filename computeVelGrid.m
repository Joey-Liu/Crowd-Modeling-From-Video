function [velItemComp] = computeVelGrid(dWM, cW, rW, r, c, ERvel, delta)
%x,y �ǽ�Ҫ�޸ĵ��ٶȿ�����꣨ʹ��r,c����(��������)��ʾ��
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

