%GSGN PD vs PF 
ENR1=10.^(10/10); 
ENR2=10.^(15/10); 
N=[2,4,8,16,32,64]; 
PFA=[0.01:0.01:1]; 
PD1=zeros(1,100); 
PD2=zeros(1,100); 
PD3=zeros(1,100); 
PD4=zeros(1,100); 
PD5=zeros(1,100); 
PD6=zeros(1,100); 
%N=2,ENR=10dB 
for i=1:100 
r1=getgama(PFA(i),N(1)); 
R1=2*r1; 
gama1=R1/(ENR1/N(1)+1); 
PD1(i)=Qchipr2(N(1),0,gama1,1e-5); 
end 
figure(1) 
probpaper(PFA,PD1) 
%N=4,ENR=10dB 
for i=1:100 
r2=getgama(PFA(i),N(2)); 
R2=2*r2; 
gama2=R2/(ENR1/N(2)+1); 
PD2(i)=Qchipr2(N(2),0,gama2,1e-5); 
end 
figure(1) 
hold on 
probpaper(PFA,PD2) 
%N=8,ENR=10dB 
for i=1:100 
r3=getgama(PFA(i),N(3)); 
R3=2*r3; 
gama3=R3/(ENR1/N(3)+1); 
PD3(i)=Qchipr2(N(3),0,gama3,1e-5); 
end 
figure(1) 
probpaper(PFA,PD3) 
%N=16,ENR=10dB 
for i=1:100 


r4=getgama(PFA(i),N(4)); 
R4=2*r4; 
gama4=R4/(ENR1/N(4)+1); 
PD4(i)=Qchipr2(N(4),0,gama4,1e-5); 
end 
figure(1) 
probpaper(PFA,PD4) 
%N=32,ENR=10dB 
for i=1:100 
r5=getgama(PFA(i),N(5)); 
R5=2*r5; 
gama5=R5/(ENR1/N(5)+1); 
PD5(i)=Qchipr2(N(5),0,gama5,1e-5); 
end 
figure(1) 
probpaper(PFA,PD5) 
%N=64,ENR=10dB 
for i=1:100 
r6=getgama(PFA(i),N(6)); 
R6=2*r6; 
gama6=R6/(ENR1/N(6)+1); 
PD6(i)=Qchipr2(N(6),0,gama6,1e-5); 
end 
figure(1) 
probpaper(PFA,PD6) 
grid; 