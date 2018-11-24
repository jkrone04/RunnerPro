function pace = ChangePaceRandomnessVariation(pace)

%At approximately 65% of the points in the pace vector (chosen randomly),
%increase or decrease the speed by a magnitude between 0.0mph and 0.1mph
%(also chose randomly). This adds a degree of randomness to the pace at
%different points, which makes the pace more realistic by adding variation.

newPace = pace(1); %Start newPace as the first pace in the pace vector
for i = 1:length(pace)
    if rand() < 0.65 %65% chance of this happening
        %Increase or decrease pace up to a magnitude of 0.1mph
        newPace = pace(i) + 0.2*rand() - 0.1;
    end
    
    %Even if the pace didn't change during this run of the loop, still set
    %the pace to the new pace from the last run of the loop
    pace(i) = newPace;
end

return