%cellfun(@(x)trajClusterDistance(x, testVel), ERvels)
% tracks25Aug;
% trajTmp = struct2cell(TRACK);
% trajCell = cell(size(trajTmp, 1), 1);
% for i = 1 : size(trajTmp, 1)
%       traj = trajTmp{i, 1};
%       traj(:, 2) = 480 - traj(:, 2);
%       trajCell{i, 1} = traj(:, 1:2);
% end

% figure()
% for i = 1 : size(trajCell, 1)
%     hold on;
%     plot(trajCell{i, 1}(:, 1), trajCell{i, 1}(:, 2), 'b.');
% end
% title('所有轨迹')

for id = 1 : erNum
    index = find(idx == id);
    figure()
    for i = 1 : length(index)
        hold on;
        plot(trajCell{index(i), 1}(:, 1), trajCell{index(i), 1}(:, 2), 'b.');
    end
    str = ['类别', num2str(id)];
    title(str);
    axis([0 640 0 480]);
end
