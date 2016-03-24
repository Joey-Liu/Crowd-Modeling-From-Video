BlockTrajs = cell(erNum, 1);
index = 1;
for i = 1 : trajNum
    traj = trajCell{i, 1};
    if(traj(1, 1) < 10 && traj(1, 2) > 60 && traj(1, 2) < 250)
        index = 1;
    elseif(traj(1, 1) > 90 && traj(1, 1) < 130 && traj(1, 2) < 90)
        index = 2;
    elseif(traj(1, 1) > 180 && traj(1, 1) < 250 && traj(1, 2) < 90)
        index = 3;
    elseif(traj(1, 1) > 525 && traj(1, 1) < 640 && traj(1, 2) < 90)
        index = 4;
    elseif(traj(1, 1) > 110 && traj(1, 1) < 180 && traj(1, 2) > 430)
        index = 5;
    elseif(traj(1, 1) > 235 && traj(1, 1) < 320 && traj(1, 2) > 430)
        index = 6;
    elseif(traj(1, 1) > 440 && traj(1, 1) < 520 && traj(1, 2) > 430)
        index = 7;
    elseif(traj(1, 1) > 520 && traj(1, 1) < 640 && traj(1, 2) > 430)
        index = 8;
    end
    
    BlockTrajs{index}{end + 1, 1} = traj;
    BlockTrajs{index}{end, 2} = i;
end


ProbilitySRER = zeros(erNum, erNum);
for i = 1 : erNum
    tmp = BlockTrajs{i};
    ind = [tmp{:, 2}]';
    toER = idx(ind);
    for j = 1 : erNum
        if(j == i)
            continue;
        end
        ProbilitySRER(i, j) = sum(toER == j);
    end
end