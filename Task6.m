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
EbN0dB=0:2:6;  %in dB
EbN0space=10.^(EbN0dB/10);
N0=Eb./EbN0space;
sigma=sqrt(N0/2);
redata=zeros(nsymbol,2);
Pb=zeros(1,length(sigma));
for EbN0=1:length(sigma)
    n1=sigma(EbN0)*randn(1,nsymbol);
    n2=sigma(EbN0)*randn(1,nsymbol);
    receive=message+n1+n2*1i;
    m1=find(angle(receive)<=pi/2&angle(receive)>0);  % demodulation
    redata(m1,1)=0;
    redata(m1,2)=0;
    m2=find(angle(receive)>pi/2&angle(receive)<=pi); % demodulation
    redata(m2,1)=0;
    redata(m2,2)=1;
    m3=find(angle(receive)>-pi&angle(receive)<=-pi/2); % demodulation
    redata(m3,1)=1;
    redata(m3,2)=1;
    m4=find(angle(receive)>-pi/2&angle(receive)<=0); % demodulation
    redata(m4,1)=1;
    redata(m4,2)=0;
    [resum,ratio1]=biterr(data,redata);
    Pb(EbN0)=resum/(nsymbol*2);
end

theoryBEP=qfunc(sqrt(2*EbN0space));

plot(EbN0dB,theoryBEP,'-^b','LineWidth',1.5);hold on;
plot(EbN0dB,Pb,'-*r','LineWidth',1.5);
xlabel('Eb/N0(dB)'); ylabel('BEP');
legend('Theoretical Results','Simulation Results');
grid on;
title('BEP of QPSK system');


