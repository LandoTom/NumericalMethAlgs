%% Finding the number of elapsed days in a year at a certain date:
% This function accepts three inputs: the month in the date, the day of the
% month, and if it is a leap year or not, in that order. It wil tell you
% how many days have passed in the current year. If it is a leap year, use
% 1 as the input, if it is not, use 0 as the input.

%%
clc
clear

days(10,30,0)

function nd = days(mo, da, leap)
nd = 0;
p = [];
% This IF statement establishes daymo as an array length-12 with the total
% amount of days in each month. It will output and ERROR if the leap input
% is not 1 or 0.
if leap == false;
    daymo = [31 28 31 30 31 30 31 31 30 31 30 31];
elseif leap == true;
    daymo = [31 29 31 30 31 30 31 31 30 31 30 31];
else 
    error('Invalid Leap Year Input.')
end
% The following code calculates how many months have passed and how many
% days have passes, not including the days in the current month. The IF
% statement outputs an error if the month or day inputs are not valid
% (valid IS mo = 1-12 and da = 1-31). 
if mo >= 1 && mo <= 12 && da >= 1 && da <= 31
for i = 1:(mo-1);
    p(i) = daymo(i);
end
else
    error('Invalid Month or Day Input')
end
% nd is the sum of all the passed months and days in the current month
% (not including the current date). 
nd = sum(p) + (da-1);
end