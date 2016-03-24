function [predictedId] = predictTraj(predictedIndex, trajCell, reviseCentroids, width, heigth, delta)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
figure();
scatter(trajCell{predictedIndex}(:, 1), trajCell{predictedIndex}(:, 2));
axis([0 width+10 0 heigth + 10]);
hold off;
len = size(trajCell{predictedIndex}, 1);
x = trajCell{predictedIndex}(1:int32(len / 2), 1);
y = trajCell{predictedIndex}(1:int32(len / 2), 2);
validaTraj = [x, y];

validaSeg = trajectorySegment(validaTraj, delta);
validafVel = transTraj(validaSeg, delta, width, heigth);
validafVelSet{1} = validafVel;
predictedId = findClosesetCentroids(validafVelSet, reviseCentroids);
% 根据预测的目标使用速度场进行预测
% 计算出当前位置所在的块儿 curRow, curCol
hn = heigth / delta;
curX = x(end); curY = y(end);
curCol = int32(curX / delta); curRow = int32(curY / delta);
if(curCol * delta < curX)
    curCol = curCol + 1;
end
if(curRow * delta < curY)
    curRow = curRow + 1;
end
curRow = hn - curRow + 1;

figure(); scatter(x, y);axis([0 width+10 0 heigth + 10]);
curPosX = x(end); curPosY = y(end);
while ~outOfBounds(width, heigth, curPosX, curPosY)
    hold on;
    scatter(curPosX, curPosY, 'bx');
    oldX = curPosX; oldY = curPosY;
    curPosX = curPosX + reviseCentroids{predictedId}{curRow, curCol}(1,1);
    curPosY = curPosY + reviseCentroids{predictedId}{curRow, curCol}(1,2);
    if(oldX == curPosX && oldY == curPosY)
        break;
    end
    
    fprintf('\nProgram paused. Press enter to continue.\n');
    pause;
    curCol = int32(curPosX / delta); curRow = int32(curPosY / delta);
    if(curCol * delta < curX)
        curCol = curCol + 1;
    end
    if(curRow * delta < curY)
        curRow = curRow + 1;
    end
    curRow = hn - curRow + 1;
end

end