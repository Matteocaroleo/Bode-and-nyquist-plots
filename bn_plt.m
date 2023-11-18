disp ("This program calculates both bode and nyquist plot form a transfer function")
choice = input ("Enter 0 if transfer function is factorized or 1 if decomposed")

switch choice
    case 0
        disp ("NUMERATOR")
        n_factors = input ("how many factors are used?")
        deg = input ("what is the highest degree between factors?")
        % rows = number of factors, columns = coefficients 
        A = zeros(n_factors, deg+1)

            for rows = 0:n_factors-1
                for columns = 0:deg
                    disp (rows)
                    disp ( " FACTOR: ")
                    disp ("enter coefficient of")
                    disp (columns)
                    A(rows+1, columns+1) = input ("degree:")
                end
            end
           
        %creates decomposed numerator
        num = [1]
        for i = 0: n_factors-1
            num = conv(num , A(i,:))
        end
        
        disp = ("DENOMINATOR")
        n_factors = input ("how many factors are used?")

        deg = input ("what is the highest degree between factors?")
        % rows = number of factors, columns = coefficients 
        A = zeros(n_factors, deg+1)

            for rows = 0:n_factors-1
                for columns = 0:deg
                    disp (rows)
                    disp ( " FACTOR: ")
                    disp ("enter coefficient of")
                    disp (columns)
                    A(rows+1, columns+1) = input ("degree:")
                end
            end
           
        %creates decomposed denominator
        for i = 0: n_factors-1
            den = conv(den , A(i,:))
        end
            
    case 1
        disp ("NUMERATOR")
        deg = input ("what is the degree of the polinomial? ")
        num = zeros (1, deg+1)
        for i = 0:deg
            disp ("enter the coefficient of the")
            disp (i)
            num (i+1) = input ("degree:")
        end

        disp ("DENOMINATOR")
        deg = input ("what is the degree of the polinomial? ")
        den = zeros (1, deg+1)
        for i = 0:deg
            disp ("enter the coefficient of the")
            disp (i)
            den (i+1) = input ("degree:")
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

%{ FOR NON TIME CONSTANTS
%{coefficients of s polinomial numerator
% (left to right are descending degrees of s)
%num = [1];
% coefficients of s polinomial denominator
% (left to right are descending degrees of s)
%den = [6 , -5, 1];

% creation of transfer function
%H = tf (num, den);
%G = tf(num_t_cost, den_t_cost)
  
% plot graphs

%creates transfer function and bode plot
 %       H = tf (num,den)
   
  %    bode(H