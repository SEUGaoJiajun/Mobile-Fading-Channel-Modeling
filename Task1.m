clear,clc;close all;

lb=-4; step=0.05; ub=4;
x=lb:step:ub;
mu=0; sigma=1;
px=(1/(sqrt(2*pi)*sigma))*exp(-(x-mu).^2/(2*sigma^2));

figure(1);
px_int=trapz(x,px);
str=num2str(px_int);
plot(x,px,'-.b','LineWidth',1.5);
title(['PDF of Gaussian Distribution N(0, 1)',' [Target Integral Value:', str, ']']);
xlabel('x');
ylabel('p_{\mu}(x)');
grid on;

figure(2);
N=1000000;
noise=randn(1, N);
meanvalue=mean(noise);     %mean
variance=var(noise);       %variance
[px1,x1]=ksdensity(noise); %PDF
plot(x,px,'-.b','LineWidth',1.5);hold on;
plot(x1,px1,'*r','LineWidth',1.5);
title('PDF of Gaussian Distribution in Task 1.1 and Task 1.2');
xlabel('x');
ylabel('p_{\mu}(x)');
legend('Task 1.1 Realization','Task 1.2 Realization');
grid on;



