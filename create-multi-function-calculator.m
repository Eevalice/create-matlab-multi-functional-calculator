% reference to the function of the
% https://www.mathworks.com/help/symbolic/sym.laplace.html, 
% C++ to Matlab Implementation
% Laplace Tranforms Calculator showcase all the possible functions available including inverse and Solving Initial Problems.
% Numerical showwcase all the possible functions available including fixed-method iteration, newton-raphson method, bisection method, and regula-falsi method known as the false position method
% Complex numbers showcase all the possible functions available including
% the operations on solving complex numbers, multiple conversions of complex numbers, roots of complex numbers and solving complex equations
syms x t s y(t) % Defines the Laplace variable s, x, y(t) as the initial condition variable and the time variable t as symbolic variables
   
while true 
    % Loops continuously until the user chooses to exit the program
    % Displays a menu of options for the user
    disp('Select an option:[1-12]')
    
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
    disp('10. Roots of Complex Numbers')
    disp('11. Solving Complex Equations')
    disp('----------------------------------------')
    disp('12. Exit Program')

    % signals the user to choose an option
    menu = input('Enter your menu option - [1-12]: ');

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
            g = input('Enter your func(x): ');
            x0 = input('Enter your initial value: ');
            e = input('Enter your tolerance: ');
            n = input('Enter no of iterations: ');

        for i=1:n
            x1 = g(x0); % number of iterations
            fprintf('x%d = %.f\n', i , x1)
            x0 = x1;
        end
     elseif menu == 5 % If the user chooses Newton-Raphson Method
        % signals the user to enter the function, initial guess, and tolerance
        syms x;

        % Input Section
        y = input('Enter function f(x): ');
        a = input('Enter initial guess: ');
        e = input('Tolerable error: ');
        N = input('Enter maximum number of steps: ');
        % Initializing step counter
        step = 1;

        % Finding derivate of given function
        g = diff(y,x);

        % Finding Functional Value
        fa = eval(subs(y,x,a));

        while abs(fa)> e
        fa = eval(subs(y,x,a));
        ga = eval(subs(g,x,a));
        if ga == 0
            disp('Division by zero.');
            break;
        end
    
        b = a - fa/ga;
        fprintf('step=%d\ta=%f\tf(a)=%f\n',step,a,fa);
        a = b;
    
        if step>N
            disp('Not convergent'); 
        break;
        end
        step = step + 1;
        end

    fprintf('Root is %f\n', a);
        
    elseif menu == 6 % If the user chooses Bisection Method
    % Setting x as symbolic variable
    syms x;

    % Input Section
    y = input('Enter function f(x): ');
    a = input('Enter first guess: ');
    b = input('Enter second guess: ');
    e = input('Tolerable error: ');

    % Finding Functional Value
    fa = eval(subs(y,x,a));
    fb = eval(subs(y,x,b));

    % Implementing Bisection Method
    if fa*fb > 0 
        disp('Given initial values do not bracket the root.');
    else
        c = (a+b)/2;
        fc = eval(subs(y,x,c));
        fprintf('\n\na\t\t\tb\t\t\tc\t\t\tf(c)\n');
    while abs(fc)>e
        fprintf('%f\t%f\t%f\t%f\n',a,b,c,fc);
        if fa*fc< 0
            b =c;
        else
            a =c;
        end
        c = (a+b)/2;
        fc = eval(subs(y,x,c));
    end
    fprintf('\nRoot is: %f\n', c);
    end
        
    elseif menu == 7 % If the user chooses Regula-Falsi Method
        % Setting x as symbolic variable
        syms x;

        % Input Section
        y = input('Enter function f(x): ');
        a = input('Enter first guess: ');
        b = input('Enter second guess: ');
        e = input('Tolerable error: ');

        % Finding Functional Value
        fa = eval(subs(y,x,a));
        fb = eval(subs(y,x,b));

        % Implementing Regula-Falsi Method 
        if fa*fb > 0 
            disp('Given initial values do not bracket the root.');
        else
            c = a - (a-b) * fa/(fa-fb);
            fc = eval(subs(y,x,c));
            fprintf('\n\na\t\t\tb\t\t\tc\t\t\tf(c)\n');
        while abs(fc)>e
            fprintf('%f\t%f\t%f\t%f\n',a,b,c,fc);
            if fa*fc< 0
                b =c;
                fb = eval(subs(y,x,b));
            else
                a =c;
                fa = eval(subs(y,x,a));
            end
            c = a - (a-b) * fa/(fa-fb);
            fc = eval(subs(y,x,c));
        end
        fprintf('\nRoot is: %f\n', c);
        end
        
    elseif menu == 8 % if the user chooses Complex Numbers:
    
        % MATLAB Complex Number Calculator with if-else conditional statements
        % refer to the documentation of MATLAB

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
            disp('------------------------------------------------------')
            disp('Basic operations on complex numbers:')
            disp(['z1 + z2 = ', num2str(z1 + z2)])
            disp(['z1 - z2 = ', num2str(z_diff)])
            disp(['z1 * z2 = ', num2str(z_product)])
            disp(['z1 / (z1 - z2) = ', num2str(z_quotient)])
        disp('------------------------------------------------------')    
        disp('Advanced operations on complex numbers:')
        disp('------------------------------------------------------')
        disp('Inverse, Hyperbolic, and Inverse Hyperbolic Functions:')
        disp('------------------------------------------------------')
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

    disp('------------------------------------------------------')
    disp('Exponential, Trigonometric, and Logarithmic Functions:')
    disp('------------------------------------------------------')
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

    elseif menu == 10 % if the user chooses the roots of the complex number
        % Find roots of a complex number
        c = input("Enter the complex number (in rectangular form): ");
        n = input("Enter the number of roots (n): ");
        roots = nthroot(abs(c), n).*exp(1j*(angle(c) + (0:n-1)*(2*pi/n))); % reference from the matlab documentation
        disp("Roots:");
        disp(roots);

    elseif menu == 11 % if the user chooses the complex equations
        disp("Solve Complex Equations")

    if choice == 13
        syms x
        eqn = input("Enter the complex equation in terms of x: ");
        solution = solve(eqn, x);
        disp("The solution is:")
        disp(solution)
   
    else
       disp("Enter two complex numbers in the form a+bi.")
       a1 = input("Enter the real part of the first number: ");
       b1 = input("Enter the imaginary part of the first number: ");
       a2 = input("Enter the real part of the second number: ");
       b2 = input("Enter the imaginary part of the second number: ");

       num1 = a1 + b1*1i;
       num2 = a2 + b2*1i;

   switch choice
       case 1
           result = num1 + num2;
           disp("The sum is:")
           disp(result)
       case 2
           result = num1 - num2;
           disp("The difference is:")
           disp(result)
       case 3
           result = num1 * num2;
           disp("The product is:")
           disp(result)
       case 4
           result = num1 / num2;
           disp("The quotient is:")
           disp(result)
       case 5
           result = abs(num1);
           disp("The modulus of the first number is:")
           disp(result)
           result = abs(num2);
           disp("The modulus of the second number is:")
           disp(result)
       case 6
           result = conj(num1);
           disp("The conjugate of the first number is:")
           disp(result)
           result = conj(num2);
           disp("The conjugate of the second number is:")
           disp(result)
       case 7
           result1 = abs(num1)*exp(1i*angle(num1));
           result2 = abs(num2)*exp(1i*angle(num2));
           disp("The exponential form of the first number is:")
           disp(result1)
           disp("The exponential form of the second number is:")
           disp(result2)
       case 8
           result1 = abs(num1)*cos(angle(num1)) + abs(num1)*1i*sin(angle(num1));
           result2 = abs(num2)*cos(angle(num2)) + abs(num2)*1i*sin(angle(num2));
           disp("The trigonometric form of the first number is:")
           disp(result1)
           disp("The trigonometric form of the second number is:")
           disp(result2)
       case 9
           result1 = 1/num1;
           result2 = 1/num2;
           disp("The inverse of the first number is:")
           disp(result1)
           disp("The inverse of the second number is:")
           disp(result2)
       case 10
           n = input("Enter the degree of the root: ");
           result1 = nthroot(num1, n);
           result2 = nthroot(num2, n);
           disp("The nth root of the first number is:")
        disp(result1)
        disp("The nth root of the second number is:")
        disp(result2)
        case 11
        result1 = sqrt(num1);
        result2 = sqrt(num2);
        disp("The square root of the first number is:")
        disp(result1)
        disp("The square root of the second number is:")
        disp(result2)
        case 12
        op = input("Enter the operation (+, -, , /): ");
   switch op
        case '+'
        result = num1 + num2;
        case '-'
        result = num1 - num2;
        case ''
        result = num1 * num2;
        case '/'
        result = num1 / num2;
        otherwise
        disp("Invalid operation!")
        return
    end
        disp("The result of the operation is:")
        disp(result)
    case 13
        disp("Invalid choice!")
    return
    otherwise
        disp("Invalid choice!")
    return
    end
    end

   elseif menu == 12 % If the user chooses Exit Program
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
