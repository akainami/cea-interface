figure;

% Remove NaNs
of_arr = of_arr(~isnan(Isp));
Cstar = Cstar(~isnan(Isp));
Ivac = Ivac(~isnan(Isp));
Isp = Isp(~isnan(Isp));

subplot(1,3,1);
hold on;
plot(of_arr,Cstar,'sk');
plot(of_arr,Cstar,'k');
hold off;
title('Characteristic Velocity, C* [m/s]');
xlabel('Oxidizer/Fuel Ratio');
ylabel('C*');

subplot(1,3,2);
hold on;
plot(of_arr,Isp,'sk');
plot(of_arr,Isp,'k');
hold off;
title('Specific Impulse, I_s_p at Sea Level [s]');
xlabel('Oxidizer/Fuel Ratio');
ylabel('I_s_p');

subplot(1,3,3);
hold on;
plot(of_arr,Ivac,'sk');
plot(of_arr,Ivac,'k');
hold off;
title('Specific Impulse, I_s_p at Vacuum [s]');
xlabel('Oxidizer/Fuel Ratio');
ylabel('I_s_p');