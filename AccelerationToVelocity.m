function velocity = AccelerationToVelocity(time, acceleration)
%Jake Kroner
%5/6/18
%function velocity = AccelerationToVelocity(time, acceleration)

%Takes in time vector (in sec) representing all the times where the
%acceleration was recorded; size is 1 x number of time samples
%Takes in acceleration vector (in m/sec^2) representing the acceleration
%at each corresponding position in time vector; size is
%1 x number of time samples
%Returns a velocity vector (in m/sec) representing the velocity
%at each corresponding position in time vector; size is
%1 x number of time samples

%Makes sure time vector and acceleration vector have the same length
%Also makes sure that each vector is not empty
%If either condition is not true, set velocity to NaN and return
if length(time) ~= length(acceleration) || length(time) < 2 || ...
    length(acceleration) < 2
    velocity = NaN;
    return;
end

%Make sure data starts out at time 0
if time(1) ~= 0
    time = [0, time];
    acceleration = [0, acceleration];
end

%Preallocate velocity vector
velocity = zeros(1, length(acceleration));

%Integration Below...
%deltaTime represents change in time between recorded data points
%trapArea represents the approximate area under the acceleration graph
%         between these two time intervals (representing change
%         in velocity)
%deltaVelocityFromStart represents the total change in velocity from the
%         velocity at the starting position at a certain time, which gets
%         stored in the velocity vector at the corresponding position

deltaVelocityFromStart = 0;
velocity(1) = 0; %Starting velocity is zero

%Integration from second acceleration point to last acceleration point
for i = 2:length(time)
    deltaTime = time(i) - time(i-1);
    trapArea = ((acceleration(i) + acceleration(i-1))/2) * deltaTime;
    deltaVelocityFromStart = deltaVelocityFromStart + trapArea;
    velocity(i) = deltaVelocityFromStart;
end

return;