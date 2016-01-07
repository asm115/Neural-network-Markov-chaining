% A function to determine if a list of strings contains a given string:
function result = containsString(sentence, word)

result = 0;
temp = size(word);
wordLength = temp(2);
temp = size(sentence);
numWords = temp(2);
for i = 1:numWords
    currentWord = sentence{i};
    temp = size(currentWord);
    length = temp(2);
    if length == wordLength
        if any((word == currentWord) == 0) == 0
            result = 1;
        end
    end
end
