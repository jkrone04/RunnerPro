function [distance, time, avgPace, breakTimes, breakLengths, ...
    startSlow, startFast, endSlow, endFast] = GetRunningInfo()
%Jake Kroner
%5/7/18
%function [distance, time, pace, numBreaks, breakTimes, breakLengths, ...
%    startSlow, startFast, endSlow, endFast, constPace] = GetRunningInfo()
%Parameters: None
%Returns: distance: the expected distance of the run (miles)
%         time: the expected time of the run (seconds)
%         pace: the expected pace of the run (min:sec per mile)
%         breakTimes: vector of expected times that these breaks will be
%                     taken at during run (length 1xnumBreaks)
%         breakLengths: vector of expected lengths that each break will
%                     last for (length 1xnumBreaks)
%         startSlow: boolean representing whether or not the user will
%                    start their run slowly and increase their speed later
%         startFast: boolean representing whether or not the user will
%                    start their run faster and decrease their speed later
%         endSlow: boolean representing whether or not the user will
%                    slow down towards the end of their run
%         endFast: boolean representing whether or not the user will
%                    speed up towards the end of their run
%         endSlow: boolean representing whether or not the user will
%                    keep a constant pace throughout their run

%This function uses a series of GUI prompts and conditionals to gather the
%above information about the user's run.


%% Pace, Distance, and Time

%Find out if user knows what pace they want to keep
prompt1 = {'Do you know what pace you want to keep during your run?'};
title1 = 'Pace';
defaultAnswer1 = {'Yes'};
answer = inputdlg(prompt1, title1, [1 40], defaultAnswer1);
knowsPace = (answer{1} == "Yes");

%If user has an expected pace, find out the pace and the distance of
%the run
if knowsPace
    prompt2 = {'What average pace do you want to keep? This is the average pace you expect to run when you are not taking a break. (min:sec per mile)', ...
        'How far do you want to run? (miles)'};
    title2 = 'Pace and Mileage';
    defaultAnswer2 = {'9:26', '3.11'};
    answer2 = inputdlg(prompt2, title2, [1 40], defaultAnswer2);
    avgPace = MinColonSecToSeconds(answer2{1});
    distance = str2double(answer2{2});

%If they don't have an expected pace, find out the distance of their run
%and a desired level of intensity. Call FindPace, using the intensity
%value, to calculate an expected pace
else
    prompt2 = {'How far do you want to run? (miles)', ...
        'On a scale of 1 to 10, how intense do you want your run to be? (Intensity'};
     title2 = 'Distance and Intensity)';
    defaultAnswer2 = {'3.11', '7'};
    answer2 = inputdlg(prompt2, title2, [1 40], defaultAnswer2);
    distance = str2double(answer2{1});
    intensity = str2double(answer2{2});
    avgPace = MinColonSecToSeconds(IntensityConversion(intensity));
end

%Calculate time of run (in seconds) by multiplying the pace (in seconds) by
%the mileage
time = round(distance * avgPace);

%avgPace is currently in seconds per mile. Convert it to miles per hour
avgPace = 1/double(avgPace)*60*60;


%% Breaks

%Find out the number of breaks the user wants to take during the run, and
%store this in numBreaks
prompt4 = {'How many breaks do you want to take during the run?'};
title4 = 'Breaks';
defaultAnswer4 = {'3'};
answer4 = inputdlg(prompt4, title4, [1 40], defaultAnswer4);
numBreaks = str2double(answer4{1});

%Preallocate breakTimes and breakLengths
breakTimes = [];
breakLengths = [];

%If at least 1 break is expected, find out the break times and the break
%lengths and store them in breakTimes and breakLengths
if numBreaks ~= 0
    prompt5 = {'At what times during the run? (min:sec)', ...
          'About how long do you expect break for at these times, respectively? (sec)'};
    title5 = 'Break Info';
    defaultAnswer5 = {'7:00, 10:06, 13:45', '20, 25, 40'};
    answer5 = inputdlg(prompt5, title5, [1 40], defaultAnswer5);
    
    %Break the strings of times and lengths of the breaks into substrings,
    %and store each substring into the corresponding position in breakTimes
    %and breakLengths
    answer5{1} = [' ', answer5{1}, ',']; %Adds space at front and comma at
    answer5{2} = [' ', answer5{2}, ',']; %end so they can be extracted below
    breakTimes = extractBetween(answer5{1}, ' ', ',');
    breakLengths = extractBetween(answer5{2}, ' ', ',');
end


%% Speed Variations

%Find out whether or not the user starts out their run faster or slower,
%ends their run faster or slower, or keeps a constant pace. Store these
%values in the appropriate boolean variables
prompt6 = {'Do you expect to... start out slower and increase your pace?', ...
    '...start out faster and decrease your pace?', ...
    '...slow down towards the end?', '...speed up towards the end?'};
title6 = 'Pace Variations';
defaultAnswer6 = {'Yes', 'No', 'No', 'Yes'};
answer6 = inputdlg(prompt6, title6, [1 40], defaultAnswer6);
startSlow = (answer6{1} == "Yes");
startFast = (answer6{2} == "Yes");
endSlow = (answer6{3} == "Yes");
endFast = (answer6{4} == "Yes");
%%

return