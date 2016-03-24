function [segs] = trajectorySegment(traj ,delta)
% segs is the segment points, represented by a n * 2 matrix
% traj is represented by m * 2 matrix, delta is scalar
%TESTED
trajLength = size(traj, 1);
segs = zeros(trajLength, 2);
k = 1;
for i = 1 : trajLength
    if(1 == i || i == trajLength)
        segs(k, :) = traj(i, :);
        if(1 == i)
            k = k + 1;
        end
    else
        tmp = segs(k - 1, :) - traj(i, :);
        distance = sqrt(tmp * tmp');
        if (distance > sqrt(2) * delta)
            segs(k, :) = traj(i, :);
            k = k + 1;
        end
    end
end

if(k < trajLength)
    segs(k + 1:end, :) = [];
end
end