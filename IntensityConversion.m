function avgPace = IntensityConversion(intensity)
%Jake Kroner
%5/7/18
%function pace = IntensityConversion(intensity)

%Parameters: intensity: an integer from 1 to 10 representing desired
%                       intensity level of run
%Returns:    avgPace: the average pace of the run at the corresponding
%            level of intensity (min:sec)

%Figures out an average pace of the run for any given intensity index from
%1 to 10.

if intensity == 10
    avgPace = '4:45';
elseif intensity == 9
    avgPace = '5:30';
elseif intensity == 8
    avgPace = '6:15';
elseif intensity == 7
    avgPace = '7:00';
elseif intensity == 6
    avgPace = '7:45';
elseif intensity == 5
    avgPace = '8:30';
elseif intensity == 4
    avgPace = '9:15';
elseif intensity == 3
    avgPace = '10:00';
elseif intensity == 2
    avgPace = '11:00';
else
    avgPace = '12:00';
end

return