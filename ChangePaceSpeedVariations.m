function pace = ChangePaceSpeedVariations(avgPace, pace, numTimeIntervals, ...
    startSlow, startFast, endSlow, endFast)


%Variations at START of run
%If the user indicates that they will start slow or start fast, decrease or
%increase the pace for the first 5/24 of the run

%speedAdjustment starts at some value above or below 1, but throughout the
%fifth 24th of the run (after the first sixth of the run), it will increase
%or decrease by 0.02 each time (respectively) that it runs through the
%loop. By the time it reaches the sixth 24th of the run, speedAdjustment
%will be exactly 1.
if startSlow
    speedAdjustment = 1 - 0.02*(double(numTimeIntervals)/24 + 2);
    if speedAdjustment < 2/3
        speedAdjustment = 2/3; %2/3 is the lowest it can go
    end
else
    speedAdjustment = 1 + 0.02*(double(numTimeIntervals)/24 + 2);
    if speedAdjustment > 3/2
        speedAdjustment = 3/2; %3/2 is the highest it can go
    end
end

if(startSlow || startFast)
    %For the first sixth of the run, start at this new pace
    for i = 1 : numTimeIntervals/6 - 1
        if startSlow
            pace(i) = speedAdjustment*pace(i); %Use new slower pace
        else
            pace(i) = speedAdjustment*pace(i); %Use new slower pace
        end
    end
    
    %For the fifth 24th of the run,  consistently increase or decrease the
    %pace each time running through the loop, until speedAdjustment is 1.
    %This is the small time interval where the runner is changing his/her
    %pace
    for i = numTimeIntervals/6 : 5*numTimeIntervals/24
        if startSlow
            if speedAdjustment < 3/2 && pace(i) < avgPace
                speedAdjustment = speedAdjustment + 0.02; %Increase pace
            end
            pace(i) = speedAdjustment*pace(i);
        else
            if speedAdjustment > 2/3 && pace(i) > avgPace
                speedAdjustment = speedAdjustment - 0.02; %Decrease pace
            end
            pace(i) = speedAdjustment*pace(i);
        end
    end
end



%Variations at END of run
%If the user indicates that they will end slow or end fast, decrease or
%increase the pace for the last 5/24 of the run

%In this case, speedAdjustment starts at 1 and will increase or decrease
%every throughout the nineteenth 24th of the run, each time it goes through
%the loop
speedAdjustment = double(1.0);

if(endSlow || endFast)
    %For the nineteenth 24th of the run,  consistently increase or
    %decrease the pace each time running through the loop.
    %This is the small time interval where the runner is changing his/her
    %pace.
    for i = numTimeIntervals - 5*numTimeIntervals/24 : numTimeIntervals - numTimeIntervals/6
        if endSlow
            if speedAdjustment > 2/3
                speedAdjustment = speedAdjustment - 0.02; %Decrease Pace
            end
            pace(i) = speedAdjustment*pace(i);
        else
            if speedAdjustment < 3/2
                speedAdjustment = speedAdjustment + 0.02; %Increase pace
            end
            pace(i) = speedAdjustment*pace(i);
        end
    end
    
    %For the final sixth of the run, continue to run at this new pace
    for i = numTimeIntervals - numTimeIntervals/6 + 1 : numTimeIntervals
        if endSlow
            pace(i) = speedAdjustment*pace(i); %Stay at new pace
        else
            pace(i) = speedAdjustment*pace(i); %Stay at new pace
        end
    end
end

return