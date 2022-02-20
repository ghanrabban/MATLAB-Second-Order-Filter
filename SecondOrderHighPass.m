%% 1st and 2nd Order High-pass Filter
%% Specify the resistor and capasitor value
r1 = 11.6; %resistor 1
r2 = 11.4; %resistor 2
r3 = 11.6; %resistor 3
r4 = 11.4; %resistor 4
c = 1e-3; %capasitor

%% Building a transfer function
w = logspace(0,10,200); %frequency
s = 1i*w; %differential operator
w0 = 1/c*sqrt(r3*r4); %cut off frequency
Q = r2/sqrt(r3*r4);
x1 = s; %numerator
x2 = s + w0; %denominator
x = x1./x2; %transfer function of 1st order
y1 = s.^2; %numerator
y2 = (s.^2)+((w0/Q).*s)+(w0.^2); %denominator
y = y1./y2; %transfer function of 2nd order

%% Plotting the high-pass filter
p1 = plot(log10(w),20*log10(abs(x)),'red','Linewidth',1.5);
hold on
p2 = plot(log10(w),20*log10(abs(y)),'blue','Linewidth',1.5);
legend([p1,p2],'1st order','2nd order')
title('High Pass Filter')
xlabel('Frequency (Hz)')
ylabel('Voltage (dB)')
grid on
