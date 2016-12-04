format long
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%The Data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
md_map   = importdata('distance_map.dat');
md_prop  = importdata('properties.dat');
md_col   = (md_prop - min(md_prop))/(max(md_prop) - min(md_prop));

qn_map   = importdata('distance_map_qn.dat');
qn_prop  = importdata('properties_qn.dat');
qn_col   = (qn_prop - min(qn_prop))/(max(qn_prop) - min(qn_prop));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
map        = [md_map; qn_map];
prop       = [md_prop; qn_prop]/(-30);
min_prop   = min(prop);
max_prop   = max(prop);
col        = (prop - min_prop)/(max_prop - min_prop);
clear min_prop max_prop
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotting the mean-squared error for the PCR and PLS w.r.t # of Components
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
plot(0:n_comp,PLSmsep(2,:),'b-o',0:n_comp,PCRmsep,'r-^');
xlabel('Number of components');
ylabel('Estimated Mean Squared Prediction Error');
legend({'PLSR' 'PCR'},'location','NE');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Data Storage%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%[0,2.50097619068471,2.57545804393416,2.59706650354724]
%[0,2.47742578654941,2.50619223217461,2.56250761430685,2.58087383451724,2.59706650354724,2.68198054146713]
%[0,2.51140686387543,2.52895886946670,2.60688434689230,2.61509098775058,2.68198054146713]
%[0,2.58157093873199,2.59157850499140,2.60688434689230,2.63285379935838,2.63652642779711]
