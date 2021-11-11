% EPI  = funtion_to_generate_EPIMAP(data_3D,183);
% EPI = EPI(:,3:620);
% EPI_new = shear_EPI_demo(EPI);

deta = -3;
EPI_new= zeros(15,960);
for i = 1:15
    EPI_new(i,:) = shear_EPI(deta*i,squeeze(EPI(i,:)));
    
end
imshow(EPI_new,[])
% theta_line = single_line_test(EPI_new);
% end

