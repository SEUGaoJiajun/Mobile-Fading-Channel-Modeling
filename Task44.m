clear,clc;close all;
b=1;
fm=91;
N1=9;N2=10;
Tsim=20;
fs=1*1e3;
tspace=10000/fs:1/fs:20000/fs;
c1=sqrt(2*b/N1)*ones(1,N1);
f1=fm*sin(pi*((1:N1)-0.5)/(2*N1));
theta1=2*pi*(1:N1)/(N1+1);
c2=sqrt(2*b/N2)*ones(1,N2);
f2=fm*sin(pi*((1:N2)-0.5)/(2*N2));
theta2=2*pi*(1:N2)/(N2+1);
g1t=zeros(1,length(tspace));
jj=0;
for tt=tspace
    jj=jj+1;
    g1 = g_i(c1,f1,theta1,tt);
    g2 = g_i(c2,f2,theta2,tt);
    g1t(jj)=g1;
end

[ACF, x]=xcorr(g1t,'bias');

figure(1);
plot(x/fs,ACF,'-b','LineWidth',1.5);hold on;
title('ACF of Tilde g_1(t)');
xlabel('\tau (s)');
ylabel('\phi_{g_I g_I}(\tau) (W)');
grid on;
NN=length(ACF);
ACF0=ACF((NN+1)/2);

