% Andy Morrison
% asm115
% EECS 484
% Final project

clear all
clearvars

% Some sentences that can be used to train the network:
sentence1 = {'This', 'is', 'a', 'test', 'sentence.'};
sentence2 = {'This', 'is', 'another', 'sentence', 'for', 'testing', 'purposes.'};
sentence3 = {'This', 'be', 'a', 'pirate', 'test', 'sentence.'};
sentence4 = {'circular', 'sentences', 'that', 'are', 'part', 'of', 'a'};
sentence5 = {'a', 'pair', 'of', 'circular'};

% Specify set of sentences that will be used to train the network:
sentences = {sentence4, sentence5};

% Create the neural network:
numberOfNeurons = 50;
net = feedforwardnet(numberOfNeurons);
% It is not desirable to have any of the training data used for validation:
net.divideFcn = 'dividetrain';

% Format the sentences to serve as inputs and outputs for the network:
allTrainingInputs = [];
allTrainingOutputs = [];
trainingInputs = [];
trainingOutputs = [];
temp = size(sentences);
numSentences = temp(2);
for i = 1:numSentences
    [trainingInputs, trainingOutputs] = formatForTraining(sentences{i}, i);
    allTrainingInputs = [allTrainingInputs, trainingInputs];
    allTrainingOutputs = [allTrainingOutputs, trainingOutputs];
end

% Train the network so the input of a word results in the output of the word that follows it:
net = train(net, allTrainingInputs, allTrainingOutputs);

% Perform Markov chaining, and display the results:
randomizedInputNumber = randi([1, numSentences]);
initialSentence = sentences{randomizedInputNumber};
initialWord = formatWordForInput(initialSentence{1}, randomizedInputNumber);
inputWord = initialWord;
% Display the initial word:
disp(formatOutputForPrinting(initialWord(2:end, 1)));
for i = 1:20
    % It is desirable to round the outputs of the net to integers:
    outputWord = round(sim(net, inputWord));
    formattedWord = formatOutputForPrinting(outputWord);
    % Each word that is output by the net is displayed:
    disp(formattedWord);
    % Pick the next value of the "input number" input to the net:
    randomizedInputNumber = pickNextSentence(sentences, formattedWord);
    % Prepare this iteration's output to be input on the next iteration:
    inputWord = [randomizedInputNumber; outputWord];
end
