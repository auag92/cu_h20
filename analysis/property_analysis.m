format long
prop1 = importdata('properties.dat')*-1;
prop2 = importdata('properties_qn.dat')*-1;
prop  = [prop1; prop2]; 

m1 = mean(prop1);
s1 = std(prop1);
m2 = mean(prop2);
s2 = std(prop2);