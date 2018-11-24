function [] = PlotExpectedRun(times, pace, distance)
%Jake Kroner
%5/7/18
%function [] = PlotExpectedRun(times, pace, distance)

%Parameters: times: A vector of times from the start of the run (min:sec)
%            pace: A vector of the runner's pace at each corresponding time
%            Both times and pace are of the same length
%Returns: None

%This function plots the expected graph of the runner's expected speed
%throughout the run, as time from start vs pace.
plot(times, pace);
xlabel("Time From Start (min:sec)");
ylabel("Pace (miles per hour)");
title(sprintf("Expected Running Speed Throughout %0.2f mile Run\nExpected Average Pace (taking breaks into account): %s per mile", ...
    distance, SecondsToMinColonSec(round(mean(1./pace.*60.*60)))));

%Axis Limits
xlim([0 max(times)]);
ylim([0 max(pace)+1]);

%Axis Labels
timeTicks = linspace(0, max(times), 10);
for i = 1:length(timeTicks)
    timeTicks(i) = round(timeTicks(i), 1);
end
xticks(timeTicks);

timeLabelsInMinColonSec = strings(length(times));
for i = 1:length(timeTicks)
    timeLabelsInMinColonSec(i) = SecondsToMinColonSec(timeTicks(i));
end
xticklabels(timeLabelsInMinColonSec);

return