function timeVector = GetTimes(totalSeconds, numTimeIntervals)

timeVector = zeros(1, numTimeIntervals);

incrementationVal = totalSeconds/numTimeIntervals;

secondsFromStart = 0;
for i = 1:numTimeIntervals
    timeVector(i) = secondsFromStart;
    secondsFromStart = secondsFromStart + incrementationVal;
end

return