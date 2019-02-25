function TwoRobotSpace(scara,robot)
global Fa1up Fa1low Fa2up Fa2low Fa3up Fa3low 
global Sa1up Sa1low Sa2up Sa2low Sa3up Sa3low Sa4up Sa4low Sa5up Sa5low Sa6up Sa6low 
N=3000;
%workspace
FA1=Fa1low+(Fa1up-Fa1low)*rand(N,1);
FA2=Fa2low+(Fa2up-Fa2low)*rand(N,1);
FA3=Fa3low+(Fa3up-Fa3low)*rand(N,1);
%A4=a4low+(a4up-a4low)*rand(N,1);
for i = 1:1:N
    
    fa = FA1(i*1); fb=FA2(i*1); fc=FA3(i*1);
    FT = scara.fkine([fa fb fc 0]);
      if((-0.384<FT.t(2,1))&&(FT.t(2,1)<0.384)&&((FT.t(1,1)-0.800)^2+FT.t(2,1)^2+(FT.t(3,1)-0.491)^2<=0.700^2)&&0.251<FT.t(3,1)&&(FT.t(3,1)<0.343))
        
        
        plot3(FT.t(1,1),FT.t(2,1),FT.t(3,1),'y.');
        hold on;
        
     elseif(((sqrt(((FT.t(1,1)-0.800)^2)+FT.t(2,1)^2)-0.350*cos(20*pi/180))^2+(FT.t(3,1)-0.491+0.350*sin(20*pi/180))^2<=0.350^2)&&0.141<FT.t(3,1)&&(FT.t(3,1)<0.251))
        plot3(FT.t(1,1),FT.t(2,1),FT.t(3,1),'y.');
        hold on;
     elseif(0.141<FT.t(3,1)&&(FT.t(3,1))<0.343)
        plot3(FT.t(1,1),FT.t(2,1),FT.t(3,1),'b.');
        hold on;
     end
%     plot3(FT.t(1,1),FT.t(2,1),FT.t(3,1),'b.');
%     FT = SCARA_POE(fa, fb, fc, 0);               %用POE的方法
%     plot3((FT(1,4)-0.22),FT(2,4),FT(3,4),'b.');
    grid on;
    hold on;
end

%workspace
SA1=Sa1low+(Sa1up-Sa1low)*rand(N,1);
SA2=Sa2low+(Sa2up-Sa2low)*rand(N,1);
SA3=Sa3low+(Sa3up-Sa3low)*rand(N,1);
SA4=Sa1low+(Sa4up-Sa4low)*rand(N,1);    
SA5=Sa2low+(Sa5up-Sa5low)*rand(N,1);
SA6=Sa3low+(Sa6up-Sa6low)*rand(N,1);
for j = 1:1:N
    a1 = SA1(j*1); a2=SA2(j*1); a3=SA3(j*1); a4 = SA4(j*1); a5=SA5(j*1); a6=SA6(j*1);
    ST = robot.fkine([a1,a2,a3,a4,a5,a6]);
    
%       if(((ST.t(1,1))^2)+(ST.t(2,1)^2<=0.450^2)&&0.143<ST.t(3,1)&&ST.t(3,1)<0.343)
%         plot3(FT.t(1,1),FT.t(2,1),FT.t(3,1),'y.');
%         hold on;
%       else
%          plot3(ST.t(1,1),ST.t(2,1),ST.t(3,1),'r.');
%         hold on;
%      end  
    plot3(ST.t(1,1),ST.t(2,1),ST.t(3,1),'r.');
%     ST = SixPOE(a1,a2,a3,a4,a5,a6);
%     plot3((ST(1,4)+0.8),ST(2,4),ST(3,4),'r.');
    grid on;
    hold on;
end

end