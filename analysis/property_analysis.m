format long
prop_md = importdata('properties.dat')*-1;
prop_qn = importdata('properties_qn.dat')*-1;
prop  = [prop_md; prop_md]; 

m1 = mean(prop_md);
s1 = std(prop_md);
m2 = mean(prop_qn);
s2 = std(prop_qn);
std(prop_qn(1:10))
figure
hist = histogram(prop, 50)

figure
hist_md = histogram(prop_md, 20)

figure
hist_qn = histogram(prop_qn, 30)

e = zeros(size(prop_qn), 1);
for i = 1:size(prop_qn,1) - 1
       e(i) = prop_qn(n) - prop_qn(n+1)
end