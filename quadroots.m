%% quadroots
% The purpose of this code is to find the number of roots, and the roots
% of, a qudratic equation (ax^2 + bx +c) using the quadratic discriminant value:
% D=(b^2)-(4*a*c).
% Written by: Landon Ford
% Date: 5 November, 2018

clc
clear

prompt1 = 'Assign value a = ';
prompt2 = 'Assign value b = ';
prompt3 = 'Assign value c = ';
disp('In the equation ax^2 + bx +c:');

a = input(prompt1);
b = input(prompt2);
c = input(prompt3);

r1 = ((-b) - sqrt((b^2)-(4*a*c)))/(2*a); % Root 1.
r2 = ((-b) + sqrt((b^2)-(4*a*c)))/(2*a); % Root 2.
r3 = (-b)/(2*a); % Root if D = 0.

for D = (b^2) - (4*a*c);
    if D > 0;
        disp('The equation has two roots.');
        fprintf('The roots are %.2f and %.2f\n',r1,r2);
    elseif D == 0;
        disp('The equation has one root.');
        fprintf('The root is %.2f\n',r3);
    else D < 0;
        disp('The equation has no roots');
    end
end

% If the discriminant value is positive, it means the equation ax^2+bx+c
% has two roots. If the discriminant value is 0, the equation has one root.
% If the discriminant value is negative, the equation has no roots.