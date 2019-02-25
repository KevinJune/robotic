%calculate the head
function A = calculate_head(m)
 A(1,1) = 0;      A(1,2) = -m(3,1); A(1,3) = m(2,1);
 A(2,1) = m(3,1); A(2,2) = 0;       A(2,3) =-m(1,1);
 A(3,1) = m(2,1); A(3,2) = m(1,1);  A(3,3) = 0;  