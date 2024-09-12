% Part 1: using for loop

% Initialize variables
total_points = 100; % Total fixed number of points 
num_points = 1:total_points; % Array of 1 to 100 to keep track of how many points we have
points_in_circle = 0; 

% Initialize vectors to store data to be plotted
estimated_pi_list = 1:total_points; 
deviation_list = 1:total_points; 
time_list = 1:total_points;

% Start measuring time
tic; 

% For loop that iterates a fixed number times 
for i = 1:total_points
    % Generate random points x and y in the range [-1, 1] 
    x = 2 * rand() - 1;
    y = 2 * rand() - 1;
    
    % Check if the point is inside the circle
    if (x^2 + y^2) <= 1
        points_in_circle = points_in_circle + 1;
    end

    % Track the amount of time for code to execute
    time_list(i) = toc;

    % Estimate the value of Pi
    estimated_pi = 4.0 * (points_in_circle / i); % i=the total num of points generated so far
    estimated_pi_list(i) = estimated_pi;

    % Calculate deviation from the true value of Pi 
    deviation = abs(pi - estimated_pi);
    deviation_list(i) = deviation;
end

% Plot Figure 1: Estimated Pi and Deviation vs. Number of Points
figure(1);
plot(num_points, estimated_pi_list(num_points), 'r-o', 'DisplayName', 'Estimated \pi');
hold on;
plot(num_points, deviation_list(num_points), 'b-o', 'DisplayName', 'Deviation');
xlabel('Number of Points');
ylabel('Value');
title('Estimated \pi and Deviation vs. Number of Points');
legend;
grid on;


% Plot Figure 2: Execution Time vs. Number of Points
figure(2);
plot(num_points, time_list(num_points), 'g-o', 'DisplayName', 'Execution Time');
xlabel('Number of Points');
ylabel('Execution Time (seconds)');
title('Execution Time vs. Number of Points');
legend;
grid on;
hold off;