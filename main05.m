%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Sahebeh Dadboud: 
% Explicit Euler methods and plotting the results
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%% Explicit Euler methods
y1(1) = 0.6; 
y2(1) = 0.3;             % Initial Condition
h1 = 0.002;              % step size              
t = 0:h1:20;             % t goes from 0 to 20    
 

ystar1(1) = y1(1);
ystar2(1)=  y2(1);        % Initial condition 
for i=1:(length(t)-1)

    %y1'(t) = (1-y2(t))*y1(t)
    f1 = (1-ystar2(i))*ystar1(i);
    ystar1(i+1) = ystar1(i) + f1*h1;
    %y2'(t) = (y1(t) - 1)*y2(t)
    f2 = (ystar1(i) -1)*ystar2(i);
    ystar2(i+1) = ystar2(i) + f2*h1; 
end
figure(1);
plot(t,ystar1,t,ystar2);
legend('y1','y2');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Improved Euler methods
y1_2(1) = 0.6; 
y2_2(1) = 0.3;             % Initial Condition
h2 = 0.02;                 % step size              
t = 0:h2:20;               % t goes from 0 to 20    
 

ystar1_2(1) = y1_2(1);
ystar2_2(1)=  y2_2(1);        % Initial condition 

for i=1:(length(t)-1)

   %y1'(t) = (1-y2(t))*y1(t)
    k1 = (1-ystar2_2(i))*ystar1_2(i);   %k1 = f(y1,y2)
    k2 = (1-ystar2_2(i) + h2*k1)*(ystar1_2(i)+h2); %k2 =f(y1+h,y2+h*k1) %h2??
    k_1 = (k1+k2)/2;
    ystar1_2(i+1) = ystar1_2(i) + h2*k_1; %
    %y2'(t) = (y1(t) - 1)*y2(t)
    k3 = (ystar1_2(i) -1)*ystar2_2(i);    %k3 = f(y1,y2)
    k4 = (ystar1_2(i)+h2 -1)*(ystar2_2(i)+(h2*k3)); %k4 =f(y1+h,y2+h*k3) %%h2??
    k_2 = (k3+k4)/2;
    ystar2_2(i+1) = ystar2_2(i) + h2*k_2;
  
end
figure(2);
plot(t,ystar1_2,t,ystar2_2);
legend('y1_1','y2_2');
