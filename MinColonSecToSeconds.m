function seconds = MinColonSecToSeconds(time)
%Jake Kroner
%5/7/18
%function seconds = MinColonSecToSeconds(time)

%Parameters: time: a string that represents a time in the following
%                  format: (min:sec)
%Returns: seconds: an int representing the total number of seconds
%Does the reverse of the function SecondsToMinColonSec

%This function converts a string representing the minutes and seconds to a
%double that represents the total number of seconds in this time.

%Put spaces before and after time string since the bounds of extractBetween
%function doesn't include bounds
time = ['X', time, 'Y'];

%Extract the minutes and seconds from the original time as character
%vectors
min = extractBetween(time, 'X', ':');
sec = extractBetween(time, ':', 'Y');

%Convert the character vectors to doubles
min = str2double(min);
sec = str2double(sec);
%disp(min);
%Find the total number of seconds by multiplying minutes by 60 and adding
%remaining seconds
seconds = int32(min*60 + sec);

return