function [res] = outOfBounds(width, heigth, curPosX, curPosY)
% width heigth分别为图像的宽和高度， curPosX, curPosY 指的是笛卡尔坐标系， 不是图像坐标
if(curPosX < 0 || curPosX > width || ...
        curPosY < 0 || curPosY > heigth)
    res = true;
else
    res = false;
end
end

