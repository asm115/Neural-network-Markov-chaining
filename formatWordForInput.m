% A function to take a regular string, and turn it into a padded column
% vector of ASCII codes with an input number at the beginning:
function formattedWord = formatWordForInput(word, inputNumber)

% Formatted word will be a column vector of 11 numbers:
formattedWord = zeros(11, 1);
% The first number will be the input number:
formattedWord(1, 1) = inputNumber;
% The rest of the numbers will be ASCII codes of characters, with the rest
% of the indexes filled with zeros if there are less than 10 characters:
temp = size(word);
numLetters = temp(2);
formattedWord(2:numLetters + 1, 1) = word';
