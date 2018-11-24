function [] = PlotAccelerationData(time, acceleration)

plot(time, acceleration);
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');

return;