%% Mech 103 User Defined Function: Prime Numbers 
% Written by Landon Ford:
% This code finds the prime numbers between two numbers: [m] and [n].
clc
clear

%% Function Arguments
prime(12,80)
prime(100,200)
prime(21,63.5)

%% The Function
function [pr] = prime (m , n);

pr = [];

if m > n;
        error('The value of n must be larger than m.');
       
elseif  m < 0 | n < 0;
        error('The input argument must be a positive integer');
else
    for a = m : n;
        pryesno = true;
        for  b = 2 : (a-1);
            remainder = rem(a,b);
            if remainder == 0;
                pryesno = false;
            end
        end
        if pryesno == true;
            pr = [pr, a];
        end
    end
end
end