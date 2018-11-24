%%Main Script: Collect Expected Run Data, Calculate Time and Expected
%Pace Vectors, Plot Expected Run Data, Collect Actual Run Data, and
%Plot Actual Run Data.
%Jake Kroner
%May 11th, 2018

%% Part 1: Collect Expected Run Data
[distance, timeOfRun, avgPace, breakTimes, breakLengths, startSlow, ...
    startFast, endSlow, endFast] = GetRunningInfo();


%% Part 2: Calculate Time and Expected Pace Vectors
numTimeIntervals = round(timeOfRun / 10) + 1;

timeVector = GetTimes(timeOfRun, numTimeIntervals);

expectedPace = CalculateTruePace(avgPace, numTimeIntervals, breakTimes, ...
    breakLengths, startSlow, startFast, endSlow, endFast);


%% Part 3: Plot Expected Run Data
PlotExpectedRun(timeVector, expectedPace, distance);


%% Part 4: Collect Actual Run Data
%In this part, the user needs to set up Matlab Mobile on their iPhone or
%Android. Then they must connect to the computer's IP address using the
%password below.

%Sets up connection to iPhone or Android using "runningassistant" as the
%password
connector on runningassistant;

%Uses mobiledev to create an object that represents the phone
phone = mobiledev;

%Enables the acceleration sensor
phone.PositionSensorEnabled = 1;

%Pause for the amount of time of the run in seconds, and during this time,
%log the data using the acceleration sensor
%phone.Logging = true;
pause(timeOfRun);

%After the run is over, stop logging the data
phone.Logging = false;

%Store the logged data into an acceleration vector and a time vector (each
%position is corresponding)
[~, ~, time, speed, ~, ~, ~] = poslog(phone);

%Disables acceleration sensors and clears the phone object
phone.PositionSensorEnabled = 0;

clear phone;

connector off;


%% Part 5: Plot Actual Run Data
%hold on
PlotVelocityData(timeVector, actualPace);
title(sprintf("Running Speed Throughout %0.2f mile Run\nExpected Average Pace (taking breaks into account): %s per mile\nActual Average pace (taking breaks into account): %s", ... 
    distance, SecondsToMinColonSec(round(mean(1./expectedPace.*60.*60))), SecondsToMinColonSec(round(mean(1./actualPace.*60.*60)))));
xlabel("Time From Start (min:sec)");
ylabel("Pace (miles per hour)");

%File Commands
fid = fopen('Running Speed.txt', 'wt');
fprintf('Expected Average Running Speed is: %s\nActual Average Running Speed is: %s', ...
    SecondsToMinColonSec(round(mean(1./expectedPace.*60.*60))), SecondsToMinColonSec(round(mean(1./actualPace.*60.*60))));
fclose(fid);