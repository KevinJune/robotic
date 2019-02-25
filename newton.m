function A = newton(x,y,z)
% Newton-Raphson Algorithm

%1.initialize θ（k）←θ（0）∈Rn
th1 = 1/8*pi;
th2 = 1/8*pi;
th3 = 1/8*pi;
th4 = 1/8*pi;
th5 = 1/8*pi;
th6 = 1/8*pi;
xita_k=[th1;th2;th3;th4;th5;th6];

x_taget = (x-0.8)*1000;
y_taget = y*1000;
z_taget = z*1000;
R_taget = [1, 0, 0;
           0,-1, 0;
           0, 0,-1];
num = 1;
N_O_P = 3;
learning_rate = 0.1;
figure;
while(N_O_P>0.5)
%2. Evaluate the current joint angles
gd_inverse = inv(calculate_gd(x_taget,y_taget,z_taget,R_taget));
th1=xita_k(1,1);th2=xita_k(2,1);th3=xita_k(3,1);th4=xita_k(4,1);th5=xita_k(5,1);th6=xita_k(6,1);
A = calculate_g(th1,th2,th3,th4,th5,th6);
phi_xitak = vee(logm(A*gd_inverse));
N_O_P = norm(phi_xitak);
%3.Compute Jacobian matrix
J_xitak = calculate_J(th1,th2,th3,th4,th5,th6); 
%4.Compute pseudo inverse of jacobian
j_p_inverse=inv((J_xitak')*J_xitak)*(J_xitak');

%5.Update xita
xita_k = xita_k - j_p_inverse*phi_xitak*learning_rate;
point1(num) = num;
point2(num) = N_O_P;
plot(point1,point2,'b');
num = num + 1;

end
xlabel('Number of Iterations')%x轴标记
ylabel('Norm of Phi(theta)')%y轴标记
title('Convergence Rate of Newton-Raphson Algorithm For Inverse Kinematics')%标题
hold on;
% plot(point1,point2,'b');
A = xita_k;
end
