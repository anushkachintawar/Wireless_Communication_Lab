% Create Date: 31.01.2024
% Designer Name: Anushka Chintawar
% Project Name: PDF_CDF_Gaussian_function
% Target Devices: 
% Tool Versions: 
% Description: 
% Reach me: bt21ece096@iiitn.ac.in
% Dependencies:  
% Revision:
% Additional Comments:

clc;
clear all;
close all;
X = rand(1,501);
x = sort(X)-0.5;
% PDF
sigma = std(x);
mu = mean(x);
f_x = (1/(sigma*sqrt(2*pi)))*exp(-((x-mu).^2/(2*(sigma^2))));
subplot(2,1,1),plot(x,f_x, 'b');
title('Probability Density Function (PDF) of Gaussian Distribution');
xlabel('x');
ylabel('f(x)');
xlim([-0.5 0.5]);
ylim([0 2.8]);
hold on;

sigma1 = 1;
mu1 = 0;
f_x1 = (1/(sigma1*sqrt(2*pi)))*exp(-((x-mu1).^2/(2*(sigma1^2))));
plot(x,f_x1, 'r');

sigma2 = 0.5;
mu2 = 0;
f_x2 = normpdf(x,mu2,sigma2);
plot(x,f_x2, 'k');

sigma3 = 1.5;
mu3 = 0;
f_x3 = normpdf(x,mu3,sigma3);
plot(x,f_x3, 'g');
legend('mean = 0.0015, sigma = 0.2845', 'mean = 0, sigma = 1', 'mean = 0, sigma = 0.5', 'mean = 0, sigma = 1.5');
hold off;

% CDF
sigma = std(x);
mu = mean(x);
F_x = normcdf(x,mu,sigma);
subplot(2,1,2),plot(x,F_x, 'b');
title('Cumulative Distribution Function (CDF) of Gaussian Distribution');
xlabel('x');
ylabel('F(x)');
hold on;
ylim([0 2]);

sigma1 = 1;
mu1 = 0;
F_x1 = normcdf(x,mu1,sigma1);
plot(x,F_x1, 'r');

sigma2 = 0.5;
mu2 = 0;
F_x2 = normcdf(x,mu2,sigma2);
plot(x,F_x2, 'k');

sigma3 = 1.5;
mu3 = 0;
F_x3 = normcdf(x,mu3,sigma3);
plot(x,F_x3, 'g');
legend('mean = 0.0015, sigma = 0.2845', 'mean = 0, sigma = 1', 'mean = 0, sigma = 0.5', 'mean = 0, sigma = 1.5');
hold off;