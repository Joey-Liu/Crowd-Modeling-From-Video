function [distance] = clusterCentroidsDistance(oldCent, preCent)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
% [row, col] = size(oldCent);
% distance = 0;
% for i = 1 : row
%     for j =1 : col
%         tmp = oldCent{i, j} - preCent{i, j};
%         distance = distance + tmp * tmp';
%     end
% end
distance = 0;
erNum = size(oldCent, 1);
[row, col] = size(oldCent{1,1});
for k = 1 : erNum
    oc = oldCent{k, 1}; pc = preCent{k, 1};
    for i = 1 : row
        for j = 1 : col
            tmp = oc{i, j} - pc{i, j};
            a = distance;
            distance = distance + sqrt(tmp * tmp');
%             if(isnan(distance))
%                 fprintf('Crap!\n');
%             end
        end
    end
end


end

