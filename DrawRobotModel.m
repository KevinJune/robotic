function DrawRobotModel(scara,six_axis)
figure(2);
scara.plotopt ={'workspace',[-0.8 1.8 -1 1 -0.5 1.5]};
figure(2);
scara.plot([0.5*pi 0 0.2 0]);
hold on;
% scara.teach %�򿪸��ؽڵ����������ڵ��ڸ��ؽڱ���ֵ
six_axis.base = transl(0.8,0,0.3);                    %�ϵ�  �ڵڶ���������ʾ�����е��
six_axis.tool = transl(0,0,0.084);
figure(2);
six_axis.plot([0, 0, 0, 0, 0, 0]);
hold on;               
end