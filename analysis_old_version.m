format long
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%The Data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
md_map   = importdata('distance_map.dat');
md_prop  = importdata('properties.dat')*-1;
md_col   = (md_prop - min(md_prop))/(max(md_prop) - min(md_prop));

qn_map   = importdata('distance_map_qn.dat');
qn_prop  = importdata('properties_qn.dat')*-1;
qn_col   = (qn_prop - min(qn_prop))/(max(qn_prop) - min(qn_prop));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
map        = [md_map; qn_map];
prop       = [md_prop; qn_prop]/30;
min_prop   = min(prop)-1;
max_prop   = max(prop)-1;
col        = (prop - min_prop)/(max_prop - min_prop);
%mean(map(:,1:3))
%std(map(:,1:3))
clear min_prop max_prop
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Import XYZ data of all 292 md traj points
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
md_xyz = importdata('xyz_info.dat');
h2o  = (md_xyz(:,82:90));


%max(h2o(:,1:3)) - min(h2o(:,1:3))
%2.698
%3.020
%3.1890

%base = md_xyz(1,1:81).';
cu = reshape(md_xyz(1,1:81).',[3,27]).';
structure = [h2o(:,1:3);cu];
property  = [md_col; ones(27,1)*0.99];

figure
scatter3(structure(:,1), structure(:,2), structure(:,3), (property+1)*100, property, 'fill')
xlabel('x axis')
ylabel('y axis')
zlabel('z axis')
colormap(jet)
colorbar

ls = zeros(1,27);
dist_list = zeros(27,27);
for i = 1:27
 for j = 1:27
     ls(j) = norm((cu(i,:)-cu(j,:)));
 end
 dist_list(i,:) = sort(ls);
end
clear ls
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Partition Data into Test & Training Set
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
map  = log(map(:,4:84));
prop = log(prop);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
len       = size(map, 1);
rand_rows = randperm(len).'; % generate a random permutation of row labels in row form
a         = rand_rows(1:floor(len*(0.90)));
b         = rand_rows(ceil(len*(0.90)):len);

X_train = map(a,:);
X_test  = map(b,:);
y_train = prop(a,:);
y_test  = prop(b,:);

clear len rand_rows a b
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Protocols for model based learning
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1.) Linear Regression

r     = regress(y_train, [ones(size(X_train, 1), 1) X_train]);
y_fit = [ones(size(X_test,1),1) X_test]*r;
Rsq1  = 1 - sum((y_test - y_fit).^2)/sum((y_test - mean(y_test)).^2);

figure
plot(y_test, y_fit, 'bo')
xlabel('observed response')
ylabel('predicted response')
legend(sprintf('multiple linear regression,\n  R Square => %d', Rsq1), 'location', 'NW')
refline(1, 0)
ls = lsline()
ls.Color = 'r'
clear r y_fit ls
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Partial Least Square and Principal Component Regression
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Partial Least Squares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Data Assignment : X: feature vector, y: target
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
X = X_train;
y = y_train;
[n,p] = size(X);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n_comp = 50;
[Xloadings,Yloadings,Xscores,Yscores,betaPLS,PLSPctVar, PLSmsep] = plsregress(X,y,n_comp, 'CV',10);
yfitPLS  = [ones(n,1) X]*betaPLS;
y_fit = [ones(size(X_test,1),1) X_test]*betaPLS;
Rsq = 1 - sum((y_test - y_fit).^2)/sum((y_test - mean(y_test)).^2);

figure
plot(1:n_comp,cumsum(100*PLSPctVar(2,:)),'-bo');
xlabel('Number of PLS components');
ylabel('Percent Variance Explained in Y');
legend('Partial Least Squares', 'location', 'SE')

figure
plot(0:n_comp,PLSmsep(2,:),'b-o');
xlabel('Number of components');
ylabel('Estimated Mean Squared Prediction Error');
legend('PLSR','location','NE');

