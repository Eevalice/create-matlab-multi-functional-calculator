% reference to the function of the https://www.mathworks.com/help/symbolic/sym.laplace.html
syms t s % Defines the Laplace variable s and the time variable t as symbolic variables

while true 
    % Loops continuously until the user chooses to exit the program
    % Displays a menu of options for the user
    disp('Welcome to Laplace Transform Calculator')
    disp('Select an option or operation to perform the ff. task:')
    disp('1. Laplace Transform')
    disp('2. Inverse Laplace Transform')
    disp('3. Solve Initial Value Problem')
    disp('4. Exit Program')

    % signals the user to choose an option
    menu = input('Enter your choice: ');

    if menu == 1 % If the user chooses Laplace Transform
        % signals the user to enter the function to take the Laplace transform of
        f = input('Enter the function f(t): ');

        % Takes the Laplace transform of the function and displays the result
        F = laplace(f);
        disp(['The Laplace transform of f(t) = ', char(f), ' is F(s) = ', char(F)])
        
    elseif menu == 2 % If the user chooses Inverse Laplace Transform
        % signals the user to enter the function to take the inverse Laplace transform of
        F = input('Enter the function F(s): ');

        % Takes the inverse Laplace transform of the function and displays the result
        f = ilaplace(F); % refer to the documentation of inverse laplace
        disp(['The inverse Laplace transform of F(s) = ', char(F), ' is f(t) = ', char(f)])
        
    elseif menu == 3 % If the user chooses Solve Initial Value Problem
        % signals the user to enter the differential equation and initial conditions
        equation = input('Enter the differential equation: ');
        condition1 = input('Enter the first initial condition: ');
        condition2 = input('Enter the second initial condition: ');

        % Solves the differential equation and initial conditions and displays the result
        solution = dsolve(equation, [conditon1, condition2]); % merging all the formulas
        disp(['The solution to the differential equation ', char(equation), ' with initial conditions ', char(condition1), ' and ', char(condition2), ' is y(t) = ', char(solution)])
        
    elseif menu == 4 % If the user chooses Exit Program
        disp('Exiting program.')
        break % Breaks out of the while loop and exits the program
    else % If the user enters an invalid choice
        disp('Invalid choice. Please choose again.')
    end

    % Adds a blank line to separate the output from different iterations of the loop
    disp(' ')
end

% Honor Pledge for Group Projects "I accept responsibility for my role in ensuring the integrity of the work submitted by the group in which I participated."
% Group Programming Pair: Carl Vincent A. Reyno, Chris Evan S. Tapang
