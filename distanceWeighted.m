% ����֮��Եõ����ٶȳ���������
% �������߼��������Ȩ�صľ���
hn = 48; wn = 64;
% distanceWeighted = cell(hn, wn);
% distanceWeighted(:, :) = {zeros(hn, wn)};
% for i = 1 : hn
%     for j = 1 : wn
%     end
% end
%distanceWeighed(i, j)��ʾ���������j ���������iʱ�ľ���
delta = 10;
%distWeighted = zeros(hn, wn);
% for i = 1 : hn
%     for j = 1 : wn
%         distWeighted(i, j) = sqrt((i * delta)^2 + (j * delta)^2);
%     end
% end
a = [1 : wn]; b = [1 : hn];
[A, B] = meshgrid(a, b);
distanceWeightedMat = sqrt((A * delta)^2 + (B * delta).^2);