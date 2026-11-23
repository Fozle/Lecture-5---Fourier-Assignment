
% Exercise 4: Compare DTFT and DFT

clear;
close all;
clc;

% Original sequence
x = [1 1 1 1];
n = 0:length(x)-1;

%% Calculate DTFT
w = linspace(-pi,pi,1000);

X = x * exp(-1j*(n.'*w));

%% Calculate DFT
X4 = fft(x,4);
X64 = fft(x,64);

%% Frequency axes
w4 = (-2:1)*2*pi/4;
w64 = (-32:31)*2*pi/64;

%% Shift DFT results
X4 = fftshift(X4);
X64 = fftshift(X64);

%% Plot results
figure;

subplot(3,1,1);
plot(w,abs(X),'LineWidth',1.2);
grid on;
xlabel('Angular frequency (rad/sample)');
ylabel('Magnitude');
title('DTFT Magnitude');

subplot(3,1,2);
stem(w4,abs(X4),'filled');
grid on;
xlabel('Angular frequency (rad/sample)');
ylabel('Magnitude');
title('4-Point DFT Magnitude');

subplot(3,1,3);
stem(w64,abs(X64),'MarkerSize',3);
grid on;
xlabel('Angular frequency (rad/sample)');
ylabel('Magnitude');
title('64-Point DFT Magnitude');

sgtitle('DTFT and DFT Comparison');

%% Save figure
saveas(gcf,'dtft-dft-comparison.png');
