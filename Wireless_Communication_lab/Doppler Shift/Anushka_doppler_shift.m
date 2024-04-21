close all;
clear all; 
clc;
theta= 0:0.01:180; %Angle between source and
%reciever%<------------------------> %PART 1
%Carrier Frequencies 
fc1= 9*10^8;
fc2= 18*10^8;
fc3= 2.4*10^9;
lambdac1= (3*10^8)/fc1;
lambdac2= (3*10^8)/fc2;
lambdac3= (3*10^8)/fc3;
Vm=100;
%Doppler Shift
fd1=(Vm.*cosd(theta))/lambdac1;
f1=fc1+fd1;
fd2=(Vm.*cosd(theta))/lambdac2;
f2=fc2+fd2;
fd3=(Vm.*cosd(theta))/lambdac3;
f3=fc3+fd3;
% Doppler Shift vs Theta Plot
figure;
title('DOPPLER SHIFT');
subplot(3,1,1);
p1=plot(theta,f1,'r','linewidth',2);
datatip(p1,90,9*10^8);
title('Carrier Freqeuncy: 900 MHz');
xlabel('Theta (in Deg)');
ylabel('Doppler shift (in Hz)');
subplot(3,1,2);
p2=plot(theta,f2,'linewidth',2);
datatip(p2,90,18*10^8);
title('Carrier Freqeuncy: 1800 MHz');
xlabel('Theta (in Deg)');
ylabel('Doppler shift (in Hz)');
subplot(3,1,3);
p3=plot(theta,f3,'g','linewidth',2);
datatip(p3,90,2.4*10^9);
title('Carrier Freqeuncy: 2.4 GHz');
%Velocity of mobile
xlabel('Theta (in Deg)');
ylabel('Doppler shift (in Hz)');
%<------------------------> %PART 2
fc= 9*10^8;
lambdac= (3*10^8)/fc1; %Velocities of mobile 
Vm1=50; Vm2=100; Vm3=150;
%Doppler Shift
fd1=(Vm1.*cosd(theta))/lambdac; f1=fc+fd1;
fd2=(Vm2.*cosd(theta))/lambdac; f2=fc+fd2;
fd3=(Vm3.*cosd(theta))/lambdac; f3=fc+fd3;
% Doppler Shift vs Theeta Plot figure;
plot(theta,f1,theta,f2,theta,f3,'linewidth',2); title('DOPPLER SHIFT');
legend('Mobile Velocity: 50m/s','Mobile Velocity: 100m/s','Mobile Velocity: 150m/s');
xlabel('Theta (in Deg)');
ylabel('Doppler Shift (in Hz)');