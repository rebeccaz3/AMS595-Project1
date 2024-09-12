% This is a local function that calculates the estimated Pi & creates a
% visualization
function estimated_pi = estimatePi(precision_level)
    % Function to estimate the value of Pi using a desired level of precision
    % Validate the input
    if ~isnumeric(precision_level) || precision_level <= 0 
        error('Precision level must be a positive integer.');
    end

    % Initialize variables  
    points_in_circle = 0;
    total_points = 0;
    deviation = inf; % Start with a large deviation to enter the loop

    figure();
    % While loop to estimate pi until the desired precision is achieved
    while deviation > 0.1^precision_level
        % Generate random points x and y in the range [-1, 1] 
        x = 2 * rand() - 1;
        y = 2 * rand() - 1;
        total_points = total_points + 1; % Increment the total points counter

        % Check if the point is inside/outside the circle
        hold on;
        if x^2 + y^2 <= 1
            points_in_circle = points_in_circle + 1;
            plot(x,y,'b.');
        else
            plot(x,y,'r.');
        end
        
        % Estimate the value of Pi and calculate its deviation from the true value of Pi
        estimated_pi = 4.0 * (points_in_circle / total_points);
        deviation = abs(pi - estimated_pi);
    end
    fprintf('Number of iterations required: %.0f\n', total_points);

    % Set up the scatter plot
    hold on;
    grid on;
    title('Monte Carlo Scatterplot');
    xlabel('x');
    ylabel('y');
    hold on;
    % Adjust axis limits
    xlim([-1, 1]);
    ylim([-1, 1]);

    % Plot a circle centered at (0,0) with radius 1
    theta = linspace(0, 2*pi, 100);
    x_circle = cos(theta);
    y_circle = sin(theta);
    plot(x_circle, y_circle, 'k', 'LineWidth', 1);


    % Display the estimated_pi value in the bottom right corner
    text(0.7, -0.9, sprintf('\\pi \\approx %.4f', estimated_pi), 'FontSize', 12, 'FontWeight', 'bold');

    hold off;

    % Return the estimated value of Pi
    return;
end