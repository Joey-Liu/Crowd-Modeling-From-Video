ErOne = ERvels{1};
xVel = zeros(size(ErOne));
[m, n] = size(ErOne);
for i = 1 : m
    for j = 1 : n
        xVel(i, j) = ErOne{i, j}(1);
    end
end

ErOne = ERvels{1};
yVel = zeros(size(ErOne));
for i = 1 : m
    for j = 1 : n
        yVel(i, j) = ErOne{i, j}(2);
    end
end