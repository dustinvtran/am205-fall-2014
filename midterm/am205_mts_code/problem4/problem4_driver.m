%%script to solve problem 4

%load in data
data=load('efield.txt');
x_eval=data(:,1);
y_eval=data(:,2);
Ex = data(:,3);
Ey = data(:,4);

%initialize position of point charges
i=0:4; 
j=0:4;

x = (2*i-4)/5;
y = (2*i-4)/5;
x = repmat(x',1,5);  x=x(:);
y = repmat(y,5,1);   y=y(:);

%find (x_q-x_ij) and (y_q-y_ij)
x_dist_mat = zeros(length(Ex),length(x));
y_dist_mat = zeros(length(Ey),length(y));
r_dist_mat = y_dist_mat;

%form distance matrix
for q = 1:length(Ex)
    for j = 1:length(x)
       x_dist_mat(q,j)= x_eval(q)-x(j); 
       y_dist_mat(q,j)= y_eval(q)-y(j);
       r_dist_mat_3(q,j)= sqrt(x_dist_mat(q,j)^2 + y_dist_mat(q,j)^2 ).^3;
    end
end

%form collocation_matrix
A = [x_dist_mat./r_dist_mat_3/4/pi; y_dist_mat./r_dist_mat_3/4/pi];
E = [Ex;Ey];
fprintf('the test charges are calculated to be: \n')
Q = A\E

%problem 4b
Q_binary = dec2bin(round(Q));
[nr,nc]=size(Q_binary)

close all
figure(1)

for i=1:nc
    subplot(2,3,i)
    hold on
    title(['digit corresponds to ' num2str(2^(i-1)) ])
    
    temp_vec= Q_binary(:,i);
    for j = 1:nr
       if round(temp_vec(j))==dec2bin(1)
         plot(x(j),y(j),'ro')
       end
    end
end
