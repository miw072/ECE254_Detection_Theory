%% PD vs PF
% clairvoyant NP detector
ENR=10.^(10/10); 
d=(ENR)^(1/2); 
PFcnd=0.01:0.01:1; 
PDcnd=Q(Qinv(PFcnd)-d); 
figure(1) 
probpaper(PFcnd,PDcnd, '-') 

% SKEA
PFskea=0.01:0.01:1; 
PDskea = Q(Qinv(PFskea/2)-d)+Q(Qinv(PFskea/2)+d); 
figure(1) 
hold on 
probpaper(PFskea,PDskea, ':') 

% SKEAP
PFskeap=0.01:0.01:1; 
PDskeap=zeros(1,100); 
for i=1:100 
    PDskeap(i)=Qchipr2(2,ENR,2*log(1./PFskeap(i)),1e-5); 
end 
figure(1) 
probpaper(PFskeap,PDskeap, '-.') 

% SKEAPF k = 8
PFskeapf=0.01:0.01:1; 
K1=8; 
x1=-2*log(1-(1-PFskeapf).^(1/K1)); 
PDskeapf8=zeros(1,100); 
for i=1:100 
    PDskeapf8(i)=Qchipr2(2,ENR,x1(i),1e-5); 
end 
figure(1) 
probpaper(PFskeapf,PDskeapf8, '--') 

% SKEAPF k = 64
PFskeapf=0.01:0.01:1; 
K2=64; 
x2=-2*log(1-(1-PFskeapf).^(1/K2)); 
PDskeapf64=zeros(1,100); 
for i=1:100 
    PDskeapf64(i)=Qchipr2(2,ENR,x2(i),1e-5); 
end 
figure(1) 
probpaper(PFskeapf,PDskeapf64,'y')

legend('clairvoyant NP detector','SKEA','SKEAP','SKEAPF k = 8','SKEAPF k = 64');

%% PD vs ENR
PFA1=10^-1; 
PFA2=10^-2; 
PFA3=10^-3; 
ENR=0:0.5:20; 
lamda=10.^(ENR./10); 

% clairvoyant NP detector
d=(10.^(ENR/10)).^(1/2); 
PDske1=Q(Qinv(PFA1)-d); 
PDske2=Q(Qinv(PFA2)-d); 
PDske3=Q(Qinv(PFA3)-d); 
figure(2) 
plot(ENR,PDske1,'-') 
hold on 
plot(ENR,PDske2,':') 
plot(ENR,PDske3,'-.') 
grid; 
title('PD vs ENR clairvoyant NP detector');
xlabel('ENR/dB');ylabel('PD');
legend('0.1','0.01','0.001');

% SKEA
PDskea1=Q(Qinv(PFA1/2)-d)+Q(Qinv(PFA1/2)+d); 
PDskea2=Q(Qinv(PFA2/2)-d)+Q(Qinv(PFA2/2)+d); 
PDskea3=Q(Qinv(PFA3/2)-d)+Q(Qinv(PFA3/2)+d); 
figure(3) 
plot(ENR,PDskea1,'-') 
hold on 
plot(ENR,PDskea2,':') 
plot(ENR,PDskea3,'-.') 
grid; 
title('PD vs ENR SKEA');
xlabel('ENR/dB');ylabel('PD');
legend('0.1','0.01','0.001');

% SKEAP
PD1skeap=zeros(1,41); 
PD2skeap=zeros(1,41); 
PD3skeap=zeros(1,41); 
for i=1:41 
PD1skeap(i)=Qchipr2(2,lamda(i),2*log(1./PFA1),1e-5); 
PD2skeap(i)=Qchipr2(2,lamda(i),2*log(1./PFA2),1e-5); 
PD3skeap(i)=Qchipr2(2,lamda(i),2*log(1./PFA3),1e-5); 
end 
figure(4) 
plot(ENR,PD1skeap,'-') 
hold on 
plot(ENR,PD2skeap,':') 
plot(ENR,PD3skeap,'-.') 
grid; 
title('PD vs ENR SKEAP');
xlabel('ENR/dB');ylabel('PD');
legend('0.1','0.01','0.001');

% SKEAPF k = 8
K1=8; 
x1=-2*log(1-(1-PFA1).^(1/K1)); 
x2=-2*log(1-(1-PFA2).^(1/K1)); 
x3=-2*log(1-(1-PFA3).^(1/K1)); 
PD1skeapf=zeros(1,41); 
PD2skeapf=zeros(1,41); 
PD3skeapf=zeros(1,41); 
for i=1:41 
    PD1skeapf(i)=Qchipr2(2,lamda(i),x1,1e-5); 
    PD2skeapf(i)=Qchipr2(2,lamda(i),x2,1e-5); 
    PD3skeapf(i)=Qchipr2(2,lamda(i),x3,1e-5); 
end 
figure(5) 
plot(ENR,PD1skeapf,'-') 
hold on 
plot(ENR,PD2skeapf,':') 
plot(ENR,PD3skeapf,'-.') 
grid; 
title('PD vs ENR SKEAPF k = 8');
xlabel('ENR/dB');ylabel('PD');
legend('0.1','0.01','0.001');

% SKEAPF k = 64
K2=64; 
x4=-2*log(1-(1-PFA1).^(1/K2)); 
x5=-2*log(1-(1-PFA2).^(1/K2)); 
x6=-2*log(1-(1-PFA3).^(1/K2)); 
PD4skeapf=zeros(1,41); 
PD5skeapf=zeros(1,41); 
PD6skeapf=zeros(1,41); 
for i=1:41 
PD4skeapf(i)=Qchipr2(2,lamda(i),x4,1e-5); 
PD5skeapf(i)=Qchipr2(2,lamda(i),x5,1e-5); 
PD6skeapf(i)=Qchipr2(2,lamda(i),x6,1e-5); 
end 
figure(6) 
plot(ENR,PD4skeapf,'-') 
hold on 
plot(ENR,PD5skeapf,':') 
plot(ENR,PD6skeapf,'-.') 
grid; 
title('PD vs ENR SKEAPF k = 64');
xlabel('ENR/dB');ylabel('PD');
legend('0.1','0.01','0.001');

