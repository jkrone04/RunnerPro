function [] = PlotVelocityData(time, velocity)

plot(time, velocity);
xlabel('Time From Start (min:sec)');
ylabel('Pace (miles per hour)');
title('Running Speed');

return;