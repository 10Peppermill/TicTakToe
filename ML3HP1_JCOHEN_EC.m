%% Title Block
% J.Cohen
% Lab 3 Homework Part 1
% 2019-10-01 - script started, focused on reaching a point where the game
%              could be played by two players
% 2019-10-03 - script updated, enable randomization of player that goes
%              first. Add welcome message and rules. added logic to detect
%              draw. Allow user to restart if they choose to. added
%              functionality to determine if a spot is already taken.
% Tic-Tac-Toe
%   This program starts a game of tic-tac-toe that allows to playes to
%   compete aginst eachother.
clear
clf
clc


%% 1. Start the game with a greeting to the players
fprintf('Hello, welcome to Tic-Tac-Toe.\n');% having some fun with for loops in the UI to create a load indicator
for ii = (1:4)% iterates load indicator 4 times(4 seconds)
    for i = (1:3)% sub-iteration of the load indicator
        fprintf('.');% print a single period
        pause(1/3);% pause for 1/3 seconds
    end
    fprintf(repmat('\b', 1, 3));% bckspaces the last three locations on the line
end
fprintf('\n')

%% 2. Explain the rules (Make sure you give them enough time)
string = ('This script will allow two players to compete against each-other in a traditional game of tic-tac-toe. Players will pick X or O and the script will randomly decide which will go first. Three symbols in a row horizontally, Vertical, or Diagonally will result in a win');
string_Length = (length(string));% length of string to be displayed
max_Length = 75;% max length a string can be to will up command window when printed
back = [0,0,0];% number of charachters back from a ' ' charachter before the 75th charachter
for ii = (1:floor(string_Length/max_Length))% iterate through the string to determine back values every 75 charachter spaces
    back(ii) = 0;
    while string((ii*(max_Length))-back(ii)) ~= ' '
        back(ii) = back(ii)+1;
    end
    back(ii) = back(ii);
end

for ii = (1:ceil(string_Length/max_Length))% itterate through the string to display the string to fit perfectly to the command window
    if ii == 1
        fprintf(string(ii:ii*75-back(ii)));
    elseif ii == ceil(string_Length/max_Length)
        fprintf(string((ii-1)*75-back(ii-1)+1:end));
    else
        fprintf(string((ii-1)*75-back(ii-1)+1:ii*75-back(ii)));
    end
    fprintf('\n')
end
for ii = (1:15)% iterates load indicator 4 times(4 seconds)
    for i = (1:3)% sub-iteration of the load indicator
        fprintf('.');% print a single period
        pause(0.3)% pause for 1/3 seconds
    end
    fprintf(repmat('\b', 1, 3));% bckspaces the last three locations on the line
end
fprintf('\n');
clear i ii

%% 3. Have the code decide who goes first
restart = 'Y';% initialy sets the restart value to yes
while restart == 'Y' || restart == 'y'% 8.a. If they do, reset and restart
    close all% close all open figures
    clear game_Board game_Board_logic% clear the game board and its logic matrix
    player = randi([1,2]);% randomly decide if X or O goes first
    i = player - 1;% for cordination between gameboard and logic board
    if player == 1
        fprintf('X''s will go first!\n')% display which player will go first
    else
        fprintf('O''s will go first!\n')% display which player will go first
    end
    %% 4. Use a function, BoardPlot_EC, to show an empty board
    game_Board = BoardPlot_EC;% call board plot with no inputs to display empty board
    game_Board_logic = NaN(3,3);% generate empty logic board
    
    %% 5. Have the players play the game & use a function, CheckWin_EC, to see if the game has ended after every turn
    while CheckWin_EC(game_Board_logic,player) == 0% while there is no winner...
        if any(any(isnan(game_Board_logic))) ~= 1% if there are no NaNs left the game is a draw so break the loop
            break
        end
        i = i+1;% iterate player number
        if mod(i,2) == 1% if the remainder of the player itteration devided by 2 is one then the player is player one
            player = 1;
        else
            player = 2;% ... otherwise it is player two
        end
        logical = 0;% set the variable logical to zero
        while logical == 0% while logical equals zero...
            [columns,rows]= ginput(1);% ... get the users input from cursor interation with game board
            [logical] = CheckTaken_EC(columns,rows,game_Board_logic);% Use the CheckTaken_EC function to determine if the space is free
            if logical == 0 %if logical remains false display message
                fprintf('That position on the board is already taken, please pick another.\n')
        
            end
        end
        %% 6. update the board with the function BoardPlot_EC
        [game_Board,game_Board_logic] = BoardPlot_EC(game_Board,game_Board_logic,columns,rows,player);% update the game board with new objects
    end
    
    %% 7. At the end of the game, display who won or that it was a draw
    pause(1.5)% wait 1.5 seconds to show line through matching set
    if any(any(isnan(game_Board_logic))) == 0% determines if the game was a draw
        fprintf('The game resulted in a draw :(\n');% display appropriate message
    elseif player == 1% if a win resulted on player 1's turn then X's win
        fprintf('X''s wins!\n')% display appropriate message
    else% otherwise player two wins
        fprintf('O''s wins!\n')% display appropriate message
    end
    
    %% 8. Ask user if they would like to play again
    restart = input('Would you like to play another round? [Y/N] ','s');% ask if the player would like to start again
    fprintf('\n')
end% 8.b. If not, end program