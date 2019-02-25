global Fa1up Fa1low Fa2up Fa2low Fa3up Fa3low 
global Sa1up Sa1low Sa2up Sa2low Sa3up Sa3low Sa4up Sa4low Sa5up Sa5low Sa6up Sa6low 
% global FL SL
% global scara robot six_axis
Fa1up = 0.75*pi;   Fa1low = -0.75*pi; 
Fa2up = 5/6.0*pi;  Fa2low = -5/6.0*pi; 
Fa3up = 0.2;      Fa3low = 0; 
%a4up = pi;        a4low = -pi; 
%DH = [THETA D A ALP  HA SIGMA]
FL(1) = Link([0,0.052,0.25,0,0]); FL(1).qlim = [Fa1low Fa1up];
FL(2) = Link([0,0,0.2,pi,0]);     FL(2).qlim = [Fa2low Fa2up];
%设置第三个关节为平移关节（改变sigma值为1），并设置关节限位0-2（移动范围）
FL(3) = Link([0,0,0,pi,1]); FL(3).qlim = [Fa3low Fa3up];
FL(4) = Link([0,0,0,0,0]);
 
scara=SerialLink(FL, 'name', 'SCARA');
scara.plotopt ={'workspace',[-0.8 1.8 -1 1 -0.5 1.5]};
scara.base = transl(0,0,0.343);
scara.tool = transl(0,0,-0.07);
scara.plot([1/18.0*pi 2/18.0*pi 0.15 0])   %显示机器人，初始q1至q4都为0
hold on;
scara.teach %打开各关节的驱动，用于调节各关节变量值

Sa1up = 17/18.0*pi;   Sa1low = -17/18.0*pi;
Sa2up = 10/9.0*pi;    Sa2low = -1/9.0*pi; 
Sa3up = 226/180.0*pi; Sa3low = -46/180.0*pi; 
Sa4up = 185/180.0*pi; Sa4low = -185/180.0*pi; 
Sa5up = 2/3.0*pi;     Sa5low = -2/3.0*pi; 
Sa6up = 2*pi;         Sa6low = -2*pi; 
%定义连杆的D-H参数
SL(1)=Link([0       0.191    0      pi/2      0     ]); SL(1).qlim=[Sa1low Sa1up];
SL(2)=Link([pi/2    0        0.35   0         0     ]); SL(2).qlim=[Sa2low Sa2up];
SL(3)=Link([0       0        0      pi/2      0     ]); SL(3).qlim=[Sa3low Sa3up];
SL(4)=Link([0       0.35     0      -pi/2      0    ]); SL(4).qlim=[Sa4low Sa4up];
SL(5)=Link([pi      0        0      pi/2      0     ]); SL(5).qlim=[Sa5low Sa5up];
SL(6)=Link([0       0        0      0         0     ]); SL(6).qlim=[Sa6low Sa6up];
robot=SerialLink(SL,'name','Six-axis'); %连接连杆，机器人取名robot
six_axis = SerialLink(SL,'name','six-axis');
robot.base = transl(0.8,0,0.3);
robot.tool = transl(0,0,0.084);
robot.plot([0,pi/2,0,0,0,0]);%输出机器人模型，后面的六个角为输出时的theta姿态
hold on;
robot.teach;
