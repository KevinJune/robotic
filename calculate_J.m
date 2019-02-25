%compute the jacobian of xita_k
function A = calculate_J(th1,th2,th3,th4,th5,th6)
l0=300;
l1=191;
l2=350;
l3=80;
l4=350;
l5=50;
l6=84;
twist1=[0;          0    ;   0;  0; 0; 1];
twist2=[l0+l1;      0    ;   0;  0;-1; 0];
twist3=[l0+l1;      0    ; -l2;  0;-1; 0];
twist4=[0;         l4    ;   0;  0; 0;-1];
twist5=[l0+l1-l4;   0    ; -l2;  0;-1; 0];
twist6=[0;         l2    ;   0;  0; 0;-1];

                            G01=[[cos(th1),  -sin(th1),           0,                0]
                                [sin(th1),   cos(th1),           0,                0]
                                [0,              0,              1,                0]
                                [0,              0,              0,                1]];
G12=[cos(th2)   0  -sin(th2) (l0+l1)*sin(th2);
    0         1  0        0;
    sin(th2)   0  cos(th2)  (l0+l1)*(1-cos(th2));
    0         0  0        1;
    ];
G23=[cos(th3)   0  -sin(th3) l2*(1-cos(th3))+(l0+l1)*sin(th3);
      0         1     0        0;
    sin(th3)    0  cos(th3)  (-l2)*sin(th3)+(l0+l1)*(1-cos(th3));
      0         0     0        1;
     ];
G34=[cos(th4)  sin(th4)  0  l2*(1-cos(th4));
     -sin(th4) cos(th4)  0  l2*sin(th4);
      0        0        1  0;
      0        0        0  1;
    ];
G45=[cos(th5)   0  -sin(th5) l2*(1-cos(th5))+141*sin(th5);
    0         1  0        0;
    sin(th5)   0  cos(th5)  -l2*sin(th5)+141*(1-cos(th5));
    0         0  0        1;
    ];
G56=[cos(th6)  sin(th6)  0   l4*(1-cos(th6));
    -sin(th6) cos(th6)  0  l4*sin(th6);
    0        0        1  0;
    0        0        0  1;
    ];
GST0=[ 1  0   0   l2;
       0  -1  0   0;
       0  0   -1  l0+l1-l4-l6;
       0  0   0   1;
      ];

A(1:6,1)=twist1;
A(1:6,2)=cal_adg(G01)*twist2;
A(1:6,3)=cal_adg(G01*G12)*twist3;
A(1:6,4)=cal_adg(G01*G12*G23)*twist4;
A(1:6,5)=cal_adg(G01*G12*G23*G34)*twist5;
A(1:6,6)=cal_adg(G01*G12*G23*G34*G45)*twist6;