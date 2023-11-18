fprintf("\n")
disp("This program calculates both bode and nyquist plot from a transfer function");
choice = input ("Enter 0 if transfer function is factorized or 1 if decomposed: ");

switch choice
    case 0
        fprintf("\n")
        disp ("NUMERATOR")
        n_factors = input ("how many factors are used? ")
        deg = input ("what is the highest degree between factors? ")

        % rows = number of factors, columns = coefficients 
        A = zeros(n_factors, deg+1);

            for rows = 0:n_factors-1
                fprintf("\n")
                disp ( "FACTOR: " + (rows+1) )
                for columns = 0:deg
                    A(rows+1, columns+1) = input ("enter coefficient of " + ...
                                                  "the " + columns + " degree: ");                                                    
                end
            end
           
        %creates decomposed numerator
        num = [1];
        for i = 0: n_factors-1
            num = conv(num , A(i+1,:));
        end
        fprintf("\n")
        disp ("DENOMINATOR")
        n_factors = input ("how many factors are used?")
        deg = input ("what is the highest degree between factors?")
        fprintf("\n")
        % rows = number of factors, columns = coefficients 
        A = zeros(n_factors, deg+1);

            for rows = 0:n_factors-1
                fprintf("\n")
                disp ( "FACTOR:" + (rows+1))
                for columns = 0:deg
                    A(rows+1, columns+1) = input ("enter coefficient of " + ...
                                                  "the " + columns + " degree: ");
                end
            end
           
        %creates decomposed denominator
        den = [1];
        for i = 0: n_factors-1
            den = conv(den , A(i+1,:));
        end
            
    case 1
        fprintf("\n")
        disp ("NUMERATOR")
        deg = input ("what is the degree of the polinomial? ")
        fprintf("\n")
        num = zeros (1, deg+1);
        for i = 0:deg
            num (i+1) = input ("enter the coefficient of the " + i +... 
                                 " degree:");
        end
        fprintf("\n")
        disp ("DENOMINATOR")
        deg = input ("what is the degree of the polinomial? ")
        fprintf("\n")
        den = zeros (1, deg+1);
        for i = 0:deg
            den (i+1) = input ("enter the coefficient of the " + i +... 
                                 " degree:");
        end

    otherwise
        disp ("ERROR")
end

%creating tf and plots
H = tf (num, den)
subplot(2,1,1)
bode (H)
grid on
subplot(2,1,2)
nyquistplot (H)