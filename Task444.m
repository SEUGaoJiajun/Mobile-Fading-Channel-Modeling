clear,clc;close all;
b=1;
N1=9;
fs=1*1e3;
tspace=10000/fs:1/fs:20000/fs;
fm=91; % Hz (Maximum Doppler Frequency)
taulb=0;step=1e-4;tauub=0.08;
tauspace=taulb:step:tauub;
Omega_p=2; % Total received power 
phi_gIgI=(Omega_p/2)*besselj(0,2*pi*fm*tauspace);

c1=sqrt(2*b/N1)*ones(1,N1);
f1=fm*sin(pi*((1:N1)-0.5)/(2*N1));
theta1=2*pi*(1:N1)/(N1+1);
g1t=zeros(1,length(tspace));
ii=0;jj=0;
for tt=tspace
    jj=jj+1;
    g1 = g_i(c1,f1,theta1,tt);
    g1t(jj)=g1;
end
[ACF, x]=xcorr(g1t,'bias');

calACF=zeros(1,length(tauspace));
for tau=tauspace
    ii=ii+1;
    calACF(ii)=sum((c1.^2/2).*cos(2*pi*f1*tau));
end
plot(tauspace,calACF,'-b','LineWidth',2.5);hold on;
plot(x/fs,ACF,'*r','LineWidth',1.5);hold on;
plot(tauspace,phi_gIgI,'-.g','LineWidth',1.5);hold on;
grid on;
title('ACF of Tilde g_1(t)');
axis([0,0.08,-1,1.2]);
xlabel('\tau (s)');
ylabel('\phi_{g_1g_1}(\tau) (W)');
legend('ACF calculated in 3.6','ACF calculated in 3.5','Ideal ACF in (2.1)')