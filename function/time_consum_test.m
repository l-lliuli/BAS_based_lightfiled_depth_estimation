% ���ı����ڼ�⣬���ٵ�һ�飬�Ż��ڶ�����Ҫ��Ƶ��㷨
% ����Ҫȷ�����ǣ����ǿ϶�ֻ�����й��ߵ��Ƶ�����
addpath(genpath('./function'))
raw_map = zeros(434,625);
raw_Cmap =  zeros(434,625);
tic;
parfor i = 1:434
  
    EPI_new = funtion_to_generate_EPIMAP(phase_3D,i);
%     [theta_list,k_list] = single_line_test(EPI_new);
  [theta_list,k_list] = gradient_opt(EPI_new);
%      [ theta_list,k_list] = gradient_opt_new(EPI_new);
%     theta_list = SA_single_line_test(EPI_new);
%      [ theta_list,k_list] = single_line_test2(EPI_new);
    raw_map(i,:) = theta_list;
     raw_Cmap(i,:) = k_list;
    i

end
toc
a = raw_Cmap > 0.1;
imshow(a);
figure;


raw_map(raw_map>73) = 0;
raw_map(a) = 0;
imshow(raw_map,[40,80])