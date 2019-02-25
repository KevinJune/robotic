%��main�ļ���TwoRobotModel�ļ�   �ȵ������TwoRobotModel�ļ����ƻ�е��ģ��
TwoRobotModel; 
 TwoRobotSpace(scara,robot);                               %���ƹ����ռ�
target_T = scara.fkine([1/18.0*pi 2/18.0*pi 0.15 0]);  %�ϵ�  ǰ����ƹ����ռ�
% target_T = SCARA_POE(1/18.0*pi, 2/18.0*pi, 0.15, 0);     
P = [target_T.t(1,1) target_T.t(2,1) target_T.t(3,1)];        
DrawRobotModel(scara,six_axis);                           %�ڵڶ���������ʾ��е��                   
figure(2);                                             %�ϵ�  ��ʾP��                                            
plot3(P(1,1),P(1,2),P(1,3),'r.','MarkerSize',30);     
grid on;  hold on;                                     
q = newton(P(1,1),P(1,2),P(1,3)); %�ϵ�  ��ʾ�������̵�ţ�ٵ�������
Final_T = robot.fkine(q);
% Final_T = SixPOE(q(1,1),q(2,1),q(3,1),q(4,1),q(5,1),q(6,1));
P1 = [Final_T.t(1,1) Final_T.t(2,1) Final_T.t(3,1)];
figure(2);                                             %�ϵ�  ��ʾ�����е��Ҫȥ��Ŀ��㣨��ɫ��������P���غϣ�
plot3(P1(1,1),P1(1,2),P1(1,3),'b.','MarkerSize',30);
grid on;   hold on;
figure(2);
scara.teach;
six_axis.teach;
% six_axis.plot([q(1,1),q(2,1),q(3,1),q(4,1),q(5,1),q(6,1)]); %�ϵ�  �����˶��� P' ��
% scara.plot([1/18.0*pi,2/18.0*pi,0.15,0]);                   %�ϵ�  SCARA�˶��� P ��
% grid on;hold on;
% figure(3);
% scara.teach;
% six_axis.teach;
p0 = [-0.75*pi           0    0 0];
p1 = [1/18.0*pi,  2/18.0*pi,0.15,0];
q0 = [1/8*pi 1/8*pi 1/8*pi 1/8*pi 1/8*pi 1/8*pi];
t=[0:0.1:2]';
tra1=jtraj(p0,p1,t);%�����켣1
plot(scara,tra1);
grid on;hold on;
tra2=jtraj(p1,p0,t);%�����켣2
plot(scara,tra2);
grid on;hold on;
tra3=jtraj(q0,q,t);%�����켣3
plot(six_axis,tra3);
grid on;hold on;
tra4=jtraj(q,q0,t);%�����켣4
plot(six_axis,tra4);
grid on;hold on;