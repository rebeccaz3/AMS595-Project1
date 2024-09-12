% Prompt the user for the desired precision level (number of significant figures)
precision_level = input('Enter the number of significant figures for level of precision: ');

% Call the function to calulate the estimated value of Pi & graph it
es = estimatePi(precision_level);

% Display results 
fprintf('Estimated value of pi: %.4f\n', es);