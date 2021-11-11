
%%main.m
% raw = 241 ;   the bad case line 
% i = 143;
raw = 281;   
i = 417;
EPI  = funtion_to_generate_EPIMAP(phase_3D,raw);



 % ���ȿ�һ�´���������ʲô���ӵ�

 

[ theta,show] = single_point_test(EPI,i);
set(gca,'linewidth',1,'fontsize',15,'fontname','Times');
grid on;

% EPI = shear_EPI_demo(EPI);
a= [];
for s = 1:100
K = 1
for i  = 300
T=40; %��ʼ���¶�ֵ

T_min=1e-4; %�����¶��½�

alpha=0.011; %�¶ȵ��½���

k=1000; %������������ռ�Ĵ�С��


 tic;
list = [];
x=getX; %����õ���ʼ��

while(T>T_min)
    
    for I=1:5
%         x
        fx=Fx(x,EPI,i);
        K = K+1;
        

        x_new=getX;
        list = [list,x_new];

        if(x_new>=110 && x_new<140)

            fx_new=Fx(x_new,EPI,i);
       
            K = K+1;

            delta=fx_new-fx;

            if (delta<0)

                x=x_new;

            else

                P=getP(delta,T);

                if(P>rand)

                    x=x_new;

                end

            end

        end

    end

    T=T*alpha;

end
toc
% disp('���Ž�Ϊ��')

disp(x)
 a = [a,x];
end
end
 
cost_list = [];
% for theta = list
% value = cost(EPI,i,theta);
% cost_list = [cost_list,value];
% end
% hold on;scatter(list,cost_list);
% % 
for theta = list
    value = cost(EPI,i,theta);
cost_list = [cost_list,value];
end
hold on;scatter(list,cost_list);





%%getX.m

function x=getX

    x = 110*rand + 30 ;

end

 

%%Fx.m

function fx=Fx(x,EPI,i)

    fx=cost(EPI,i,x);

end

 

%%getP.m

function p=getP(c,t)

    p= exp(-c/t);

end

 
