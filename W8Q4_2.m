R_0 = 1.15;
K = 1e6; 
n = 100;

% Logistic function
t = 1:n;
logistic_infections = K ./ (1 + (K * (R_0 - 1) - R_0) * R_0.^-(t));

% D1(z) = 1 - z^-1 (First Derivative)
D1 = [1, -1];

% D1 filter to approximate the first derivative
first_derivative = filter(D1, 1, logistic_infections);

% Global maximum of the first derivative
[~, max_index] = max(first_derivative);
inflection_point_1 = max_index - 1;  % Adjust index

% D2(z) = 1 - 2z^-1 + z^-2 (Second Derivative)
D2 = [1, -2, 1];

% D2 filter to approximate the second derivative
second_derivative = filter(D2, 1, logistic_infections);

% Find zero-crossing of the second derivative
zero_crossing_indices = find(diff(sign(second_derivative)) < 0, 1, 'first');
inflection_point_2 = zero_crossing_indices; 

figure;
plot(t, logistic_infections, 'b', t, first_derivative, 'r--', t, second_derivative, 'g:', 'LineWidth', 1.5);
hold on;
plot(inflection_point_1, logistic_infections(inflection_point_1), 'ro', inflection_point_2, logistic_infections(inflection_point_2), 'go', 'MarkerSize', 8);
title('Logistic Function and Derivatives');
xlabel('Days');
ylabel('Total Infections / Derivatives');
legend('Logistic Function', 'First Derivative (D1)', 'Second Derivative (D2)', 'Inflection Point (D1)', 'Inflection Point (D2)', 'Location', 'northwest');
