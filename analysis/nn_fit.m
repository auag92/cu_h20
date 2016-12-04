format long
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%import the xyz data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xyz_map  = importdata('xyz_map.dat');
prop_md  = importdata('properties.dat');
prop_qn  = importdata('properties_qn.dat');

prop     = [prop_md; prop_qn]/(-30.0);

min_prop   = min(prop);
max_prop   = max(prop);
col        = (prop - min_prop)/(max_prop - min_prop);

n_md = size(prop_md,1);
n_qn = size(prop_qn,1);

clear prop_md prop_qn
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h2o = xyz_map(:,82:90);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cu = reshape(xyz_map(1,1:81).',[3,27]).';
structure = [h2o(:,1:3);cu];
property  = [col; ones(27,1)*0.1];
figure
scatter3(structure(:,1), structure(:,2), structure(:,3), (property+1)*100, property, 'fill')
xlabel('x axis')
ylabel('y axis')
zlabel('z axis')
title(['min prop = ' num2str(min_prop) ', max prop = ' num2str(max_prop)])
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