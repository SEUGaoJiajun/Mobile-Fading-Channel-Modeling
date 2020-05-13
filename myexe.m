clear,clc; close all;
N=1000;
xRow=randn(1,N);
yCol=randn(1,N);
z=20*randn(1,N)+10;
[a,~]=size(xRow);%x轴数据总共********行；
xmax=max(xRow);%x轴数据最大值为**********
xmin=min(xRow);%x轴数据最小值为********
%下面两行是测试用的，便于设置间隔值
%delta_x=xmax-xmin;
%delta_x/a;

[b,~]=size(yCol);%y轴数据为******
ymax=max(yCol);%y轴数据最大值为******
ymin=min(yCol);%y轴数据最小值为********
%下面两行是测试用的，便于设置间隔值
%delta_y=ymax-ymin;
%delta_y/b;
step=0.1;
[X,Y]=meshgrid(xmin:step:xmax,ymin:step:ymax);%将x、y轴网格化，重构用于画图x、y轴数据
Z=griddata(xRow,yCol,z,X,Y);%插值，重构用于画图的Z轴数据
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


