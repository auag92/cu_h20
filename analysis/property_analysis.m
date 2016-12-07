format long
prop_md = importdata('properties.dat')*-1;
prop_qn = importdata('properties_qn.dat')*-1;
prop  = [prop1; prop2]; 

m1 = mean(prop1);
s1 = std(prop1);
m2 = mean(prop2);
s2 = std(prop2);

figure
hist = histogram(prop, 50)

figure
hist_md = histogram(prop_md, 20)

figure
hist_qn = histogram(prop_qn, 30)