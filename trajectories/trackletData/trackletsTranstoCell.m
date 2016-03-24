trajCell = cell(size(trks, 2), 1);
for i = 1 : size(trajCell, 1)
    trajCell{i, 1} = [trks(i).x, 480 - trks(i).y];
end