% Initialize variables
total_points_max = 50; % Maximum number of points
total_points_list = 1:total_points_max; % Array of total points from 1 to 20
points_in_circle = 0; 


% Initialize vectors to store results to be plotted
estimated_pi_list = 1:total_points_max; 
deviation_list = 1:total_points_max; 
time_list = 1:total_points_max;

% Start measuring time
tic; 

% Iterate a fixed number times inputted by the user
% Loop over different numbers of points from 1 to total_points_max
for i = 1:total_points_max
    % Initialize variables  
    points_in_circle = 0; 

    % Generate random points x and y in the range [-1, 1] 
    x = 2 * rand() - 1;
    y = 2 * rand() - 1;
    
    % Check if the point is inside the circle
    % If so, update the count of points in circle
    if (x^2 + y^2) <= 1
        points_in_circle = points_in_circle + 1;
    end

    % Track the amount of time for code to execute
    timeElapsed = toc;

    % Estimate the value of Pi
    estimated_pi = 4.0 * (points_in_circle / i);

    % Calculate deviation from the true value of Pi 
    deviation = abs(pi - estimated_pi);

    % Store results in vectors
    estimated_pi_list(i) = estimated_pi;
    deviation_list(i) = deviation;
    time_list(i) = timeElapsed;
end



% Plot Figure 1: Estimated Pi and Deviation vs. Number of Points
figure(1);
plot(total_points_list, estimated_pi_list(total_points_list), 'r-o', 'DisplayName', 'Estimated \pi');
hold on;
plot(total_points_list, deviation_list(total_points_list), 'b-o', 'DisplayName', 'Deviation');
xlabel('Number of Points');
ylabel('Value');
title('Estimated \pi and Deviation vs. Number of Points');
legend;
grid on;
set(gca, 'XScale', 'linear', 'YScale', 'linear'); % Linear scale for both axes


% Plot Figure 2: Execution Time vs. Number of Points
figure(2);
plot(total_points_list, time_list(total_points_list), 'g-o', 'DisplayName', 'Execution Time');
xlabel('Number of Points');
ylabel('Execution Time (seconds)');
title('Execution Time vs. Number of Points');
legend;
grid on;
set(gca, 'XScale', 'linear', 'YScale', 'linear'); % Linear scale for both axes
