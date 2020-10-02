function [int,object] = CheckWin_EC(matrix,player)
% J.Cohen
% Lab 3 Homework Part 1 - CheckWin
% 2019-10-01
% CheckWin
%   This function checks to see if either player has won a game by using
%   logic to find columns with matching markers in them. When a match is
%   found the function draws a line through those matches
cross_one = [1,0,0;0,1,0;0,0,1];% create a win scinerio for specialty situations
cross_two = [0,0,1;0,1,0;1,0,0];% create a win scinerio for specialty situations
object = [];
if player == 1% determine which player we are checking
    matrix(isnan(matrix))=0;% replace NaN values with falses
    if all(matrix.*cross_one == cross_one)% check to see if the board matches special case 1
        int = 1;% if so output is true
        hold on
        object = line([0,3],[0,3]);
        object.Color = [0,0,0];
        object.LineWidth = 3;
    elseif all(matrix.*cross_two == cross_two)% check to see if the board matches special case 2
        int = 1;% if so output is true
        hold on
        object = line([0,3],[3,0]);
        object.Color = [0,0,0];
        object.LineWidth = 3;
    elseif any(all(matrix)) == 1% check to see if there is a vertical line match
        int = 1;% if so output is true
        hold on
        x = find(double(all(matrix)))-.5;
        object = line([x,x],[0,3]);
        object.Color = [0,0,0];
        object.LineWidth = 3;
    elseif any(all(matrix')) == 1% check to see if there is a horizontal line match
        int = 1;% if so output is true
        hold on
        y = find(double(all(matrix')))-.5;
        object = line([0,3],[y,y]);
        object.Color = [0,0,0];
        object.LineWidth = 3;
    else
        int = 0;% otherwise output is false
    end
elseif player == 2% determine which player we are checking
    matrix(isnan(matrix))=1;% replace all NaN values with trues
    matrix = ~matrix;% inverse the logical of the matrix
    if all(matrix.*cross_one == cross_one)% check to see if the board matches special case 1
        int = 2;% if so output is true
        hold on
        object = line([0,3],[0,3]);
        object.Color = [1,0,0];
        object.LineWidth = 3;
    elseif all(matrix.*cross_two == cross_two)% check to see if the board matches special case 2
        int = 2;% if so output is true
        hold on
        object = line([0,3],[3,0]);
        object.Color = [1,0,0];
        object.LineWidth = 3;
    elseif any(all(matrix)) == 1% check to see if there is a vertical line match
        int = 2;% if so output is true
        hold on
        x = find(double(all(matrix)))-.5;
        object = line([x,x],[0,3]);
        object.Color = [1,0,0];
        object.LineWidth = 3;
    elseif any(all(matrix')) == 1% check to see if there is a horizontal line match
        int = 2;% if so output is true
        hold on
        y = find(double(all(matrix')))-.5;
        object = line([0,3],[y,y]);
        object.Color = [1,0,0];
        object.LineWidth = 3;
    else
        int = 0;% otherwise output is false
    end
end
    
end