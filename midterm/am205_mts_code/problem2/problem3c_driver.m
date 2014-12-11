%script for problem 3

%set t0, tend, delta_t
t0=0; tend=2; y0=0;

delta_t_vec=10.^[-4:0.5:-1];
f_error = zeros(1,length(delta_t));

for i=1:length(delta_t_vec)
    delta_t = delta_t_vec(i);
    
    %3a) analytical solution
    f_analytical = @(t) exp(t)-t-1;
    df = @(t,y) t + y;

    %solve
    ya_comp = runge_kutta_three(df,delta_t,t0,tend,y0);
    ya_true = f_analytical(t0:delta_t:tend);
    
    
%     close all
%     figure(2)
%     hold on
%     plot(t0:delta_t:tend,ya_comp,'r-')
%     plot(t0:delta_t:tend,ya_true,'b-') 
%     pause
    
    %compare error
    f_error(i)= max(abs(ya_comp-ya_true));
    
    %3b) analytical solution
    g_analytical = @(t) 0.5 * (t-sin(t).*cos(t));
    dg = @(t,y) sin(t).^2 + 0*y;
    
    %solve
    yb_comp = runge_kutta_three(dg,delta_t,t0,tend,y0);
    yb_true = g_analytical(t0:delta_t:tend);
    g_error(i)= max(abs(yb_comp-yb_true));
    
%     close all
%     figure(2)
%     hold on
%     plot(t0:delta_t:tend,yb_comp,'r-')
%     plot(t0:delta_t:tend,yb_true,'b-') 
%     pause
end



%display solution
close all
figure(1)
hold on

subplot(1,2,1)
loglog(delta_t_vec,f_error,'ro-')
hold on
xlabel('delta t')
ylabel('error_\infty')
title('first integral')

subplot(1,2,2)
loglog(delta_t_vec,g_error,'ro-')
hold on
xlabel('delta t')
ylabel('error_\infty')
title('second integral')

