
% Exercise 3: Investigate Spectral Leakage

clear;
close all;
clc;

% Last digit of student number
d = 7;
f2 = 13.2 + 0.17*d;

fs = 200;

%% One-second recording
T1 = 1;
t1 = 0:1/fs:T1-1/fs;

x1 = 0.8*sin(2*pi*15*t1) + ...
    0.4*sin(2*pi*f2*t1);

N1 = length(x1);
Y1 = fft(x1);

P2_1 = abs(Y1/N1);
P1_1 = P2_1(1:N1/2+1);
P1_1(2:end-1) = 2*P1_1(2:end-1);

f_1 = fs*(0:N1/2)/N1;

%% Four-second recording
T4 = 4;
t4 = 0:1/fs:T4-1/fs;

x4 = 0.8*sin(2*pi*15*t4) + ...
    0.4*sin(2*pi*f2*t4);

N4 = length(x4);
Y4 = fft(x4);

P2_4 = abs(Y4/N4);
P1_4 = P2_4(1:N4/2+1);
P1_4(2:end-1) = 2*P1_4(2:end-1);

f_4 = fs*(0:N4/2)/N4;

%% Zero padding
Npad = 4*N1;

Ypad = fft(x1,Npad);

P2_pad = abs(Ypad/N1);
P1_pad = P2_pad(1:Npad/2+1);
P1_pad(2:end-1) = 2*P1_pad(2:end-1);

f_pad = fs*(0:Npad/2)/Npad;

%% Plot all three spectra
figure;

subplot(3,1,1);
plot(f_1,P1_1);
grid on;
xlim([0 30]);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('One Second Recording');

subplot(3,1,2);
plot(f_4,P1_4);
grid on;
xlim([0 30]);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Four Second Recording');

subplot(3,1,3);
plot(f_pad,P1_pad);
grid on;
xlim([0 30]);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Zero Padded Spectrum');

sgtitle('Spectral Leakage Comparison');

%% Display calculations
fprintf('Student digit d = %d\n',d);
fprintf('Second frequency = %.2f Hz\n',f2);
fprintf('One second bin spacing = %.2f Hz\n',fs/N1);
fprintf('Four second bin spacing = %.2f Hz\n',fs/N4);
fprintf('Zero padded grid spacing = %.2f Hz\n',fs/Npad);

%% Save figure
saveas(gcf,'leakage-comparison.png');
