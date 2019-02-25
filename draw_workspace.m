%六轴工作空间
close all;
clear;
l0=300;
l1=191;
l2=350;
l3=80;
l4=350;
l5=50;
l6=84;
num=1;
point1=[];
point2=[];
point3=[];

ToDeg = 180/pi;
ToRad = pi/180;

num=1;
th_interval = 30;
d_interval = 10;

for theta1=(-170):th_interval:(170)
    for theta2=(-110):th_interval:(110)
        for theta3=(-136):th_interval:(136)
            for theta4=(-185):th_interval:(110)
                for theta5=-(-120):th_interval:(120)
                    for theta6=(-180):360:(180)
                        th1=theta1*ToRad;
                        th2=theta2*ToRad;
                        th3=theta3*ToRad;
                        th4=theta4*ToRad;
                        th5=theta5*ToRad;
                        th6=theta6*ToRad;
                        
                            G01=[[cos(th1),  -sin(th1),           0,                0]
                                [sin(th1),   cos(th1),           0,                0]
                                [0,              0,              1,                0]
                                [0,              0,              0,                1]];
                           G12=[[1,              0,              0,                0]
                                [0,        cos(th2),      -sin(th2),               (l0+l1)*sin(th2)]
                                 [0,       sin(th2),       cos(th2),               (l0+l1)*(1-cos(th2))]
                                 [0,             0,              0,                1]];
                            G23=[[1,             0,              0,                0]
                                 [0,       cos(th3),       -sin(th3),                (l0+l1+l2)*sin(th3)]
                                 [0,       sin(th3),        cos(th3),                (l0+l1+l2)*(1-cos(th3))]
                                 [0,             0,              0,                1]];
                            G34=[ [cos(th4),     0,             sin(th4),      (l0+l1+l2)*(-sin(th4))]
                                  [0,             1,             0,                 0]
                                  [-sin(th4),  0,             cos(th4),        (l0+l1+l2)*(1-cos(th4))]
                                  [0,             0,             0,                1]];
                             G45=[[1,             0,             0,                0]
                                  [0,      cos(th5),          -sin(th5),          (l0+l1+l2)*sin(th5)+l4*(1-cos(th5))]
                                  [0,      sin(th5),           cos(th5),          (l0+l1+l2)*(1-cos(th5))-l4*sin(th5)]
                                  [0,             0,             0,                1]];
                             G56=[[cos(th6),  -sin(th6),         0,                l4*sin(th6)]
                                [sin(th6),   cos(th6),           0,                l4*(1-cos(th6))]
                                 [0,              0,              1,                0]
                                 [0,              0,             0,                1]];
                             GST0=[[1,             0,              0,                0]
                                   [0,             1,             0,                l4]
                                   [0,             0,             1,                l0+l1+12-l6]
                                   [0,             0,             0,                1]];
                               
                       A =G01*G12*G23*G34*G45*G56*GST0;
                                  
                                  
                                  
                        point1(num) = A(1,4);
                        point2(num) = A(2,4);
                        point3(num) = A(3,4);
                        num = num + 1;  
                    end
                end
            end
        end
    end
end
plot3(point1,point2,point3,'r*');
L1=Link([0       191      0      pi/2      0     ]); %定义连杆的D-H参数
L2=Link([pi/2    0        350   0         0     ]);
L3=Link([0       0        0      pi/2      0     ]);
L4=Link([0       350     0      pi/2      0     ]);
L5=Link([pi      0        0      pi/2      0     ]);
L6=Link([0       84    0      0         0     ]);
robot=SerialLink([L1 L2 L3 L4 L5 L6],'name','manman'); %连接连杆，机器人取名manman
robot.plot([0,pi/2,0,0,pi,0]);%输出机器人模型，后面的六个角为输出时的theta姿态
robot.teach;
grid on;