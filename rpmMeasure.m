%% Constants

C = [486 ;638];
fps = 500;
n=26;
slno = [1:(n-2)];
p = 1.625;

%% Initializing x-coordinate vector, y-coordinate vector, theta vector and omega vector

x = [736;703;660;601;537;467;398;338;287;248;227;223;235;264;307;361;426;496;565;625;681;722;751;755;744;720];
y = [541;482;435;396;377;373;385;418;465;519;584;648;718;781;829;874;894;902;892;868;820;769;705;636;568;504];
theta=zeros((n-1),1);
omega= zeros((n-2),1);

%% Computation of theta vector 

for i =1:(n-1)
    theta(i)=(180/pi)*(atan((y(i)-C(2))/(x(i)-C(1))));
    disp(['The value of angle in degrees is : ', num2str(theta(i))])
end

%% Computation of omega vector

for i = 1:(n-2)
     if (theta(i) > theta(i+1))
        omega(i)=abs((60/(2*pi))*(((pi/180)*(theta(i+1)-theta(i)))/(1/fps)));
    else 
        omega(i)=p*(abs((60/(2*pi))*(((pi/180)*(theta(i+1)+theta(i)))/(1/fps))));
    end

    disp(['The value of speed in rpm is : ',num2str(omega(i))]);
end

%% Plot of omega vs slno and theta vs slno

plot(slno,omega,'--r');
xlabel('slno');
ylabel('Speed in rpm, Theta in degrees');
title('Graphs for speed and angle');
hold on
slno=[1:(n-1)];
plot(slno,theta,'-b');
legend('Speed','Angle');
shg

%% Display results

disp(theta)
disp(omega)

%% Calculation of average speed

avgSpeed = sum(omega)/(n-2);

