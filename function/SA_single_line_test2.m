function theta_list = SA_single_line_test2(EPI,drop_rate )
%%main.m
EPI_L = size(EPI,2);
theta_list = zeros(1,EPI_L);
% raw = 386; 
% i = 300;
% EPI = funtion_to_generate_EPIMAP(phase_3D,raw);
% a = [];
for i = 1:EPI_L
T=65; %��ʼ���¶�ֵ

T_min=1e-5; %�����¶��½�

alpha = 0.9;

% k=1000; %������������ռ�Ĵ�С��


%  tic;

x=getX; %����õ���ʼ��

while(T>T_min)

    for I=1:20
%         x
        fx=Fx(x,EPI,i);

        x_new=getX;

        if(x_new>=100 && x_new<150)

            fx_new=Fx(x_new,EPI,i);

            delta=fx_new-fx;

            if (delta<0)

                x=x_new;

            else

                P=getP(delta,T);
                % P Խ�� P>randԽ���ף�Խ�������������
                % T ԽС������ԽС��Խ������������    T���Ÿ����ʳ�����أ�deta���Ÿ��ʳɸ���ء�

                if(P>rand)

                    x=x_new;

                end

            end

        end

    end

    T=T*alpha;

end
% toc
% disp('���Ž�Ϊ��')

% disp(x)
% a = [a,x];
theta_list(i) = x;
end
 

%%getX.m

function x=getX

    x = 100*rand + 40 ;

end

 

%%Fx.m

function fx=Fx(x,EPI,i)

    fx=cost(EPI,i,x);

end

 

%%getP.m

function p=getP(c,t)

    p = exp(-c/t);

end

end

