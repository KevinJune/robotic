function DrawRobotModel(scara,six_axis)
figure(2);
scara.plotopt ={'workspace',[-0.8 1.8 -1 1 -0.5 1.5]};
figure(2);
scara.plot([0.5*pi 0 0.2 0]);
hold on;
% scara.teach %打开各关节的驱动，用于调节各关节变量值
six_axis.base = transl(0.8,0,0.3);                    %断点  在第二个窗口显示六轴机械臂
six_axis.tool = transl(0,0,0.084);
figure(2);
six_axis.plot([0, 0, 0, 0, 0, 0]);
hold on;               
end