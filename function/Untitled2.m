% %list = [1,2,3,4,5,6,7,8,10,11,12,13,14,15,16];
% % plot(EPI(1,:))
% figure;
% hold;
% G = EPI;
% for i = 3:2:13
%     plot(G(i,:))
% end
% 
% % little_EPI = EPI_new(:,190:261);
% % imshow(little_EPI,[])

a = [];
parfor i = 1:434
    EPI_new = funtion_to_generate_EPIMAP( phase_3D,i );
%     [theta_list,k_list] = single_line_test(EPI_new);
%   [theta_list,k_list] = gradient_opt(EPI_new);
%      [ theta_list,k_list] = gradient_opt_new(EPI_new);
%     [theta_list] = SA_single_line_test2(EPI_new);
[ theta_list,k_list] = gradient_opt(EPI_new);
% plot(theta_list)
% pause(0.1)
a = [a;theta_list];
end
