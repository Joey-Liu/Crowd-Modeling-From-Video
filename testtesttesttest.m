% dd = zeros(4, 1);
% testVel = fVels{1, 1};
% for i = 1 : 4
%     dd(i) = trajClusterDistance(ERvels{i, 1}, testVel);
% end
% 
% d =[8           9
%     9           6
%     1           1];
% 

reviseCentroids = centroids;
omega = 2;
for cnt = 1 : erNum
    testVel = centroids{cnt, 1};
    reviseVel = cell(size(ERvels{1}));
    for j = 1 : wn
        for i = 1 : hn
            % º∆À„æ‡¿Î»®÷ÿæÿ’Û
%             weightedMat = zeros(hn, wn);
%             for x = 1 : wn
%                 for y = 1 : hn
%                     weightedMat(y, x) = sqrt(((y - i) * delta)^2 + ((x -j) * delta)^2);
%                 end
%             end
%            a = 1-j : 1- wn; b = 1 - i : 1 - hn;
            a = 1 - j : wn - j;  b = 1 - i : hn - i;
            [A, B] = meshgrid(a, b);
            weightedMat = sqrt((A * delta).^2 + (B * delta).^2);
            
            %reviseVel(i, j) = sum(sum(exp( -weightedMat / omega) .* testVel))
            weightedMat = exp(-weightedMat / omega);
            res = [0, 0];
            for m = 1 : hn
                for n = 1 : wn
                    res = res + weightedMat(m, n) * testVel{m, n};
                end
            end
            %cellfun(@(x), )
            reviseVel{i, j} = faNorm(res, delta);
        end
    end
    reviseCentroids{cnt} = reviseVel;
end