%% define constance
n = 0:15;
N= 256;
fc = 1/16;
A = (1/2)^(1/2);
sn = A*sin(2*pi*fc*n);
hn1 =1;
hn2 = (1/1.81)^(1/2)*[1, 0.9];
omega = -pi:2*pi/256:255*pi/256;

%% p2
sf = 10*log10((abs(fft(sn,N))).^2); 
s = sf(129:256);
sf = [s, sf(1:128)];
hf1 = 10*log10((abs(fft(hn1, N))).^2); 
hf2 = 10*log10((abs(fft(hn2, N))).^2);
h = hf2(129:256);
hf2 = [h, hf2(1:128)];
figure(1) 
subplot(3,1,1) 
plot(omega,sf)
title('|S(f)^2|')
xlabel('w/rad')
ylabel('Amplitude/dB')
axis([-pi pi -30 30]) 
subplot(3,1,2) 
plot(omega,hf1)
title('|h1(f)^2|')
xlabel('w/rad')
ylabel('Amplitude/dB')
subplot(3,1,3) 
plot(omega,hf2)
title('|h2(f)^2|')
xlabel('w/rad')
ylabel('Amplitude/dB')


%% p3
%1st
d1=4; 
PF1=0:0.0001:0.5; 
a1=Qinv(PF1); 
PD1=Q(a1-d1^(1/2)); 

%2nd
C=eye(16); 
for m=1:16 
    for n=1:16 
        if abs(m-n)==1  
            C(m,n)=0.9/1.81; 
            C(n,m)=0.9/1.81; 
        end 
    end 
end 
d2=sn/C*sn'; 
PF2=0:0.0001:0.5; 
a2=Qinv(PF2); 
PD2=Q(a2-d2^(1/2)); 
 
% 3rd
ETH1=sn*sn'; 
varTH0=sn*C*sn'; 
d3=ETH1^2/varTH0; 
PF3=0:0.0001:0.95; 
a3=Qinv(PF3); 
PD3=Q(a3-d3^(1/2)); 

figure(2) 
probpaper(PF1,PD1, 'b') 
hold on 
probpaper(PF2,PD2, 'r') 
probpaper(PF3,PD3, 'y')