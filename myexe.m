clear,clc; close all;
N=1000;
xRow=randn(1,N);
yCol=randn(1,N);
z=20*randn(1,N)+10;
[a,~]=size(xRow);%x�������ܹ�********�У�
xmax=max(xRow);%x���������ֵΪ**********
xmin=min(xRow);%x��������СֵΪ********
%���������ǲ����õģ��������ü��ֵ
%delta_x=xmax-xmin;
%delta_x/a;

[b,~]=size(yCol);%y������Ϊ******
ymax=max(yCol);%y���������ֵΪ******
ymin=min(yCol);%y��������СֵΪ********
%���������ǲ����õģ��������ü��ֵ
%delta_y=ymax-ymin;
%delta_y/b;
step=0.1;
[X,Y]=meshgrid(xmin:step:xmax,ymin:step:ymax);%��x��y�����񻯣��ع����ڻ�ͼx��y������
Z=griddata(xRow,yCol,z,X,Y);%��ֵ���ع����ڻ�ͼ��Z������
clear a b xmax xmin ymin ymax xRow yCol z;

h=figure(1);
mesh(X,Y,Z);
shading interp ;
colorbar ;
colormap('jet');
grid on;
% box on;
set(h,'name','my3Dtry');
set(gca, 'Fontname', 'Times New Roman','FontSize',12);
xlabel('\alpha_{i,j}','Fontname', 'Times New Roman','FontSize',15);
ylabel('\beta_{i,j}','Fontname', 'Times New Roman','FontSize',15);
zlabel('\Phi_{\tau}','Fontname', 'Times New Roman','FontSize',15);


