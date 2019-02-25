%compute the Adg
function A = cal_adg(m)
 A(1:3,1:3) = m(1:3,1:3); A(1:3,4:6)= calculate_head(m(1:3,4))*m(1:3,1:3);
 A(4:6,1:3) = zeros(3,3); A(4:6,4:6)= m(1:3,1:3);
 