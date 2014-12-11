function y=runge_kutta_three(func,delta_t,t_start,t_end,y0)

%intialize time
time = t_start:delta_t:t_end;
y = zeros(1,length(time)); y(1) = y0;

%intialize beta, gamma
beta=1/3;
gamma=1/2;


for i=2:length(time)
   k1 = func(time(i-1),y(i-1));
   k2 = func(time(i-1)+beta*delta_t , y(i-1) + beta  * delta_t *k1);
   k3 = func(time(i-1)+gamma*delta_t, y(i-1) + gamma * delta_t *k2);
   y(i)=y(i-1)+k3*delta_t;
end