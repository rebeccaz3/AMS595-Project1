# AMS595-Project1

## README: Monte Carlo Simulation for Estimating pi
Overview: 
This repository contains MATLAB code for estimating the value of pi using a Monte Carlo simulation. The code is divided into three parts, demonstrating the use of different flow control mechanisms and visualizations.

## Part 1: Estimating pi with a For Loop
Description: 
This part uses a for loop to estimate pi by generating a fixed number of random points onto a 2x2 square, inscribed with a circle of radius 1. It uses the proportion of points that fall inside the circle out of the total number of points in order to estimate pi. Then, it displays 2 graphs that showcase the relationship of increasing sample size, to precision of the estimate and computational cost. 

How to Use: 
- Open Project1_Part1.m in MATLAB.
- Set total_points to the desired number of points.
- Run the script to see the plots and execution time.

Key Outputs:
- Figure 1: Plots the estimated value of pi and its deviation vs. the number of points. This shows the relationship between sample size and accuracy of the estimation.
- Figure 2: Shows the execution time vs. the number of points. This shows the relationship between sample size and computational cost, which indirectly shows the relationship between accuracy and computational cost. 

## Part 2: Estimating pi with a While Loop
Description: 
This part modifies the previous code to use a while loop to estimate pi until a specified level of precision is achieved. The precision is defined by the user’s input. The number of iterations required is displayed, and the final estimate is shown.

How to Use: 
- Open Project1_Part2.m in MATLAB.
- Run the script. When prompted, enter the desired precision level (number of significant figures). This must be a positive integer value.
- Obtain the estimated value of pi and the number of iterations required.

Key Outputs: 
- Command Window: Displays the estimated value of pi and the number of iterations required.

## Part 3: Function for Estimating pi with Visualization
Description: 
This part uses a function called estimatePi() which is included in the repository. This function takes a user-defined precision level as an input, dynamically plots random points as they are generated, and distinguishes between points inside and outside the unit circle. The function displays the final estimate of pi on the plot and returns this value.

How to Use: 
- Open Project1_Part3.m in MATLAB.
- Run the script. When prompted, enter the desired precision level (number of significant figures). This must be a positive integer value.
- The function will generate a plot showing the distribution of random points and the estimated value of pi.

Key Outputs: 
- Plot: Shows random points with those inside the circle in blue and outside the circle in red. The estimated value of pi is displayed at the bottom-right corner of the plot.
- Command Window: Displays the estimated value of pi and the number of iterations that was needed to achieve the level of precision.
