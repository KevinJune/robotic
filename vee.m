%vee operation 
function matrix = vee( m )
matrix(1,1) = m(1,4);
matrix(2,1) = m(2,4);
matrix(3,1) = m(3,4);
matrix(4,1) = -m(2,3);
matrix(5,1) =  m(1,3);
matrix(6,1) = -m(1,2);