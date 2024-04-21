% Create Date: 14.02.2024
% Designer Name: Anushka Chintawar
% Project Name: 
% Target Devices: 
% Tool Versions: 
% Description: 
% Reach me: bt21ece096@iiitn.ac.in  
% Revision:
% Additional Comments:

% field 1km - 1km
% 20 mobiles + 1 base server(fixed) (21 dots displayed)
clear all;
close all;
clc;
pt = 40;     % transmitted power
gt = 1;
gr = 1;
op_freq = 900000000;    %900Mhz mobile freq
lambda = 300000000/op_freq;
field = zeros(1000);
towerX = 500;
towerY = 500;
locations = 20;
deviceX = randi([1,1000],1,locations);   %randperm(1000,20)
deviceY = randi([1,1000],1,locations);
df = 150;     %fraunhofer distance
outside = 400;   %outside range of tower
distance = sqrt((deviceX - towerX).^2 + (deviceY - towerY).^2);
farfield = distance >= df & distance < outside;
nearfield = distance < df;
outfield = distance >= outside;
scatter(towerX, towerY, 'ro', 'filled');
hold on;
scatter(deviceX(farfield), deviceY(farfield), 'bo');
scatter(deviceX(nearfield), deviceY(nearfield), 'go');
scatter(deviceX(outfield), deviceY(outfield), 'go');
theta = linspace(0, 2*pi, 100);
x_circle = towerX + df * cos(theta);
y_circle = towerY + df * sin(theta);
plot(x_circle, y_circle, 'k--');

x_circle = towerX + outside * cos(theta);
y_circle = towerY + outside * sin(theta);
plot(x_circle, y_circle, 'r--');

title('Field');
legend('Base Station',  'Far Field Devices', 'Near/Outside Field Devices');
axis([0 1000 0 1000]);
hold off;
pr = zeros(1,20);
for i = 1:locations
    if(distance(i) < df)
        pr_dbm(i) = 0;
    elseif(distance(i) >= outside)
            pr_dbm(i) = 0;
    else
        pr(i) = pt*gt*gr*(lambda/(4*pi*distance(i)))^2;
        pr_dbm(i) = (10*(log(pr(i))/log(10)))+30;
    end
end
disp(pr_dbm);
fld = {'Near field', 'Far field', 'Outside field'};
for i = 1:locations
    if(distance(i) < df)
        x(i) = fld(0);
    elseif(distance(i) >= outside)
            x(i) = fld(2);
    else
        x(i) = fld(1);
    end
end

device= struct('model', {},'x_c', {}, 'y_c', {}, 'dist', {}, 'loc', {}, 'pr', {});
for i = 1:locations
    device(i).model = ['Device ', num2str(i)];
    device(i).x_c = ['x = ', num2str(deviceX(i))];
    device(i).y_c = ['y = ', num2str(deviceY(i))];
    device(i).dist = ['d = ', num2str(distance(i))];
    device(i).loc = [x(i)];
    device(i).pr = ['P_r = ', num2str(pr_dbm(i))];
end
for i = 1:locations
   disp(['Device ', num2str(i), ' Parameters:']);
   disp(['Model: ', device(i).model]);
   disp(['x-coordinate: ', device(i).x_c]);
   disp(['y-coordinate: ', device(i).y_c]);
   disp(['Distance: ', device(i).dist, ' m']);
   disp(['Location: ', device.(i).loc]);
   disp(['Received Power: ', device(i).pr, ' dBm']);
end

%channel modelling