clear,clc;close all;
b=1;
fm=91;
N1=9;N2=10;
Tsim=20;
fs=50*1e3;
tspace=0:1/fs:Tsim;
c1=sqrt(2*b/N1)*ones(1,N1);
f1=fm*sin(pi*((1:N1)-0.5)/(2*N1));
theta1=2*pi*(1:N1)/(N1+1);
c2=sqrt(2*b/N2)*ones(1,N2);
f2=fm*sin(pi*((1:N2)-0.5)/(2*N2));
theta2=2*pi*(1:N2)/(N2+1);
alphat=zeros(1,length(tspace));
g1t=zeros(1,length(tspace));
gt=zeros(1,length(tspace));
jj=0;
for tt=tspace
    jj=jj+1;
    g1 = g_i(c1,f1,theta1,tt);
    g2 = g_i(c2,f2,theta2,tt);
    g1t(jj)=g1;
    gt(jj)=g1+1j*g2;
    alphat(jj)=sqrt(g1^2+g2^2);
end
mean_g1t=mean(g1t);
mean_gt=mean(gt);
mean_alphat=mean(alphat);
var_g1t=var(g1t);
var_gt=var(gt);
var_alphat=var(alphat);

lb=-4; step=0.05; ub=4;
x=lb:step:ub;
mu=0; sigma=1;
px=(1/(sqrt(2*pi)*sigma))*exp(-(x-mu).^2/(2*sigma^2));

figure(1);
fg1t=hist(g1t,x);
plot(x,fg1t/(sum(fg1t)*step),'-*r','LineWidth',1.5);hold on;
plot(x,px,'-b','LineWidth',1.5);
title('PDF of Tilde g_1(t)');
xlabel('x');
ylabel('p_{\mu}(x)');
grid on;
legend('Simulation','Theory');

xlb=0;step=1e-3;xub=5;
x=xlb:step:xub;
K=0;Omega_p=2;
p_alphax=(2*x*(K+1)/Omega_p).*exp(-K-((K+1)*x.^2)/Omega_p).*besseli(0,2*x*sqrt(K*(K+1)/Omega_p));

figure(2);
falphat=hist(alphat,x);
plot(x,falphat/(sum(falphat)*step),'-*r','LineWidth',1.5);hold on;
plot(x,p_alphax,'-b','LineWidth',1.5);
title('PDF of Tilde \alpha(t)');
xlabel('x');
ylabel('p_{\alpha}(x)');
grid on;
legend('Simulation','Theory');


