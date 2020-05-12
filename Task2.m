clear,clc;close all;
fm=91; % Hz (Maximum Doppler Frequency)
taulb=0;step=1e-4;tauub=0.08;
tauspace=taulb:step:tauub;
Omega_p=2; % Total received power 
phi_gIgI=(Omega_p/2)*besselj(0,2*pi*fm*tauspace);
phi_gIgI_0=phi_gIgI(1);
if phi_gIgI_0==(Omega_p/2) %judge it
    disp('Equal !!'); 
end 

figure(1);
plot(tauspace,phi_gIgI,'-b','LineWidth',1.5);grid on;
xlabel('\tau (s)');
ylabel('\phi_{g_I g_I}(\tau) (W)');
title('ACF of Clarke`s Model');

band=150; % Hz
f=-band:band;
S=(Omega_p/(2*pi*fm))./(sqrt(1-(f/fm).^2)).*(abs(f)<=fm)+0.*(abs(f)>fm);

figure(2);
plot(f,S,'-r','LineWidth',1.5);grid on;
title('PSD of g_I(t) for Clarke`s Model');
xlabel('f (Hz)');
ylabel('S_{g_Ig_I}(f) (W/Hz)');

Omega_p=1;
xlb=0;xub=2;
x=xlb:step:xub;
figure(3);
K=0;
p_alphax=(2*x*(K+1)/Omega_p).*exp(-K-((K+1)*x.^2)/Omega_p).*besseli(0,2*x*sqrt(K*(K+1)/Omega_p));
plot(x,p_alphax,'-r','LineWidth',1.5);hold on;
K=3;
p_alphax=(2*x*(K+1)/Omega_p).*exp(-K-((K+1)*x.^2)/Omega_p).*besseli(0,2*x*sqrt(K*(K+1)/Omega_p));
plot(x,p_alphax,'-g','LineWidth',1.5);hold on;
K=80;
p_alphax=(2*x*(K+1)/Omega_p).*exp(-K-((K+1)*x.^2)/Omega_p).*besseli(0,2*x*sqrt(K*(K+1)/Omega_p));
plot(x,p_alphax,'-b','LineWidth',1.5);hold on;
title('PDF of \alpha(t)');
ylabel('p_\alpha(x)');
xlabel('x');
legend('K=0','K=3','K=80');

figure(4);
K=0;
p_alpha2x=((K+1)/Omega_p)*exp(-K-(K+1)*x/Omega_p).*besseli(0,2*sqrt(K*(K+1)*x/Omega_p));
plot(x,p_alpha2x,'-r','LineWidth',1.5);hold on;
K=3;
p_alpha2x=((K+1)/Omega_p)*exp(-K-(K+1)*x/Omega_p).*besseli(0,2*sqrt(K*(K+1)*x/Omega_p));
plot(x,p_alpha2x,'-g','LineWidth',1.5);hold on;
K=80;
p_alpha2x=((K+1)/Omega_p)*exp(-K-(K+1)*x/Omega_p).*besseli(0,2*sqrt(K*(K+1)*x/Omega_p));
plot(x,p_alpha2x,'-b','LineWidth',1.5);hold on;
title('PDF of \alpha^2(t)');
ylabel('p_{\alpha^2}(x)');
xlabel('x');
legend('K=0','K=3','K=80');

