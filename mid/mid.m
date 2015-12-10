clear;clc;
C=eye(16); 
for m=1:16 
    for n=1:16 
        if abs(m-n)==1  
            C(m,n)=0.9/1.81; 
            C(n,m)=0.9/1.81; 
        end 
    end 
end 
n = 0:15;
N= 256;
fc = 1/16;
fp = 3/(8*16);
d1=4; 
A = (1/2)^(1/2);
sn = A*sin(2*pi*fc*n);
% sn = A*sin(2*pi*(fc+fp*n/2).*n);
hn1 =1;
hn2 = (1/1.81)^(1/2)*[1, 0.9];
omega = 0:0.5/127:0.5;
%optimal 
% [V, D] = eig(inv(C));
% ei = V(:, 16) * 2;
% dmax = ei'/C*ei;
% sn = ei';  

sf = 10*log10((abs(fft(sn,N))).^2); 
hf1 = 10*log10((abs(fft(hn1, N))).^2); 
hf2 = 10*log10((abs(fft(hn2, N))).^2);
figure(1) 
subplot(211)
stem(n, sn)
title('time series')
xlabel('n')
ylabel('Amplitude')
subplot(212) 
plot(omega,sf(1:128));
title('|S(f)^2|')
xlabel('normalized freqency')
ylabel('Amplitude/dB')
axis([0 0.5 -20 20]) 
figure(2);
plot(omega,sf(1:128), 'b');
hold on
plot(omega,hf1(1:128), 'r')
hold on
plot(omega,hf2(1:128), 'g')
title('|S(f)^2|, |h1(f)^2 and |h2(f)^2');
xlabel('normalized freqency');
ylabel('Amplitude/dB')
legend('|S(f)^2|','|h1(f)^2','|h2(f)^2');
axis([0 0.5 -20 20]) 
% subplot(4,1,2) 
% plot(omega,sf(1:128));
% title('|S(f)^2|')
% xlabel('w/rad')
% ylabel('Amplitude/dB')
% axis([0 pi -30 30]) 
% subplot(4,1,3) 
% plot(omega,hf1(1:128))
% title('|h1(f)^2|')
% xlabel('w/rad')
% ylabel('Amplitude/dB')
% subplot(4,1,4) 
% plot(omega,hf2(1:128))
% title('|h2(f)^2|')
% xlabel('w/rad')
% ylabel('Amplitude/dB')
% axis([0 pi -10 5]) 


%1st

PF1=0:0.0001:0.5; 
a1=Qinv(PF1); 
PD1=Q(a1-d1^(1/2)); 

%2nd

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

figure(3) 
probpaper(PF1,PD1, 'b') 
hold on 
probpaper(PF2,PD2, 'r') 
probpaper(PF3,PD3, 'y')
legend('Uncorrelated noise, matched filter', 'Correlated noise, general matched filter', 'Correlated noise, matched filter');

