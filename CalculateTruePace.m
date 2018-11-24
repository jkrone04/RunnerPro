function pace = CalculateTruePace(avgPace, numTimeIntervals, ...
    breakTimes, breakLengths, startSlow, startFast, endSlow, endFast)
% Create True Pace Vector

%Preallocate pace vector by setting each position to the average pace
pace = zeros(1, numTimeIntervals);
for i = 1:length(pace)
    pace(i) = avgPace;
end

%Change Portions of Pace Vector Based On Speed Variations
pace = ChangePaceSpeedVariations(avgPace, pace, numTimeIntervals, ...
    startSlow, startFast, endSlow, endFast);

%Change Portions of Pace Vector Based On Breaks
pace = ChangePaceBreaks(pace, numTimeIntervals, breakTimes, breakLengths);

%Change Portions of Pace Vector Based on Realistic Random Variations
pace = ChangePaceRandomnessVariation(pace);

return