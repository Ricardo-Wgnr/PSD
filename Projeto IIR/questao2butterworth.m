close all

load('bcoeflow2.mat');
load('bcoefhigh2.mat');
load('bcoefmid2.mat');
%% Sinal 
tmin = 0;             
tmax = 2;
Fs=8000;
Ts=1/Fs;
L=(tmax-tmin)/Ts;

t=0:Ts:tmax-Ts;             
s = sin(2*pi*770*t) + sin(2*pi*852*t) + sin(2*pi*941*t);
S = fft(s);
S = abs(2*S/L);
S = fftshift(S);  

%% Filtros IIR importados do filterDesigner
figure,freqz(bnum_low,bden_low);
 
s_f_low = filter(bnum_low,bden_low,s);
S_F_low = fft(s_f_low);
S_F_low = abs(2*S_F_low/L);
S_F_low=fftshift(S_F_low);  

figure,freqz(bnum_high,bden_high);
 
s_f_high = filter(bnum_high,bden_high,s);
S_F_high = fft(s_f_high);
S_F_high = abs(2*S_F_high/L);
S_F_high=fftshift(S_F_high);      

figure,freqz(bnum_high,bden_high);
 
s_f_mid = filter(bnum_mid,bden_mid,s);
S_F_mid = fft(s_f_mid);
S_F_mid = abs(2*S_F_mid/L);
S_F_mid=fftshift(S_F_mid); 

%% Gráficos
freq = Fs*(-(L/2):(L/2)-1)/L;
subplot(4,1,1),plot(freq,S)
title('Espectro de Amplitude de s(t)')
xlabel('f (Hz)')
ylabel('|S(f)|')
subplot(4,1,2),plot(freq,S_F_low)
title('Espectro de Amplitude do sinal Filtrado - baixa frequência')
xlabel('f (Hz)')
ylabel('|S(f)|')
subplot(4,1,3),plot(freq,S_F_high)
title('Espectro de Amplitude do sinal Filtrado - alta frequência')
xlabel('f (Hz)')
ylabel('|S(f)|')
subplot(4,1,4),plot(freq,S_F_mid)
title('Espectro de Amplitude do sinal Filtrado - frequência intermediária')
xlabel('f (Hz)')
ylabel('|S(f)|')