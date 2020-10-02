function [logical] = CheckTaken_EC(columns,rows,matrix)
%% Title Block
% J.Cohen
% Lab 3 Homework Part 1 - CheckTaken_EC
% 2019-10-03
% CheckTaken_EC
%   This function checks to see if the position the user wants to use is
%   occupied by anything except a NaN value(free space). If it isn't a free
%   space the function returns a false output.
logical = isnan(matrix(ceil(rows),ceil(columns)));% checks to see if there is a NaN value in the location the user guessed
end

