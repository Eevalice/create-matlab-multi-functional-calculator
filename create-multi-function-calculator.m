% reference to the function of the
% https://www.mathworks.com/help/symbolic/sym.laplace.html, 
% C++ to Matlab Implementation
% Laplace Tranforms Calculator showcase all the possible functions available including inverse and Solving Initial Problems.
% Numerical showwcase all the possible functions available including fixed-method iteration, newton-raphson method, bisection method, and regula-falsi method known as the false position method
syms x t s y(t) % Defines the Laplace variable s, x, y(t) as the initial condition variable and the time variable t as symbolic variables
   
while true 
    % Loops continuously until the user chooses to exit the program
    % Displays a menu of options for the user
    disp('Select an option:[1-10]')
    
    % Laplace Transform
    disp('Welcome to Laplace Transform Calculator')
    disp('----------------------------------------')
    disp('1. Laplace Transform')
    disp('2. Inverse Laplace Transform')
    disp('3. Solve Initial Value Problem')
    disp('----------------------------------------')
    % Numerical Methods
    disp('Welcome to Numerical Methods Calculator')
    disp('----------------------------------------')
    disp('4. Fixed Point Iteration Method')
    disp('5. Newton-Raphson Method')
    disp('6. Bisection Method')
    disp('7. Regula-Falsi Method')
    disp('----------------------------------------')
    % Operation of Complex Numbers
    disp('Welcome to Complex Numbers Calculator')
    disp('----------------------------------------')
    disp('8. Operations on Solving Complex Numbers')
    disp('9. Multiple Conversions of Complex Numbers')
    disp('----------------------------------------')
    disp('10. Exit Program')

    % signals the user to choose an option
    menu = input('Enter your menu option - [1-10]: ');

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

        % Solves the differential equation and initial conditions and displays the result
        solution = dsolve(equation, condition1); % merging all the formulas
        disp(['The solution to the differential equation ', char(equation), ' with initial conditions ', char(condition1), ' is y(t) = ', char(solution)])
        

      elseif menu == 4 % If the user chooses Fixed Point Iteration Method
        % signals the user to enter the function, initial guess, and tolerance
        f = input('Enter the function f(x): ');
        x0 = input('Enter the initial guess x0: ');
        tol = input('Enter the tolerance: ');

        % Applies the Fixed Point Iteration Method and displays the result
        [x, iter] = fixed_point_iteration(f, x0, tol);
        disp(['The fixed point of f(x) = ', char(f), ' is x = ', num2str(x), ' with ', num2str(iter), ' iterations.'])
        
     elseif menu == 5 % If the user chooses Newton-Raphson Method
        % signals the user to enter the function, initial guess, and tolerance
        f = input('Enter the function f(x): ');
        df = input('Enter the derivative of f(x): ');
        x0 = input('Enter the initial guess x0: ');
        tol = input('Enter the tolerance: ');

        % Applies the Newton-Raphson Method and displays the result
        [x, iter] = newton_raphson(f, df, x0, tol);
        disp(['The root of f(x) = ', char(f), ' is x = ', num2str(x), ' with ', num2str(iter), ' iterations.'])
        
    elseif menu == 6 % If the user chooses Bisection Method
        % signals the user to enter the function, interval, and tolerance
        f = input('Enter the function f(x): ');
        a = input('Enter the left endpoint a: ');
        b = input('Enter the right endpoint b: ');
        tol = input('Enter the tolerance: ');

        % Applies the Bisection Method and displays the result
        [x, iter] = bisection(f, a, b, tol);
        disp(['The root of f(x) = ', char(f), ' is x = ', num2str(x), ' with ', num2str(iter), ' iterations.'])
        
    elseif menu == 7 % If the user chooses Regula-Falsi Method
        % signals the user to enter the function, interval, and tolerance
        f = input('Enter the function f(x): ');
        a = input('Enter the left endpoint a: ');
        b = input('Enter the right endpoint b: ');
        tol = input('Enter the tolerance: ');

        % Applies the Regula-Falsi Method and displays the result
        [x, iter] = regula_falsi(f, a, b, tol);
        disp(['The root of f(x) = ', char(f), ' is x = ', num2str(x), ' with ', num2str(iter), ' iterations.'])
        
    elseif menu == 8 % if the user chooses Complex Numbers:
    
        % Matlab Complex Number Calculator with if-else statements

        disp('Complex Number Calculator')

        % signals the user to enter the real and imaginary parts of the first complex number
            real_part_1 = input('Enter the real part of the first complex number: ');
            imag_part_1 = input('Enter the imaginary part of the first complex number: ');

        % signals the user to enter the real and imaginary parts of the second complex number
            real_part_2 = input('Enter the real part of the second complex number: ');
            imag_part_2 = input('Enter the imaginary part of the second complex number: ');

        % signals the two complex numbers
            z1 = real_part_1 + imag_part_1*1i;
            z2 = real_part_2 + imag_part_2*1i;

        % signals the difference between the two complex numbers
            z_diff = z1 - z2;

        % Check if the difference is equal to zero
            if z_diff == 0
            disp('Error: Division by zero')
        else
        % Calculate the quotient of the two complex numbers
            z_quotient = z1 / z_diff;
    
        % Calculate the product of the two complex numbers
            z_product = z1 * z2;
    
        % Calculate the inverse of the first complex number
            z1_inverse = 1 / z1;
    
        % Calculate the inverse of the second complex number
            z2_inverse = 1 / z2;
    
        % Calculate the hyperbolic sine of the first complex number
            z1_sinh = sinh(z1);
    
        % Calculate the hyperbolic cosine of the first complex number
            z1_cosh = cosh(z1);
    
        % Calculate the hyperbolic tangent of the first complex number
            z1_tanh = tanh(z1);
    
        % Calculate the inverse hyperbolic sine of the first complex number
            z1_asinh = asinh(z1);
    
        % Calculate the inverse hyperbolic cosine of the first complex number
            z1_acosh = acosh(z1);
    
        % Calculate the inverse hyperbolic tangent of the first complex number
            z1_atanh = atanh(z1);
    
        % Calculate the exponential of the first complex number
            z1_exp = exp(z1);
    
        % Calculate the logarithm of the first complex number
            z1_log = log(z1);
    
        % Calculate the base 10 logarithm of the first complex number
            z1_log10 = log10(z1);
    
        % Calculate the square root of the first complex number
            z1_sqrt = sqrt(z1);
    
        % Calculate the cosine of the first complex number
            z1_cos = cos(z1);
    
        % Calculate the sine of the first complex number
            z1_sin = sin(z1);
    
        % Calculate the tangent of the first complex number
            z1_tan = tan(z1);
    
        % Calculate the arccosine of the first complex number
            z1_acos = acos(z1);
    
        % Calculate the arcsine of the first complex number
            z1_asin = asin(z1);
    
        % Calculate the arctangent of the first complex number
            z1_atan = atan(z1);

        % Display the results
            disp('Basic operations on complex numbers:')
            disp(['z1 + z2 = ', num2str(z1 + z2)])
            disp(['z1 - z2 = ', num2str(z_diff)])
            disp(['z1 * z2 = ', num2str(z_product)])
            disp(['z1 / (z1 - z2) = ', num2str(z_quotient)])

            disp('Advanced operations on complex numbers:')
        
        disp('Inverse, Hyperbolic, and Inverse Hyperbolic Functions:')
        % displaying inverse complex numbers
            disp(['1 / z1 = ', num2str(z1_inverse)]) 
            disp(['1 / z2 = ', num2str(z2_inverse)]) 
        % displaying hyperbolic complex numbers 
            disp(['sinh(z1) = ', num2str(z1_sinh)]) 
            disp(['cosh(z1) = ', num2str(z1_cosh)])
            disp(['tanh(z1) = ', num2str(z1_tanh)])
        % displaying inverse hyperbolic complex numbers
            disp(['asinh(z1) = ', num2str(z1_asinh)])
            disp(['acosh(z1) = ', num2str(z1_acosh)])
            disp(['atanh(z1) = ', num2str(z1_atanh)])


    disp('Exponential, Trigonometric, and Logarithmic Functions:')
        % displaying the Exponential and Logarithmic functions
            disp(['exp(z1) = ', num2str(z1_exp)])
            disp(['log(z1) = ', num2str(z1_log)])
            disp(['log10(z1) = ', num2str(z1_log10)])
            disp(['sqrt(z1) = ', num2str(z1_sqrt)])
    % displaying the Trigonometric Functions
            disp(['cos(z1) = ', num2str(z1_cos)])
            disp(['sin(z1) = ', num2str(z1_sin)])
            disp(['tan(z1) = ', num2str(z1_tan)])
    % displaying the Inverse Logarithmic Functions
            disp(['acos(z1) = ', num2str(z1_acos)])
            disp(['asin(z1) = ', num2str(z1_asin)])
            disp(['atan(z1) = ', num2str(z1_atan)])
            end

    elseif menu == 9 % if the user chooses to perform conversion of complex numbers 
