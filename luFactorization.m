%% luFactor
% This algorithm finds the LU factorization of a square matrix and uses
% pivoting if necessary.
% The first function is a function I created to sort the matrices, the
% function 'luFactor' uses it. It allowed me to only write the code once.


%% Function used to pivot rows in luFactor.
function [Matrix,Lm]=lusort(Atot,L);
sizemat=size(Atot);
atemp1 = [];
% Loop that compares the first value of each row and stores the row with
% the lowest first value, using that to sort them from largest to smallest
% top to bottom.
row1 = sizemat(1);
columns1 = sizemat(2);
loopend1=row1;
while loopend1 > 1;
    for  rownum1 = 1:loopend1-1;
        if abs(Atot(rownum1,1)) < abs(Atot(rownum1+1,1));
            atemp1 = Atot(rownum1,:);
            Atot(rownum1,:) = Atot(rownum1+1,:);
            Atot(rownum1+1,:) = atemp1;
            e = isempty(L);
            if e == 0;
                Ltemp=L(rownum1,1);
                L(rownum1,1) = L(rownum1+1,1);
                L(rownum1+1,1) = Ltemp;
            end
        end
    end
    loopend1=loopend1-1;
end
Matrix = Atot;
Lm = L;
end
%% luFactor function -->
function  luFactor(A);
% Outputs -->
% L - Lower triangular matrix
% U - Upper triangular matrix
% P - Pivot matrix
% Input -->
% A - Coefficient matrix
%  Explaination -->
% This algorithm uses pivoting to find the proper matrix and then finds L
% and U while also pivoting the right values.

y = size(A);
if y(1,1) ~= y(1,2), error('Need a square matrix'), end;
n = y(1,1);
% Defining variables -->
L=eye(n);U=zeros(n);Pident=eye(n);Atot=[A Pident];sizemat=size(Atot);

% Finding LU -->
% This uses the lusort function created above to pivot A and do the same
% pivoting to L.
for timesthrough = 1:sizemat(1);
    if timesthrough == 1;
        [Atot(timesthrough:sizemat(1),timesthrough:sizemat(2)),r] =lusort(Atot(timesthrough:sizemat(1),timesthrough:sizemat(2)),[]);
    else
        [Atot(timesthrough:sizemat(1),timesthrough:sizemat(2)),L(timesthrough:sizemat(1),timesthrough-1)]=lusort(Atot(timesthrough:sizemat(1),timesthrough:sizemat(2)),L(timesthrough:sizemat(1),timesthrough-1));
    end
    for row = timesthrough:sizemat(1)-1;
        ratio = Atot(row+1,timesthrough)/Atot(timesthrough,timesthrough);
        L(row+1,timesthrough) = ratio;
        ratiomult = ratio.*Atot(timesthrough,1:sizemat(1));
        halfrowval = Atot(row+1,1:sizemat(1))-ratiomult;
        Atot(row+1,1:sizemat(1)) = halfrowval;
    end
end
U = Atot(:,1:sizemat(1))
P = Atot(:,sizemat(1)+1:sizemat(2))
L 
end