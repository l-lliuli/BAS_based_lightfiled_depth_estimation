unction [ k_value ] = get_k( i,j ,k1,step,k2,phi_3D)
%GET_DEPTH 此处显示有关此函数的摘要
%   此处显示详细说明

EPI = funtion_to_generate_EPIMAP( phi_3D ,i );
if j ~=1 && j~=960
%          theta_value = theta_center(j);
%          theta1 = theta_value-10*step;
%          theta2 = theta_value+10*step;
         l = length(k1:step:k2);
         cost = zeros(1,l);
         for k = k1:step:k2
      
         
 %gradimag_x  = diff(EPI_img_raw)   ;    % 行差分丢失第一行
 %grad_x = [gradimag_x(1,:);gradimag_x];
 
         [~,~,~,new] =get_cordinate2( EPI ,k ,j);
         id = (k - k1)/step+1;
         cost(int32(id))=new;
         end
         [~ , index ] = min(cost);    % index位于1，到89
         k_value = (index-1)*step+k1;
else
    k_value = 0;
      
end
end

