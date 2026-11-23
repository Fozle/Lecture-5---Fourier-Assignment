
% Exercise 2: Find Two Frequencies with FFT

clear;
close all;
clc;

fs = 200;
T = 1;
t = 0:1/fs:T-1/fs;

% Generate signal
x = 0.8*sin(2*pi*15*t) + 0.4*sin(2*pi*40*t);

% Calculate FFT
N = length(x);
Y = fft(x);

P2 = abs(Y/N);
P1 = P2(1:N/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = fs*(0:N/2)/N;

% Frequency bin spacing
df = fs/N;

% Plot results
figure;

subplot(2,1,1);
plot(t,x,'LineWidth',1.2);
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Time Domain Signal');

subplot(2,1,2);
plot(f,P1,'LineWidth',1.2);
grid on;
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Single-Sided Amplitude Spectrum');

% Display results
fprintf('Number of samples = %d\n',N);
fprintf('Frequency bin spacing = %.2f Hz\n',df);

saveas(gcf,'two-frequency-spectrum.png');
