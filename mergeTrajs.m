trajAug2425 = cell(size(traj24, 1) + size(traj25, 1), 1);
for i = 1 : size(traj24, 1)
    trajAug2425{i, 1} = traj24{i, 1};
end

i = i + 1;
while i <= size(trajAug2425, 1)
    trajAug2425{i, 1} = traj25{i - size(traj24, 1), 1};
    i = i + 1;
end