while true
        disp("Choose the type of conversion you would like to perform:");
        disp("1. Rectangular to Polar");
        disp("2. Polar to Rectangular");
        disp("3. Rectangular to Exponential");
        disp("4. Exponential to Rectangular");
        disp("5. Polar to Exponential");
        disp("6. Exponential to Polar");
        disp("7. Polar to Trigonometric");
        disp("8. Trigonometric to Polar");
        disp("9. Rectangular to Trigonometric");
        disp("10. Trigonometric to Rectangular");
        disp('11. Exit the Program');

        choices = input("Enter your choices - [1-11]: ");

  if choices == 1 
        % Rectangular to Polar Conversion
        x = input("Enter the real part (x): ");
        y = input("Enter the imaginary part (y): ");
        r = sqrt(x^2 + y^2);
        theta = atan2(y, x);
        fprintf("Polar form: (%.2f, %.2f)\n", r, theta);
        
  elseif choices== 2
        % Polar to Rectangular Conversion
        r = input("Enter the magnitude (r): ");
        theta = input("Enter the angle in degrees: ");
        x = r*cosd(theta);
        y = r*sind(theta);
        fprintf("Rectangular form: (%.2f, %.2f)\n", x, y);
        
  elseif choices == 3
        % Rectangular to Exponential Conversion
        x = input("Enter the real part (x): ");
        y = input("Enter the imaginary part (y): ");
        r = sqrt(x^2 + y^2);
        theta = atan2(y, x);
        fprintf("Exponential form: %.2f * exp(%.2fj)\n", r, theta);
        
  elseif choices == 4
        % Exponential to Rectangular Conversion
        r = input("Enter the magnitude (r): ");
        theta = input("Enter the angle in degrees: ");
        x = r*cosd(theta);
        y = r*sind(theta);
        fprintf("Rectangular form: (%.2f, %.2f)\n", x, y);
        
  elseif choices == 5
        % Polar to Exponential Conversion
        r = input("Enter the magnitude (r): ");
        theta = input("Enter the angle in degrees: ");
        rexp = r*exp(1j*deg2rad(theta));
        fprintf("Exponential form: %.2f * exp(%.2fj)\n", abs(rexp), rad2deg(angle(rexp)));
        
  elseif choices == 6
        % Exponential to Polar Conversion
        rexp = input("Enter the exponential form (rexp * exp(j*theta)): ");
        r = abs(rexp);
        theta = rad2deg(angle(rexp));
        fprintf("Polar form: (%.2f, %.2f)\n", r, theta);
        
  elseif choices == 7
        % Polar to Trigonometric Conversion
        r = input("Enter the magnitude (r): ");
        theta = input("Enter the angle in degrees: ");
        fprintf("Trigonometric form: %.2f * cos(%.2f) + %.2f * sin(%.2f)\n", r*cosd(theta), theta, r*sind(theta), theta);
    
  elseif choices == 8
        % Trigonometric to Polar Conversion
        c = input("Enter the complex number in trigonometric form (a*cos(theta) + b*sin(theta)): ");
        a = real(c);
        b = imag(c);
        r = sqrt(a^2 + b^2);
        theta = rad2deg(atan2(b, a));
        fprintf("Polar form: (%.2f, %.2f)\n", r, theta);

  elseif choices == 9
        % Rectangular to Trigonometric Conversion
        x = input("Enter the real part (x): ");
        y = input("Enter the imaginary part (y): ");
        r = sqrt(x^2 + y^2);
        theta = atan2(y, x);
        fprintf("Trigonometric form: %.2f * cos(%.2f) + %.2f * sin(%.2f)\n", r, rad2deg(theta), r, rad2deg(theta)+180);
    
  elseif choices == 10
        % Trigonometric to Rectangular Conversion
        c = input("Enter the complex number in trigonometric form (a*cos(theta) + b*sin(theta)): ");
        a = real(c);
        b = imag(c);
        r = sqrt(a^2 + b^2);
        theta = atan2(b, a);
        x = r*cos(theta);
        y = r*sin(theta);
        fprintf("Rectangular form: (%.2f, %.2f)\n", x, y);

    elseif choices == 11 % If the user chooses Exit Program
        disp('Exiting program.')
        break % Breaks out of the while loop and exits the program
    else % If the user enters an invalid choice
        disp('Invalid option. Please try again.')
  end
end

   elseif menu == 10 % If the user chooses Exit Program
        disp('Exiting program.')
        break % Breaks out of the while loop and exits the program
    else % If the user enters an invalid choice
        disp('Invalid option. Please try again.')
    end

    % Adds a blank line to separate the output from different iterations of the loop
    disp(' ')
end
% Honor Pledge for Group Projects "I accept responsibility for my role in ensuring the integrity of the work submitted by the group in which I participated."
% Group Programming Pair: Carl Vincent A. Reyno, Chris Evan S. Tapang
