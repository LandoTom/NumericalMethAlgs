%% FALSE POSITION ALGORITHM
% This algorithm estimates the root of a function using the false postion
% technique.
format long
%%

function fposition(func,x_l,x_u,es,maxiter);
% INPUTS -->
% func = function being evaluated
% x_l = the lower guess
% x_u = the upper guess
% es = the desired relative error (Default is 0.0001%)
% maxiter = the number of iterations desired (Default is 200)
% OUTPUTS -->
% root = the estimated root location
% fx = the function evaluated at the root location
% ea = the approximate relative error (%)
% iter = the number of iteration performed

% TESTS -->
if nargin < 3, error('need more inputs'), end % enough inputs
test = func(x_l) * func(x_u);
if test > 0, error('both guesses are the same sign'), end % sign difference
if nargin < 4 || isempty(es) == 1, es = 0.0001; end % for es value and default
if nargin < 5 || isempty(maxiter) == 1, maxiter = 200; end % for maxiter value and default
if maxiter <= 0, error('need a positive value for iterations'), end % for positive value in maxiter
if es > 100 || es <= 0, error('percent value is too low or too high'), end % for es value less than 100 and more than 0.

root=0; fx=0; ea=101; iter=1; xr=0; prev_xr = 0; % defining values

% Loop that runs until the percent is below a value or iterations are above
% a value.
while ea > es && iter < maxiter;
    prev_xr = xr;
    xr = x_u - ((func(x_u)*(x_l-x_u))/(func(x_l)-func(x_u)));
    ea = abs((prev_xr - xr)/prev_xr) * 100;
    if (func(xr) * func(x_l)) > 0, x_l = xr; end
    if (func(xr) * func(x_u)) > 0, x_u = xr; end
    root = xr; fx = func(xr); iter = iter + 1;
end

% displaying values of variables
root
fx
iter
ea
end