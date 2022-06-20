%% Constants

C = [486 ;638];
fps = 500;
n=28;
p=1.15;
slno = [1:(n-2)];

%% Initializing x-coordinate vector, y-coordinate vector, theta vector and omega vector

x = [277;246;225;223;238;264;303;357;416;480;545;605;660;701;736;751;753;736;707;662;607;547;482;416;359;307;264;238];
y = [474;533;593;658;720;779;831;865;896;904;896;876;841;794;736;673;607;543;484;437;400;381;371;381;406;443;494;552];
theta=zeros((n-1),1);
omega= zeros((n-2),1);

%% Computation of theta vector 

for i =1:(n-1)
    theta(i)= (180/pi)*(atan((y(i)-C(2))/(x(i)-C(1))));
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

