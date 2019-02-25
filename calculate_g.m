%compute the gd
function A = calculate_g(th1,th2,th3,th4,th5,th6)
l0=300;
l1=191;
l2=350;
l3=80;
l4=350;
l5=50;
l6=84;

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
G45=[cos(th5)   0  -sin(th5) l2*(1-cos(th5))+(l0+l1-l4)*sin(th5);
    0         1  0        0;
    sin(th5)   0  cos(th5)  -l2*sin(th5)+(l0+l1-l4)*(1-cos(th5));
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

                               
                               A = G01*G12*G23*G34*G45*G56*GST0;