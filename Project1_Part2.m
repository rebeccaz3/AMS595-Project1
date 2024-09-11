% Prompt the user for the desired precision level (number of significant figures)
precision_level = input('Enter the number of significant figures for level of precision: ');

% Calculate the tolerance based on the specified precision level
tolerance = 10^(-precision_level);

% Initialize variables  
points_in_circle = 0;
total_points = 0;
deviation = inf; % Start with a large deviation to enter the loop

% Initialize vector that will hold our points to be plotted in a graph
x_values_incircle = []; 
y_values_incircle = [];
x_values_outcircle = []; 
y_values_outcircle = [];

% While loop to estimate pi until the desired precision is achieved
while deviation > tolerance
    % Generate random points x and y in the range [-1, 1] 
    x = 2 * rand() - 1;
    y = 2 * rand() - 1;
    total_points = total_points + 1; % Increment the total points counter
    
    % Check if the point is inside the circle
    if x^2 + y^2 <= 1
        points_in_circle = points_in_circle + 1;
        % Add the generated values into the vectors for plotting
        x_values_incircle(end+1) = x;
        y_values_incircle(end+1) = y;
    else
        x_values_outcircle(end+1) = x;
        y_values_outcircle(end+1) = y;
    end
    
    % Estimate the value of Pi and calculate its deviation from the true value of Pi
    estimated_pi = 4.0 * (points_in_circle / total_points);
    deviation = abs(pi - estimated_pi);
end

% Display the results
fprintf('Estimated value of pi: %.4f\n', estimated_pi);
fprintf('Number of iterations required: %.0f\n', total_points);


% Set up scatter plot
figure; 
grid on;
title('Monte Carlo Scatterplot');
xlabel('x');
ylabel('y');
hold on;
% Adjust axis limits
xlim([-1, 1]);
ylim([-1, 1]);
% Darken the x=0 and y=0 axis lines
plot([0, 0], ylim, 'k', 'LineWidth', 1);
hold on;
plot(xlim, [0, 0], 'k', 'LineWidth', 1);
hold on;

% Plot a circle centered at (0,0) with radius 1
theta = linspace(0, 2*pi, 100);
x = cos(theta);
y = sin(theta);
plot(x, y, 'k', 'LineWidth', 2);
hold on;

% Plot the scatter plot of our generated points inside the circle in red
x = x_values_incircle;
y = y_values_incircle;
scatter(x, y, 25, 'r', 'filled');
hold on;

% Plot the scatter plot of our generated points outside the circle in blue
x = x_values_outcircle;
y = y_values_outcircle;
scatter(x, y, 25, 'blue', 'filled');



