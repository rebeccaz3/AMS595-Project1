% Prompt the user for the desired precision level (number of significant figures)
precision_level = input('Enter the number of significant figures for level of precision: ');

% Initialize variables  
points_in_circle = 0;
total_points = 0; % Keeps count of  number of iterations required to achieve each level of precision
deviation = inf; % Start with a large deviation to enter the loop

% While loop to estimate pi until the desired precision is achieved
while deviation > 0.1^precision_level
    % Generate random points x and y in the range [-1, 1] 
    x = 2 * rand() - 1;
    y = 2 * rand() - 1;
    total_points = total_points + 1; % Increment the total points counter

    % Check if the point is inside/outside the circle
    if x^2 + y^2 <= 1
        points_in_circle = points_in_circle + 1;
    end
        
    % Estimate the value of Pi and calculate its deviation from the true value of Pi
    estimated_pi = 4.0 * (points_in_circle / total_points);
    deviation = abs(pi - estimated_pi);
end

% Display the results
fprintf('Estimated value of pi: %.4f\n', estimated_pi);
fprintf('Number of iterations required: %.0f\n', total_points);
