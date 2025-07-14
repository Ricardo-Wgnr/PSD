close all

load('coef1.mat')
Ts = 2;

freqz(Num, Den, 1024, 1/Ts);
title('Resposta em frequência do filtro Butterworth');   

disp(Num);
disp(Den);

