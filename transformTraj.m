%clear; clc
%tracks26Aug;
% trajTmp = struct2cell(TRACK);
% traj26 = cell(size(trajTmp, 1), 1);
% for i = 1 : size(trajTmp, 1)
%       traj = trajTmp{i, 1};
%       traj(:, 2) = 480 - traj(:, 2);
%       traj26{i, 1} = traj(:, 1:2);
% end

figure()
for i = 1 : size(traj26, 1)
    hold on;
    traj = traj26{i, 1};
    plot(traj(:, 1), traj(:, 2), 'b.');
end