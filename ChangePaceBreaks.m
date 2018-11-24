function pace = ChangePaceBreaks(pace, numTimeIntervals, breakTimes, ...
    breakLengths)

for i = 1:length(breakTimes) %Runs numBreaks times
    
    %Run over the time interval indicated by breakTimes and breakLength
    %for each break
    %If the break time is 1:30, and the break length is 30 seconds, this
    %loop would run from 9 to 12 (since that is the time interval from 90
    %seconds to 120 seconds)
    %Divides by 10 to get the time interval instead of the number of
    %seconds
    startPos = round(MinColonSecToSeconds(breakTimes{i})/10);
    endPos = round(startPos + str2double(breakLengths{i})/10);
    
    %Set the pace during the break to walking speed
    for j = startPos:1:endPos
        if j >= 1 && j <= numTimeIntervals %Checks to make just j is within bounds
            pace(j) = 3.1; %This is the pace of walking speed
        end
    end
end

return