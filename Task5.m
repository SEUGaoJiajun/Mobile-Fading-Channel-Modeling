clear,clc;close all;
M=4;
N=100000;
nsymbol=N/2;
data= randsrc(nsymbol,2,[0 1]);
set=exp(1i*(1:2:7)*pi/4);  %generate stars

[a1,b1]=find(data(:,1)==0&data(:,2)==0);
message(a1)=set(1);
[a2,b2]=find(data(:,1)==0&data(:,2)==1);
message(a2)=set(2);
[a3,b3]=find(data(:,1)==1&data(:,2)==1);
message(a3)=set(3); 
[a4,b4]=find(data(:,1)==1&data(:,2)==0);
message(a4)=set(4);   
Es=norm(message).^2/nsymbol; % per symbol
Eb=Es/(log2(M));            % per bit
EbN0dB=[6 9];  %in dB
EbN0space=10.^(EbN0dB/10);
N0=Eb./EbN0space;
sigma=sqrt(N0/2);


figure(1);
t=0:pi/40:2*pi;r=1;
x=r*cos(t);y=r*sin(t);
plot(x,y,'--b','LineWidth',2.5);hold on;
axis equal
plot(real(message),imag(message),'r*','LineWidth',2.5);
grid on;
title('Constellation Diagram of QPSK');

n1=sigma(1)*randn(1,nsymbol);
n2=sigma(1)*randn(1,nsymbol);
receive=message+n1+n2*1i;
figure(2);
t=0:pi/40:2*pi;r=1;
x=r*cos(t);y=r*sin(t);
plot(real(receive),imag(receive),'g.');hold on;
plot(x,y,'--b','LineWidth',2.5);hold on;
plot(real(message),imag(message),'r+','LineWidth',2.5);
axis equal
title('Constellation Diagram with 6 dB Eb/N0');

n1=sigma(2)*randn(1,nsymbol);
n2=sigma(2)*randn(1,nsymbol);
receive=message+n1+n2*1i;
figure(3);
t=0:pi/40:2*pi;r=1;
x=r*cos(t);y=r*sin(t);
plot(real(receive),imag(receive),'g.');hold on;
plot(x,y,'--b','LineWidth',2.5);hold on;
plot(real(message),imag(message),'r+','LineWidth',2.5);
axis equal
title('Constellation Diagram with 9 dB Eb/N0');

