clear all;
close all;
clc; 
L=4;
Delay=[0,1,3,5]; 
Gain=[-20,-10,0,-20]; 
Gain_linear=10.^(Gain./10); 
Delay_spread=max(Delay)-min(Delay); 
disp(Delay_spread);
Summ=sum(Delay.*Gain_linear);
gain_sum=sum(Gain_linear); 
Mean_Delay=Summ/gain_sum; 
disp(Mean_Delay); 
for i=1:5
new_array_delay=(Delay - Mean_Delay).^2; 
end
square_num=sqrt(sum(new_array_delay.*Gain_linear));
RMS=square_num/(sqrt(gain_sum)); 
disp(RMS);
figure;
stem(Delay,Gain);
xlabel("Delay(us)"); 
ylabel("Gain(dB)"); 
title("PDP Plot");