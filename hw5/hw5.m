%% Bayesian PD vs PF
% SKEP
ENR=10.^(10/10); 
lambda=ENR; 
PFA1=0.01:0.01:1; 
x1=-2*log(PFA1); 
PD1=Qchipr2(2,lambda,x1,1e-5); 
figure(1) 
probpaper(PFA1,PD1, '-');
% Rayleigh
PFA2=0.01:0.01:1; 
PD2=PFA2.^(1/(1+ENR/2)); 
figure(1) 
hold on 
probpaper(PFA2,PD2, '--')
% SKEA
PFA3=0.01:0.01:1; 
PF=PFA3/2; 
PD3=2*Q(1/(ENR+1)^(1/2)*Qinv(PF)); 
figure(1) 
probpaper(PFA3,PD3, '-.') 
legend('skep', 'rayleigh fading sin', 'skea');

%% Bayesian PD vs ENR
PFA1=10^-1; 
PFA2=10^-2; 
PFA3=10^-3; 
ENR=0:0.5:20;
% SKEP
lambda=10.^(ENR/10); 
x1=2*log(1/PFA1); 
x2=2*log(1/PFA2); 
x3=2*log(1/PFA3); 
PD1=zeros(1,41); 
PD2=zeros(1,41); 
PD3=zeros(1,41); 
for i=1:41 
    PD1(i)=Qchipr2(2,lambda(i),x1,1e-5); 
    PD2(i)=Qchipr2(2,lambda(i),x2,1e-5); 
    PD3(i)=Qchipr2(2,lambda(i),x3,1e-5); 
end 
figure(2) 
plot(ENR,PD1,'-') 
hold on 
plot(ENR,PD2,'--') 
plot(ENR,PD3,'-.')
legend('0.1','0.01','0.001');
title('PD vs ENR of SKEP in linear paper(Bayesian Approach)');
grid; 

% Rayleigh
x=10.^(ENR/10); 
y=1./(x/2+1); 
PD4=PFA1.^y; 
PD5=PFA2.^y; 
PD6=PFA3.^y; 
figure(3) 
plot(ENR,PD4,'-') 
hold on 
plot(ENR,PD5,'--') 
plot(ENR,PD6,'-.') 
legend('0.1','0.01','0.001');
title('PD vs ENR of Rayleigh fading sinusoid in linear paper(Bayesian Approach)');
grid; 

%SKEA
avgENR=10.^(ENR/10); 
x7=Qinv(PFA1/2); 
x8=Qinv(PFA2/2); 
x9=Qinv(PFA3/2); 
PD7=2*Q(1./(avgENR+1).^(1/2)*x7); 
PD8=2*Q(1./(avgENR+1).^(1/2)*x8); 
PD9=2*Q(1./(avgENR+1).^(1/2)*x9); 
figure(4) 
plot(ENR,PD7,'-') 
hold on 
plot(ENR,PD8,'--') 
plot(ENR,PD9,'-.') 
legend('0.1','0.01','0.001');
title('PD vs ENR of SKEA in linear paper(Bayesian Approach)');
grid; 

%% GLRT PD vs PF
% clairvoyant NP detector
ENR=10.^(10/10); 
d=(ENR)^(1/2); 
PFcl=0.01:0.01:1; 
PDcl=Q(Qinv(PFcl)-d); 
figure(5) 
probpaper(PFcl,PDcl,'-')

% SKEA
PFskea=0.01:0.01:1; 
PDskea=Q(Qinv(PFskea/2)-d)+Q(Qinv(PFskea/2)+d); 
figure(5) 
hold on 
probpaper(PFskea,PDskea,'--') 
grid;
legend('clairvoyant', 'skea');

%% GLRT PD vs ENR
% clairvoyant NP detector
ENR=0:0.5:20; 
d=(10.^(ENR/10)).^(1/2); 
PFA1=10^-1; 
PFA2=10^-2; 
PFA3=10^-3; 
PDske1=Q(Qinv(PFA1)-d); 
PDske2=Q(Qinv(PFA2)-d); 
PDske3=Q(Qinv(PFA3)-d); 
figure(6) 
plot(ENR,PDske1,'-') 
hold on 
plot(ENR,PDske2,'--') 
plot(ENR,PDske3,'-.') 
legend('0.1','0.01','0.001');
title('PD vs ENR of clairvoyant NP detector in linear paper(GLRT approach) ');
grid; 

%SKEA 
PDskea1=Q(Qinv(PFA1/2)-d)+Q(Qinv(PFA1/2)+d); 
PDskea2=Q(Qinv(PFA2/2)-d)+Q(Qinv(PFA2/2)+d); 
PDskea3=Q(Qinv(PFA3/2)-d)+Q(Qinv(PFA3/2)+d); 
figure(7) 
plot(ENR,PDskea1,'-') 
hold on 
plot(ENR,PDskea2,'--') 
plot(ENR,PDskea3,'-.') 
legend('0.1','0.01','0.001');
title('PD vs ENR of SKEA in linear paper(GLRT)')
grid;
