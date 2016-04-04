%clear; clc
%load('trajData.mat');
% tracks24Aug;
% trajTmp = struct2cell(TRACK);
% trajCell = cell(size(trajTmp, 1), 1);
% for i = 1 : size(trajTmp, 1)
%       traj = trajTmp{i, 1};
%       traj(:, 2) = 480 - traj(:, 2);
%       trajCell{i, 1} = traj(:, 1:2);
% end
load traj26
trajCell = traj26;
%% ===============================part I Initialization====================
width = 640; heigth = 480;
delta = 20;
wn = width / delta; hn = heigth / delta;
gridCenters = cell(hn, wn);
%ERCenters = [118 34;300 470;614 40;520 470];
%ERCenters = [150 460;300 470;500 470;610 470;10 200;120 30;250 50;600 50];
%坐标轴x , y 坐标
ERCenters = [25, 275
              130 50
              260 50
              630 50
              100 450
              270 450
              500 450
              600 450
              630 300];
%ERCenters(:, 2) = heigth - ERCenters(:, 2);
erNum = size(ERCenters, 1);
trajNum = size(trajCell, 1);

%============================对轨迹进行分段====================
%TESTED
segs = cell(trajNum, 1);
for i = 1 : trajNum
    segs{i, 1} = trajectorySegment(trajCell{i, 1}, delta);    
end

%===========================初始化格子中心=====================
%这里使用的是x，y坐标
% for i = 1 : hn
%     for j = 1 : wn
%         gridCenters{i, j} = [(wn - i + 0.5) * delta, (hn - j + 0.5) * delta];
%     end
% end
%TESTED
for j = 1 : wn
    for i = 1 : hn
        gridCenters{i, j} = [(j - 0.5) * delta, (hn - i + 0.5) * delta];
    end
end

%===========================初始化出口速度场======================
%TESTED
ERvels = cell(erNum, 1);
for i = 1 : erNum
    ERvels{i, 1} = initializeVel(ERCenters, gridCenters, i, delta);
end

%==========================对每条轨迹进行转化======================
%TESTED
fVels = cell(trajNum, 1);
for i = 1 : trajNum
    %fVels{i, 1} = transTraj(trajCell{i, 1}, delta, width, heigth);
    fVels{i, 1} = transTraj(segs{i, 1}, delta, width, heigth);
end

%% ========================part II K-means training precedure=====================
maxIteration = 10;
[centroids, idx] = runkMeans(fVels, ERvels, maxIteration);

% 聚类之后对得到的速度场进行修正
% 首先离线计算出距离权重的矩阵 计算量太大
%distanceWeighed(i, j)表示横坐标相差j 纵坐标相差i时的距离
% a = [1 : wn]; b = [1 : hn];
% [A, B] = meshgrid(a, b);
% distanceWeightedMat = sqrt((A * delta).^2 + (B * delta).^2);
% %行相同时， 仅列之间有差别
% cWeightedVec = a * delta;
% rWeightedVec = b * delta;
% 
% omega = 2;
% for i = 1 : erNUM
%     ERvels{i, 1} = reviseERvel(ERvels{i, 1}, distanceWeightedMat,cWeightedVec, rWeightedVec, omega, delta);
%x end

% 优化,向量化  之前实现
reviseCentroids = centroids;
omega = 2;
for cnt = 1 : erNum
    testVelCenter = centroids{cnt};
    reviseVel = cell(size(testVelCenter));
    for j = 1 : wn
        for i = 1 : hn
            if(testVelCenter{i, j} == [0 0])
                res = [0 0];
            else
                % 计算距离权重矩阵
                a = 1 - j : wn - j;  b = 1 - i : hn - i;
                [A, B] = meshgrid(a, b);
                weightedMat = sqrt((A * delta).^2 + (B * delta).^2);
                
                %reviseVel(i, j) = sum(sum(exp( -weightedMat / omega) .* testVel))
                weightedMat = exp(-weightedMat / omega);
                res = [0, 0];
                for m = 1 : hn
                    for n = 1 : wn
                        res = res + weightedMat(m, n) * testVelCenter{m, n};
                    end
                end
                %以下的两种向量化并没有加速..
                %             res = (arrayfun(@(x)(weightedMat(x)*testVel{x}),1:numel(weightedMat), 'UniformOutput', false));
                %             res = cell2mat(res);
                %             bv = reshape(res, 2, numel(res) / 2);
                %             res = sum(bv, 2);
                %             a = arrayfun(@(x)weightedMat(x)*testVel{x},1:numel(weightedMat),'un',0);
                %             res = sum(cat(3,a{:})
            end
            reviseVel{i, j} = faNorm(res, delta);
        end
    end
    reviseCentroids{cnt} = reviseVel;
end

%% =========================Part III 产生概率表并仿真预测=====================
%SRERProbilities = getSRERProbilities(idx, erNum, trajCell, trajNum);

