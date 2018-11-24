function time = SecondsToMinColonSec(seconds)
%Jake Kroner
%5/7/18
%function time = SecondsToMinColonSec(seconds)

%Parameters: seconds: an int representing the total number of seconds
%Returns: time: a string that represents a time in the following
%                  format: (min:sec)
%Does the reverse of the function MinColonSecToSeconds

%This function converts a double that represents the total number of
%seconds into a string representing the minutes and seconds in the
%following format: (min:sec)
%Does the reverse of MinColonSecToSeconds

seconds = round(seconds);

min = floor(seconds/60);
sec = rem(seconds, 60);

minString = num2str(min);
secString = num2str(sec);

%If the number of seconds in (min:sec) is below ten (such as 04), then the
%0 wont show up because the integer value would just be 4 (not 04).
%This adds the zero back to the string if that is the case.
if sec < 10
    secString = sprintf('0%s', secString);
end

time = sprintf("%s:%s", minString, secString');

return