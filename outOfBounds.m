function [res] = outOfBounds(width, heigth, curPosX, curPosY)
% width heigth�ֱ�Ϊͼ��Ŀ�͸߶ȣ� curPosX, curPosY ָ���ǵѿ�������ϵ�� ����ͼ������
if(curPosX < 0 || curPosX > width || ...
        curPosY < 0 || curPosY > heigth)
    res = true;
else
    res = false;
end
end

