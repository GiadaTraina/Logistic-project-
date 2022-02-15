set Shirt;
set Department;

param Profit{Shirt};
param Hours{Department};
param NumUnit{Department, Shirt};
param Max{Department};
param Cost{Department}; 
param MinProd{Shirt};

var Quantity{Shirt} integer;
var AddHours{Department} integer;

maximize Total_Profit: (sum{i in Shirt} Profit[i] * Quantity[i]) - (sum{j in Department}( Cost[j] * AddHours[j]));
 
subject to Bound {j in Department}: sum{i in Shirt} (Quantity[i]/NumUnit[j, i]) <= Hours[j] + AddHours[j];
subject to MaxHours {j in Department}: AddHours[j] <= Max[j];	
subject to Minimum {i in Shirt}: Quantity[i] >= MinProd[i];							