set Shirt;
set Department;

param Profit{Shirt};
param Hours{Department};
param MaxUnit{Department, Shirt};

var Quantity{Shirt} >= 0;
maximize Total_Profit: sum{i in Shirt} Profit[i] * Quantity[i] ;
 
subject to Bound {j in Department}: sum{i in Shirt} (Quantity[i]/MaxUnit[j, i]) <= Hours[j];
								
