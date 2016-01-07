% A function to split a sentence into words and integrate them into the
% list of training inputs and outputs:
function [trainingInputs, trainingOutputs] = formatForTraining(sentence, inputNumber)

% Each column of trainingInputs must be a word in a sentence.
% Each word in a sentence must be formatted to have 10 letters (rows),
% plus one extra row that serves as the identifier of the sentence it came
% from.
% Each column of trainingOutputs must be a word, and each column must have
% 10 rows (letters).

temp = size(sentence);
numWords = temp(2);
trainingInputs = zeros(11, numWords - 1);
trainingInputs(1, :) = inputNumber;
trainingOutputs = zeros(10, numWords - 1);

for i = 1:numWords - 1
    % Isolate a word and the word that follows it:
    currentWord = sentence{1, i};
    followingWord = sentence{1, i + 1};
    % Put the current word into the matrix of training inputs:
    temp = size(currentWord);
    numLetters = temp(2);
    trainingInputs(2:numLetters + 1, i) = double(currentWord');
    % Put the following word into the matrix of training outputs:
    temp = size(followingWord);
    numLetters = temp(2);
    trainingOutputs(1:numLetters, i) = double(followingWord');
end
