function [y,dy]=runge_kutta_three_second_order(d2f,delta_t,t_start,t_end,y0,dy0)

%intialize time
time = t_start:delta_t:t_end;
y  = zeros(1,length(time));  y(1) = y0;
dy = zeros(1,length(time)); dy(1) = dy0;

%intialize beta, gamma
beta=1/3;
gamma=1/2;

f= @(tt,yy) yy+0*tt;

%compute dy
for i=2:length(time)
   %compute y
   k1 = d2f(time(i-1),dy(i-1));
   k2 = d2f(time(i-1)+beta*delta_t , dy(i-1) + beta  * delta_t *k1);
   k3 = d2f(time(i-1)+gamma*delta_t, dy(i-1) + gamma * delta_t *k2);
   dy(i)=dy(i-1)+k3*delta_t;
   
   %compute dy
   g1 = f(time(i-1),dy(i-1));
   g2 = f(time(i-1)+beta*delta_t , dy(i-1) + beta  * delta_t *g1);
   g3 = f(time(i-1)+gamma*delta_t, dy(i-1) + gamma * delta_t *g2);
   y(i)=y(i-1)+g3*delta_t;
end
