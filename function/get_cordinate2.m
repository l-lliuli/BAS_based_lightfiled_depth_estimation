function [xi,yi,cordinate,cost] = get_cordinate2( image ,theta ,i)
%GET_CORDINATE �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��35
% �������ص�ĺ�����ĽǱ�
%load('phi_data_5D.mat');
[~,width] = size(image);
          % ȡ������    
x0 = i-1+1/2;          % 
y0 = 7 + 1/2;        
n = 100;  
Ys =  0.5:1:14.5;

k = tan(theta/360*2*pi);   
% Xs = linspace(x0-y0/k,x0+y0/k,n);         %С�����ֵ�X����     

Xs = (y0-Ys)/k+x0;  
% Ys = -(Xs - x0)*k+y0;
id = Xs>width | Xs<=0;
Xs(id)=[];
Ys(id)=[];
% С�����ֵ�y ����
xi = ceil(Xs);                         % ����ȡ����Ҳ���ǵ�һ����
X_star =  Xs-floor(Xs);
X_lable =X_star;
%%   ����С�����ֻ��Ȩ��ϵ��
% aerfa1 = -X_star.^2+X_star+3/4;
aerfa1 = exp(-((X_star-1/2).^2)/pi);

aerfa1(aerfa1<0.5) = aerfa1(aerfa1<0.5)+0.5;
aerfa1(aerfa1>0.5) = -aerfa1(aerfa1>0.5)+1.5;
aerfa1(aerfa1==0.5) = 1;

aerfa2 = 1-aerfa1;

X_star(X_star<0.5)=-1;
X_star(X_star>0.5)=1;
X_star(X_star==0.5)=0;

%%   ��ͷ�˲�������������


x_new = xi+X_star;
x_new(x_new<1)=1;
x_new(x_new>width)=width;


yi = ceil(Ys);   
%yi(yi == 0) =1;
% ɸѡ���е����õ����ݶԣ����x��ֵ����625����С��1��ֵ��ֱ�Ӷ���
% cordi = [xi;yi];
% id = cordi(1,:)>434 | cordi(1,:)<1;
% cordi(:,id) = [];                 % ��˫����С���Ϊ������С��
cordinate = (xi-1)*15+yi;
cordinate = uint32(cordinate);
% cordinate = unique(cordinate);
%  EPI= funtion_to_generate_col_EPIMAP( phi_data_5D ,8,317 );
%  a = EPI(cordinate);

% cordi = [x_new;yi];
% id = cordi(1,:)>434 | cordi(1,:)<1;
% cordi(:,id) = [];                 % ��˫����С���Ϊ������С��
cordinate_new = (x_new-1)*15+yi;
%cordinate_new = unique(cordinate_new);

%%    ���ۺ�������


% n = size(cordinate);
center = 7+(i-1)*15; 

value1 =image(cordinate);

% a(a>2.8) = a(a>2.8)-2*pi;
% a = correct(a);
value1((value1-image(center))<-pi)=value1((value1-image(center))<-pi)+2*pi;
value1(value1-image(center)>pi)=value1(value1-image(center)>pi)-2*pi;
 a =value1;
% % 
value2 = image(cordinate_new);
value2(value2-image(center)<-pi) = value2(value2-image(center)<-pi)+2*pi;
value2(value2-image(center)>pi) = value2(value2-image(center)>pi)-2*pi;
% % 
p_value  =  value1.*aerfa1 + value2.*aerfa2;
% deta  = p_value-ones(n).*double(imag(center)); 
% deta(deta<-pi) = deta(deta<-pi)+2*pi; 
% deta(deta>pi) = deta(deta>pi)-2*pi;
% cost = norm(double(deta))/length(n);
cost = cov(p_value);





end

