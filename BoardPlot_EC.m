function [object,matrix] = BoardPlot_EC(object,matrix,row,column,player)
% J.Cohen
% Lab 3 Homework Part 1 - BoardPlot_EC
% 2019-10-01
% BoardPlot_EC
%   This function does two things. If there are no inputs it draws a
%   and displays a blank gamboard. If there are displaysfunction will draw
%   an X or O on the game board and update the logic matrix to match it.
if nargin == 0% checks to see if the function is being called without any inputs
    object = gca;% creates the plot object
    object.XLim = ([0,3]);% limits the plot to 3 wide
    object.YLim = ([0,3]);% limits the plot to 3 high
    hold on
    object = line([1,1],[0,3]);% creates grid lines
    object.Color = [0,0,0];% changes the color to black
    object = line([2,2],[0,3]);% creates grid lines
    object.Color = [0,0,0];% changes the color to black
    object = line([0,3],[1,1]);% creates grid lines
    object.Color = [0,0,0];% changes the color to black
    object = line([0,3],[2,2]);% creates grid lines
    object.Color = [0,0,0];% changes the color to black
elseif CheckWin_EC(matrix,player) ~= 0% if a win occurs....
    [~,object] = CheckWin_EC(matrix,player);%... update the board with the winning line
else
    if player == 1% checks to see which player
        object = line((ceil(row))-0.5,(ceil(column))-0.5);% adds a point at the cordinates the player clicked
        object.MarkerSize  = 75;% increases marker size
        object.Marker = 'x';% changes marker to an x
        object.LineWidth = 3;% increase the line width
        object.Color = [0,0,0];% changes marker color to black
        matrix(ceil(column),ceil(row)) = 1;% saves the matrix position the player choose
    elseif player == 2% checks to see which player
        object = line((ceil(row))-0.5,(ceil(column))-0.5);% adds a point at the cordinates the player clicked
        object.MarkerSize  = 75;% increases marker size
        object.Marker = 'o';% changes marker to an o
        object.LineWidth = 3;% increase the line width
        object.Color = [1,0,0];% changes marker color to black
        matrix(ceil(column),ceil(row)) = 0;% saves the matrix position the player choose
    end
end
end