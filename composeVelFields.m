function [velCom, countCentroids] = composeVelFields(velA, velB, countCentroids)
%velA ans velB are cell arrays, velCom is cell arrays
%CountCentroids is for the algorithm
[m, n] = size(velA);
velCom = cell(m, n);

for i = 1 : m
    for j = 1 : n
%         if(i == 22 && j== 10)
%             fprintf('What sdfsdf\n');
%         end
        %��������ٶȳ�Ϊ0������ ˵�����ϰ�������м���
        if(velA{i, j} == [0 0])
            velCom{i, j} = [0 0];
            continue;
        end
        velCom{i, j} = velA{i, j} + velB{i, j};
        if(velB{i, j} ~= [0, 0])
            countCentroids(i, j) = countCentroids(i, j) + 1;
        end
    end
end


end

