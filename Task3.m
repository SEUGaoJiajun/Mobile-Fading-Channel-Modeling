clear,clc;close all;
b=1;
fm=91;
N1=9;N2=10;
Tsim=0.4;
fs=270.8*1e3;
tspace=0:1/fs:Tsim;
c1=sqrt(2*b/N1)*ones(1,N1);
f1=fm*sin(pi*((1:N1)-0.5)/(2*N1));
theta1=2*pi*(1:N1)/(N1+1);
c2=sqrt(2*b/N2)*ones(1,N2);
f2=fm*sin(pi*((1:N2)-0.5)/(2*N2));
theta2=2*pi*(1:N2)/(N2+1);
alphat=zeros(1,length(tspace));
jj=0;

for tt=tspace
    jj=jj+1;
    g1 = g_i(c1,f1,theta1,tt);
    g2 = g_i(c2,f2,theta2,tt);
    alphat(jj)=sqrt(g1^2+g2^2);
end

figure(1);
plot(tspace,20*log(alphat),'-b','LineWidth',1.5);grid on;
xlabel('t(s)');
ylabel('\alpha_{dB}(t) (dB)');
title('Channel Amplitude in dB');



