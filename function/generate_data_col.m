function   data_3D_col = generate_data_col(data_4D)
[u,~,s,t] = size(data_4D);


data_3D_col = zeros(u,t,s);
for i = 1:u
    a = squeeze(data_4D(i,8,:,:));
    a = a';
    data_3D_col(i,:,:) = a;
end
end