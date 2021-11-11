load('./phase_lib/Tracy_6_2.mat');
addpath(genpath('./function'))
% phase_4D = Ameng;


% data_4D   = data_4D;
phase_3D = squeeze(phase_4D(8,:,:,:));
% phase_3D_col = generate_data_col(phase_4D);

[s,h,w] = size(phase_3D);

raw_map = zeros(h,w);
raw_Cmap =  zeros(h,w);
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
% imshow(raw_map,[55,80])
% time = toc;
% time_list = [time_list,time];
% % save_name = ['./SA_result_with_alpha/re_alpha' ,num2str(drop_rate*10e5),'.mat']
% % save(save_nameraw_map)
% big_matrix = [big_matrix,raw_map];
% 
% 
% end




% % col_map = zeros(625,434);
% % col_Cmap =  zeros(625,434);
% % tic;
% % parfor i = 512
% %   
% %     EPI_new = funtion_to_generate_EPIMAP( phase_3D_col,i );
% % %     [theta_list,k_list] = single_line_test(EPI_new);
% % %    theta_list = SA_single_line_test(EPI_new);
% % %  [theta_list,k_list] = gradient_opt(EPI_new);
% % %  [theta_list,k_list] = gradient_opt_new(EPI_new);
% % %     [ theta_list,k_list] = single_line_test2(EPI_new); 
% %     col_map(i,:) = theta_list;
% %     col_Cmap(i,:) = k_list;
% %     i
% % 
% % end
% % toc
% % % valid_mask = raw_Cmap <0.17;
% % % 
% % % raw_map(~valid_mask) = 0;
% % % raw_map(raw_map>73) = 0;
% % % 
% % % imshow(raw_map,[40,80])sav
% % % figure; imshow(col_map',[40,80])
% % 
% % % 
% % Dif  = col_Cmap' - raw_Cmap;
% % Dif(Dif > 0) = 1;% PS:  标为1 的是横向的结果更好
% % Dif(Dif< 0 ) =0;
% % 
% % fusion = Dif.* raw_map + (1-Dif) .*col_map';
% % b = col_map';
% % % load('./real_data/Ameng/invalid_mask');
% % % % fusion(invalid_mask) =78;
% % % % raw_map(invalid_mask) = 78;
% % % % b(invalid_mask)= 78 ;
% % % figure;
% % % imshow(fusion,[40,80]);title('fusion')
% % 
% % 
% % 
% % % label = raw_Cmap > bianli_raw_Cmap;
% % % result = label.*map + (1-label).*raw_map;
% % 
% % % 将结果的大图保存起来，
% % bigmap = [raw_map,b,fusion];
% % img = show(bigmap,40,80);
% % save_path = ['./result/temp.png']
% % imwrite(img,save_path);

