close all

load('coef1.mat')
Ts = 2;

freqz(Num, Den, 1024, 1/Ts);
title('Resposta em frequência do filtro Butterworth');   

disp(Num);
disp(Den);

b = [0.00243];
a = [1 1.417 1.003 0.451 0.135 0.0256 0.00243];
fs = 1/2;
[bd,ad] = bilinear(b,a,fs)

