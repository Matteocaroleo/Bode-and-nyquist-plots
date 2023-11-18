


% if time costant representation in used, refer to this section 
% coefficients of polinomial inside first parentheses and so forth 
first_factor = [1,-1] 
second_factor = [1, -1] 
%... (add factors if needed)
den_t_cost = conv(first_factor, second_factor)
num_t_cost = [1]

%FOR NON TIME CONSTANTS
%
% coefficients of s polinomial numerator
% (left to right are descending degrees of s)
num = 40*[3.3,1];
% coefficients of s polinomial denominator
% (left to right are descending degrees of s)
den = [0.001,0.11,1,0,0];

% creation of transfer function
H = tf (num, den);
G = tf(num_t_cost, den_t_cost)

% plot graphs
subplot(2,1,1)
bode (G)
grid on
subplot(2,1,2)
nyquistplot (G)
