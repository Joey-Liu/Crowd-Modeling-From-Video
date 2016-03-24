reviseCentroids = centroids;
omega = 2;
for cnt = 1 : erNum
    testVelCenter = centroids{cnt, 1};
    reviseVel = cell(size(ERvels{1}));
    for j = 1 : wn
        for i = 1 : hn
            % 计算距离权重矩阵
%             weightedMat = zeros(hn, wn);
%             for x = 1 : wn
%                 for y = 1 : hn
%                     weightedMat(y, x) = sqrt(((y - i) * delta)^2 + ((x -j) * delta)^2);
%                 end
%             end
            a = 1 - j : wn - j;  b = 1 - i : hn - i;
            [A, B] = meshgrid(a, b);
            weightedMat = sqrt((A * delta).^2 + (B * delta).^2);
            
            %reviseVel(i, j) = sum(sum(exp( -weightedMat / omega) .* testVel))
            weightedMat = exp(-weightedMat / omega);
            res = [0, 0];
            for m = 1 : hn
                for n = 1 : wn
                    res = res + weightedMat(m, n) * testVelCenter{m, n};
                    if(isnan(res))
                        fprintf('26');
                    end
                end
            end
            %以下的两种向量化并没有加速..
%             res = (arrayfun(@(x)(weightedMat(x)*testVel{x}),1:numel(weightedMat), 'UniformOutput', false));
%             res = cell2mat(res);
%             bv = reshape(res, 2, numel(res) / 2);
%             res = sum(bv, 2);
%             a = arrayfun(@(x)weightedMat(x)*testVel{x},1:numel(weightedMat),'un',0);
%             res = sum(cat(3,a{:}),3);
            reviseVel{i, j} = faNorm(res, delta);
        end
    end
    reviseCentroids{cnt} = reviseVel;
end