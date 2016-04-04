predictedIndex = 133;
figure();
scatter(trajCell{predictedIndex}(:, 1), trajCell{predictedIndex}(:, 2));
axis([0 640 0 500]);
hold off;
len = size(trajCell{predictedIndex}, 1);
x = trajCell{predictedIndex}(1:int32(len / 2), 1);
y = trajCell{predictedIndex}(1:int32(len / 2), 2);
validaTraj = [x, y];

validaSeg = trajectorySegment(validaTraj, delta);
validafVel = transTraj(validaSeg, delta, width, heigth);
validafVelSet{1} = validafVel;
predictedIdx = findClosesetCentroids(validafVelSet, reviseCentroids);
% ����Ԥ���Ŀ��ʹ���ٶȳ�����Ԥ��
% �������ǰλ�����ڵĿ�� curRow, curCol
curX = x(end); curY = y(end);
curCol = int32(curX / delta); curRow = int32(curY / delta);
if(curCol * delta < curX)
    curCol = curCol + 1;
end
if(curRow * delta < curY)
    curRow = curRow + 1;
end
curRow = hn - curRow + 1;

figure(); scatter(x, y);axis([0 640 0 500]);
curPosX = x(end); curPosY = y(end);
while ~outOfBounds(width, heigth, curPosX, curPosY)
    hold on;
    scatter(curPosX, curPosY, 'ro');
    prePosX = curPosX; prePosY = curPosY;
    curPosX = curPosX + reviseCentroids{predictedIdx}{curRow, curCol}(1,1);
    curPosY = curPosY + reviseCentroids{predictedIdx}{curRow, curCol}(1,2);
    if(prePosX == curPosX && curPosY == prePosY)
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