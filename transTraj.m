function [grid] = transTraj(traj, delta, width, heigth)
%traj is represented by a n * 2 matrix while delta, width and heigth are
%scaler. Here we assume that width % delta == 0 && heigth % delta == 0
%初始化
wn = width / delta; hn = heigth / delta;
%grid = zeros(wn, hn);
grid = cell(hn, wn);
grid(:, :) = {[0, 0]};

%对含有segmentPoint的格子进行赋值
trajLength = size(traj, 1);
for i = 1 : trajLength - 1
    w = int32(traj(i, 1) / delta);
    h = int32(traj(i, 2) / delta);
    %当点在边界上时， 点应该属于左方（或下方区域） 如delta = 10时， 0 - 10 属于区域1
    if(w * delta < traj(i, 1))
        w = w + 1;
    end
    if(h * delta < traj(i, 2))
        h = h + 1;
    end
    
    vec = traj(i + 1, :) - traj(i, :);
    grid{hn - h + 1, w} = faNorm(vec, delta);
end

end