load('./phase_lib/Tracy_6_2.mat');
addpath(genpath('./function'))
% phase_4D = Ameng;


% data_4D   = data_4D;
phase_3D = squeeze(phase_4D(8,:,:,:));
% phase_3D_col = generate_data_col(phase_4D);

[s,h,w] = size(phase_3D);

raw_map = zeros(h,w);
time_list = [];
big_matrix = [];
drop_rate = 0.99;
tic
parfor i = 1:h
  
    EPI_new = -funtion_to_generate_EPIMAP( phase_3D,i );
%     [theta_list,k_list] = single_line_test2(EPI_new);
%   [theta_list,k_list] = gradient_opt(EPI_new);
%  [theta_list,k_list] =  k_line_test(EPI_new);
%      [ theta_list,k_list] = gradient_opt_new(EPI_new);
theta_list = BAS_single_line_test(EPI_new);
%       theta_list = SA_single_line_test2(EPI_new,drop_rate);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        [theta_list] = SA_single_line_test2(EPI_new);
%  [ theta_list,k_list] = single_line_test2(EPI_new);
    raw_map(i,:) = theta_list;
%      raw_Cmap(i,:) = k_list;
    i

end
toc
a =  myBF(raw_map,60,90);
imshow(a,[60,90])
uint8 = show(a,60,90);
imwrite(uint8,'./result/Tracy.png');
