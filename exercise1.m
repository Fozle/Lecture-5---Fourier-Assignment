
% Exercise 1: Build a Square Wave from Harmonics

clear;
close all;
clc;

t = linspace(-1, 1, 4000);
H_values = [1 3 9 25];

figure;

for i = 1:length(H_values)

    H = H_values(i);
    x = zeros(size(t));

    for k = 1:2:H
        x = x + (4/pi) * sin(2*pi*k*t) / k;
    end

    subplot(2,2,i);
    plot(t,x,'LineWidth',1.2);
    grid on;

    xlabel('Time (s)');
    ylabel('Amplitude');
    title(['Highest harmonic H = ',num2str(H)]);
end

sgtitle('Square Wave Approximation');

saveas(gcf,'square-wave-comparison.png');
