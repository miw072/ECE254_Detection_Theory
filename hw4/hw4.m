%% SKEP with fixed ENR
clear;clc;
ENR = 10;
lambda = ENR;
pf1 = 0.01:0.01:1;
x1 = -2*log(pf1);
pd1 = Qchipr2(2, lambda, x1, 1e-5);
figure(1) 
probpaper(pf1,pd1, 'r');
%% Rayleigh fading sinusoid with fixed ENR
pf2=0.01:0.01:1; 
pd2=pf2.^(1/(1+ENR/2)); 
figure(1) 
hold on 
probpaper(pf2,pd2, 'b') 
%% Energy detector with fixed ENR
% N = 128
N1=128; 
pf3=0.01:0.01:1; 
pd3=zeros(1,100); 
for i=1:100 
    r1=getgama(pf3(i),N1); 
    R1=2*r1; 
    gama1=R1/(ENR/N1+1); 
    pd3(i)=Qchipr2(N1,0,gama1,1e-5); 
end 
figure(1) 
hold on
probpaper(pf3,pd3, 'y')
% N = 16
N2=16; 
pf4=0.01:0.01:1; 
grid 
r2=getgama(pf4,N2); 
R2=2*r2; 
gama2=R2/(ENR/N2+1); 
pd4=Qchipr2(N2,0,gama2,1e-5); 
figure(1) 
probpaper(pf4,pd4, 'c') 
legend('SKEP', 'Rayleigh fading sinusoid', 'Energy detector with N = 128', 'Energy detector with N = 16');

%% 3B SKEP 
pf1 = 10^-1;
pf2 = 10^-2;
pf3 = 10^-3;
ENR=0:0.5:30; 
lambda=10.^(ENR/10); 
x1=2*log(1/pf1); 
x2=2*log(1/pf2); 
x3=2*log(1/pf3); 
pd1=zeros(1,61); 
pd2=zeros(1,61); 
pd3=zeros(1,61); 
for i=1:61 
    pd1(i)=Qchipr2(2,lambda(i),x1,1e-5); 
    pd2(i)=Qchipr2(2,lambda(i),x2,1e-5); 
    pd3(i)=Qchipr2(2,lambda(i),x3,1e-5); 
end 
figure(2) 
plot(ENR,pd1,'b') 
hold on 
plot(ENR,pd2,'y') 
plot(ENR,pd3,'r') 
grid; 
title('PD (linear) vs. ENR (dB) for PF = 10-1, 10-2, and 10-3 with SKEP.');
legend('pf=10^-1','pf=10^-2','pf=10^-3');
%% Rayleigh
x=10.^(ENR/10); 
y=1./(x/2+1); 
pd4=pf1.^y; 
pd5=pf2.^y; 
pd6=pf3.^y; 
figure(3) 
plot(ENR,pd4,'b') 
hold on 
plot(ENR,pd5,'y') 
plot(ENR,pd6,'r') 
grid; 
title('PD (linear) vs. ENR (dB) for PF = 10-1, 10-2, and 10-3 with Rayleigh fading sinusoid.');
legend('pf=10^-1','pf=10^-2','pf=10^-3');
%% Energy Detector
%N=128
N1=128; 
pd7=zeros(1,61); 
pd8=zeros(1,61); 
pd9=zeros(1,61); 
r7=getgama(pf1,N1); 
R7=2*r7; 
r8=getgama(pf2,N1); 
R8=2*r8; 
r9=getgama(pf3,N1); 
R9=2*r9; 
for i=1:61 
    gama7=R7/(x(i)/N1+1); 
    pd7(i)=Qchipr2(N1,0,gama7,1e-5); 
    gama8=R8/(x(i)/N1+1); 
    pd8(i)=Qchipr2(N1,0,gama8,1e-5); 
    gama9=R9/(x(i)/N1+1); 
    pd9(i)=Qchipr2(N1,0,gama9,1e-5); 
end 
figure(4) 
plot(ENR,pd7,'b') 
hold on 
plot(ENR,pd8,'y') 
plot(ENR,pd9,'r') 
axis([0 30 0 1]) 
grid; 
title('PD (linear) vs. ENR (dB) for PF = 10-1, 10-2, and 10-3 with Energy Detecor and N = 128.');
legend('pf=10^-1','pf=10^-2','pf=10^-3');

% N= 16
N2=16; 
pd10=zeros(1,61); 
pd11=zeros(1,61); 
pd12=zeros(1,61); 
r10=getgama(pf1,N2); 
R10=2*r10; 
r11=getgama(pf2,N2); 
R11=2*r11; 
r12=getgama(pf3,N2); 
R12=2*r12; 
for i=1:61 
    gama10=R10/(x(i)/N2+1); 
    pd10(i)=Qchipr2(N2,0,gama10,1e-5); 
    gama11=R11/(x(i)/N2+1); 
    pd11(i)=Qchipr2(N2,0,gama11,1e-5); 
    gama12=R12/(x(i)/N2+1); 
    pd12(i)=Qchipr2(N2,0,gama12,1e-5); 
end 
figure(5) 
plot(ENR,pd10,'b') 
hold on 
plot(ENR,pd11,'y') 
plot(ENR,pd12,'r') 
grid; 
title('PD (linear) vs. ENR (dB) for PF = 10-1, 10-2, and 10-3 with Energy Detector and N = 16.');
legend('pf=10^-1','pf=10^-2','pf=10^-3');