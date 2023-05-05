% reference to the function of the https://www.mathworks.com/help/symbolic/sym.laplace.html
syms t s % Defines the Laplace variable s and the time variable t as symbolic variables

while true 
    % Loops continuously until the user chooses to exit the program
    % Displays a menu of options for the user
    disp('Select an option:')
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
        % Prompts the user to enter the function to take the inverse Laplace transform of
        F = input('Enter the function F(s): ');

        % Takes the inverse Laplace transform of the function and displays the result
        f = ilaplace(F);
        disp(['The inverse Laplace transform of F(s) = ', char(F), ' is f(t) = ', char(f)])
        
    elseif menu == 3 % If the user chooses Solve Initial Value Problem
        % Prompts the user to enter the differential equation and initial conditions
        eqn = input('Enter the differential equation: ');
        cond1 = input('Enter the first initial condition: ');
        cond2 = input('Enter the second initial condition: ');

        % Solves the differential equation and initial conditions and displays the result
        sol = dsolve(eqn, [cond1, cond2]);
        disp(['The solution to the differential equation ', char(eqn), ' with initial conditions ', char(cond1), ' and ', char(cond2), ' is y(t) = ', char(sol)])
        
    elseif menu == 4 % If the user chooses Exit Program
        disp('Exiting program.')
        break % Breaks out of the while loop and exits the program
    else % If the user enters an invalid choice
        disp('Invalid choice. Please choose again.')
    end

    % Adds a blank line to separate the output from different iterations of the loop
    disp(' ')
end
