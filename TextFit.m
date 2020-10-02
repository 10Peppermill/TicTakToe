function [] = TextFit(string)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
string_Length = (length(string));
max_Length = 75;
back = [0];
for ii = (1:floor(string_Length/max_Length))
    back(ii) = 0;
    while string((ii*(max_Length))-back(ii)) ~= ' '
        back(ii) = back(ii)+1;
    end
    back(ii) = back(ii);
end

for ii = (1:ceil(string_Length/max_Length))
    if ii == 1
        fprintf(string(ii:ii*75-back(ii)));
    elseif ii == ceil(string_Length/max_Length)
        fprintf(string((ii-1)*75-back(ii-1)+1:end));
    else
        fprintf(string((ii-1)*75-back(ii-1)+1:ii*75-back(ii)));
    end
    fprintf('\n')
end