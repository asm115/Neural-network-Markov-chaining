% A function to take a column vector outputted by the neural net, and turn
% it back into a row vector of characters with the padding zeros trimmed:
function formattedOutput = formatOutputForPrinting(output)

% Any zeros in the neural net's output are just padding to be trimmed:
numNonZeroChars = 0;
for i = 1:10
    if output(i, 1) ~= 0
        numNonZeroChars = numNonZeroChars + 1;
    end
end
formattedOutput = zeros(1, numNonZeroChars);
formattedOutput(1, 1:numNonZeroChars) = output(1:numNonZeroChars, 1)';
formattedOutput = char(abs(formattedOutput));
