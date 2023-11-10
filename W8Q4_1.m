% Parameters
R_0 = 1.15;
K = 1e6; % Population size
n = 100;

% First-order model parameters
ak = [0.1, 0.15, 0.25, 0.26, 0.34, 0.42, 0.25, 0.2, 0.15, 0.1, 0.1, 0.1];
rho = 1 - 1/R_0; % Social distancing factor for the first-order model

% Logistic function
t = 1:n;
logistic_infections = K ./ (1 + (K * (R_0 - 1) - R_0) * R_0.^-(t));

% First-order model - Cumulative infections
input_signal = [1 zeros(1, n - 1)];
modified_ak = (1 - rho) * ak;
output_signal = filter(1, [1, -modified_ak], input_signal);
first_order_infections = cumsum(output_signal);

% Plotting total infections for comparison
figure;
plot(t, first_order_infections, 'b', t, logistic_infections, 'r--', 'LineWidth', 2);
title('Total Infections - First Order Model vs Logistic Evolution');
xlabel('Days');
ylabel('Total Infections');
legend('First Order Model', 'Logistic Evolution (R_0 = 1.15)', 'Location', 'northwest');