figure
plot(y_test, y_fit, 'bo')
xlabel('observed response')
ylabel('predicted response')
legend(sprintf('Partial Least Squares,\n  R Square => %d', Rsq), 'location', 'NW')
refline(1, 0)
ls = lsline()
ls.Color = 'r'
clear ls y_fit Rsq
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Principal Component Regression
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[n,p] = size(X);
n_comp = 50;
[PCALoadings,PCAScores,PCAVar] = pca(X,'Economy',false);
betaPCR = regress(y-mean(y), PCAScores(:,1:n_comp));

betaPCR = PCALoadings(:,1:n_comp)*betaPCR;
betaPCR = [mean(y) - mean(X)*betaPCR; betaPCR];
yfitPCR = [ones(n,1) X]*betaPCR;
PCRmsep = sum(crossval(@pcrmod, X, y, 'KFold', 18), 1) / n;
y_fit = [ones(size(X_test,1),1) X_test]*betaPCR
Rsq = 1 - sum((y_test - y_fit).^2)/sum((y_test - mean(y_test)).^2);
%Plot test data for PCR
figure
plot(y_test, y_fit, 'bo')
xlabel('observed response')
ylabel('predicted response')
legend(sprintf('Principal Component Regression,\n  R Square => %d', Rsq), 'location', 'NW')
refline(1, 0)
ls = lsline()
ls.Color = 'r'
clear Rsq y_fit ls

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotting the mean-squared error for the PCR and PLS w.r.t # of Components
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
plot(0:n_comp,PLSmsep(2,:),'b-o',0:n_comp,PCRmsep,'r-^');
xlabel('Number of components');
ylabel('Estimated Mean Squared Prediction Error');
legend({'PLSR' 'PCR'},'location','NE');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotting the observed vs. fitted response for PLSR and PCR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
plot(y,yfitPLS,'bo',y,yfitPCR,'r^');
xlabel('Observed Response');
ylabel('Fitted Response');
legend({'PLSR with 50 Components' 'PCR with 50 Components'}, 'location','NW')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Support Vector Regression
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Mdl   = fitrlinear(X,y);
y_fit = predict(Mdl,X_test);
Rsq = 1 - sum((y_test - y_fit).^2)/sum((y_test - mean(y_test)).^2);

figure
plot(y_test, y_fit, 'bo')
xlabel('observed response')
ylabel('predicted response')
legend(sprintf('Support Vector Regression,\n  R Square => %d', Rsq), 'location', 'SE')
refline(1, 0)
ls = lsline()
ls.Color = 'r'
clear y_fit Rsq ls 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Dimensionality Reduction (PCA)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[coeff_md, score_md] = pca(md_map);
%[coeff_qn, score_qn] = pca(qn_map);
%pca_md = score_md(:,1:10); % for the md points
%pca_qn = score_qn(:,1:10); % for the qn points

%[coeff, score, explained] = pca(map);
%Partition Data into Test, Training and Validation Set
% len       = size(map, 1);
% rand_rows = randperm(len).'; % generate a random permutation of row labels in row form
% a         = rand_rows(1:floor(len*(0.90)));
% b         = rand_rows(ceil(len*(0.90)):len);
% %c         = rand_rows(ceil(len*(0.90)):len);

% X_pc       = score(:,1:40); 
% X_train_pc = score(a,1:40);
% X_test_pc  = score(b,1:40);
%test2_x = score(c,1:40);

% y_train_pc = prop(a,:);
% y_test_pc = prop(b,:);
%test2_y = prop(c,:);

%clear a b c rand_rows len
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotting the first three PC Scores of the Distance Map Vector
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
scatter3(score_md(:,1), score_md(:,2), score_md(:,3), md_col*100, md_col,'fill')
xlabel('PC 1');
ylabel('PC 2');
zlabel('PC 3')
legend({'All Data by First Three Principle Components'}, 'location','NW')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Data Storage%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%[0,2.50097619068471,2.57545804393416,2.59706650354724]
%[0,2.47742578654941,2.50619223217461,2.56250761430685,2.58087383451724,2.59706650354724,2.68198054146713]
%[0,2.51140686387543,2.52895886946670,2.60688434689230,2.61509098775058,2.68198054146713]
%[0,2.58157093873199,2.59157850499140,2.60688434689230,2.63285379935838,2.63652642779711]