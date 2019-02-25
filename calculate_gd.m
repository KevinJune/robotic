%calculate the gd
function A = calculate_gd(xtaget,ytaget,ztaget,Rtaget)
A(1,1) = Rtaget(1,1);A(1,2) = Rtaget(1,2);A(1,3) = Rtaget(1,3);A(1,4) = xtaget;
A(2,1) = Rtaget(2,1);A(2,2) = Rtaget(2,2);A(2,3) = Rtaget(2,3);A(2,4) = ytaget;
A(3,1) = Rtaget(3,1);A(3,2) = Rtaget(3,2);A(3,3) = Rtaget(3,3);A(3,4) = ztaget;
A(4,1) = 0;          A(4,2) = 0;          A(4,3) = 0;          A(4,4) = 1;
