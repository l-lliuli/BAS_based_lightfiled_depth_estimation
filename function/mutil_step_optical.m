raw = 308 ; 
col = 114;
EPI  = funtion_to_generate_EPIMAP(phase_3D,raw);
theta1 = gradient_single_point(EPI,col,30)

theta2 = gradient_single_point(EPI,col,120)

