clear; clc
tracks25Aug;
trajTmp = struct2cell(TRACK);
traj25 = cell(size(trajTmp, 1), 1);
for i = 1 : size(trajTmp, 1)
      traj = trajTmp{i, 1};
      traj(:, 2) = 480 - traj(:, 2);
      traj25{i, 1} = traj(:, 1:2);
end

figure()
for i = 1 : 100
    hold on;
    traj = traj25{i, 1};
    scatter(traj(:, 1), traj(:, 2));
end