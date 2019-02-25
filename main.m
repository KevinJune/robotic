%打开main文件和TwoRobotModel文件   先点击运行TwoRobotModel文件绘制机械臂模型
TwoRobotModel; 
 TwoRobotSpace(scara,robot);                               %绘制工作空间
target_T = scara.fkine([1/18.0*pi 2/18.0*pi 0.15 0]);  %断点  前面绘制工作空间
% target_T = SCARA_POE(1/18.0*pi, 2/18.0*pi, 0.15, 0);     
P = [target_T.t(1,1) target_T.t(2,1) target_T.t(3,1)];        
DrawRobotModel(scara,six_axis);                           %在第二个窗口显示机械臂                   
figure(2);                                             %断点  显示P点                                            
plot3(P(1,1),P(1,2),P(1,3),'r.','MarkerSize',30);     
grid on;  hold on;                                     
q = newton(P(1,1),P(1,2),P(1,3)); %断点  显示求逆解过程的牛顿迭代曲线
Final_T = robot.fkine(q);
% Final_T = SixPOE(q(1,1),q(2,1),q(3,1),q(4,1),q(5,1),q(6,1));
P1 = [Final_T.t(1,1) Final_T.t(2,1) Final_T.t(3,1)];
figure(2);                                             %断点  显示六轴机械臂要去的目标点（蓝色，几乎与P点重合）
plot3(P1(1,1),P1(1,2),P1(1,3),'b.','MarkerSize',30);
grid on;   hold on;
figure(2);
scara.teach;
six_axis.teach;
% six_axis.plot([q(1,1),q(2,1),q(3,1),q(4,1),q(5,1),q(6,1)]); %断点  六轴运动到 P' 点
% scara.plot([1/18.0*pi,2/18.0*pi,0.15,0]);                   %断点  SCARA运动到 P 点
% grid on;hold on;
% figure(3);
% scara.teach;
% six_axis.teach;
p0 = [-0.75*pi           0    0 0];
p1 = [1/18.0*pi,  2/18.0*pi,0.15,0];
q0 = [1/8*pi 1/8*pi 1/8*pi 1/8*pi 1/8*pi 1/8*pi];
t=[0:0.1:2]';
tra1=jtraj(p0,p1,t);%构建轨迹1
plot(scara,tra1);
grid on;hold on;
tra2=jtraj(p1,p0,t);%构建轨迹2
plot(scara,tra2);
grid on;hold on;
tra3=jtraj(q0,q,t);%构建轨迹3
plot(six_axis,tra3);
grid on;hold on;
tra4=jtraj(q,q0,t);%构建轨迹4
plot(six_axis,tra4);
grid on;hold on;