% Prompt the user for the desired precision level (number of significant figures)
precision_level = input('Enter the number of significant figures for level of precision: ');

% Call the function to calulated the estimated value of Pi 
estimated_pi = monteCarloPi(precision_level);

% Display results 
fprintf('Estimated value of pi: %.4f\n', estimated_pi);


function estimated_pi = monteCarloPi(precision_level)
    % Function to estimate the value of Pi using the Monte Carlo method
    % using a desired level of precision

    % Validate the input
    if ~isnumeric(precision_level) || precision_level <= 0 || mod(precision_level, 1) ~= 0
        error('Precision level must be a positive integer.');
    end

    % Calculate the tolerance based on the specified precision level
    tolerance = 10^(-precision_level);

    % Initialize variables  
    points_in_circle = 0;
    total_points = 0;
    deviation = inf; % Start with a large deviation to enter the loop

    % Initialize vectors for storing points for plotting
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

    % Set up the scatter plot
    figure; 
    grid on;
    title('Monte Carlo Scatterplot');
    xlabel('x');
    ylabel('y');
    hold on;
    xlim([-1, 1]);
    ylim([-1, 1]);
    plot([0, 0], ylim, 'k', 'LineWidth', 1);
    plot(xlim, [0, 0], 'k', 'LineWidth', 1);

    % Plot a circle centered at (0,0) with radius 1
    theta = linspace(0, 2*pi, 100);
    x_circle = cos(theta);
    y_circle = sin(theta);
    plot(x_circle, y_circle, 'k', 'LineWidth', 2);

    % Plot the scatter plot of points inside the circle using a function
    plotScatter(x_values_incircle, y_values_incircle, 'r');

    % Plot the scatter plot of points outside the circle using a function
    plotScatter(x_values_outcircle, y_values_outcircle, 'b');

    % Display the estimated_pi value in the bottom right corner
    text(0.7, -0.9, sprintf('\\pi \\approx %.4f', estimated_pi), 'FontSize', 12, 'FontWeight', 'bold');

    hold off;

    % Return the estimated value of Pi
    return;
    
end



function plotScatter(x, y, color)
    % Function to plot a scatter plot of given x and y data points with a specified color.

    % Validate inputs
    if ~isvector(x) || ~isvector(y) || length(x) ~= length(y)
        error('x and y must be vectors of the same length.');
    end
    if ~ischar(color) || ~ismember(color, {'r', 'g', 'b', 'k', 'm', 'c', 'y'})
        error('Invalid color specification. Use ''r'', ''g'', ''b'', ''k'', ''m'', ''c'', or ''y''.');
    end

    % Plot the scatter plot
    scatter(x, y, 25, color, 'filled');
end