% Given a word, this function randomly picks a sentence that contains the
% word from the list of sentences:
function nextSentence = pickNextSentence(sentences, word)

possibleInputs = [];
temp = size(sentences);
numSentences = temp(2);
for i = 1:numSentences
    if containsString(sentences{i}, word)
        possibleInputs = [possibleInputs, i];
    end
end
temp = size(possibleInputs);
numPossible = temp(2);
if numPossible == 0
    nextSentence = 1;
else
    nextSentence = possibleInputs(randi([1, numPossible]));
end
