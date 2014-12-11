%%script for problem3d
close all
clc
format long
%set t0, tend, delta_t
t0=0; t1=1; delta_t=1/1000;

%initialize y0
y0=0;

%define df
d2f = @(t,df) 2+2*t - 16 * df.^4;
%d2f =@(t,df) 0*t + df;

% %first part, g=-0.6044 and g=1
g = -0.6032;

y=runge_kutta_three_second_order(d2f,delta_t,t0,t1,y0,g);
y_low = y(end);
fprintf('y= %f when g=-0.6044 \n',y(end))
% close all
% figure(1)
% plot(t0:delta_t:t1,y)

g=1;
y=runge_kutta_three_second_order(d2f,delta_t,t0,t1,y0,g);
y_high = y(end);
fprintf('y= %f when g=1 \n',y(end))
% figure(2)
% hold on
% plot(t0:delta_t:t1,y)
%plot(t0:delta_t:t1,exp([t0:delta_t:t1])-1,'r-')

%bisection method
g_low = -0.6044;
g_high = 1;
y_mid = 1; %initialize

while abs(y_mid) >1e-6 
  g_mid = (g_low+g_high)/2;
  [y,dy] = runge_kutta_three_second_order(d2f,delta_t,t0,t1,y0,g_mid);
  y_mid = y(end);
  
  if y_mid < 0 
    g_low = g_mid;
  else
    g_high = g_mid;
  end
  %pause
end

fprintf('y is %f when g_is %f \n',y_mid,g_mid)

close all
figure(1)
hold on
title('solution to ode')
xlabel('time')
ylabel('y')
plot(t0:delta_t:t1,y,'r-')
plot(t0:delta_t:t1,dy,'b-')
legend('y','dy')

