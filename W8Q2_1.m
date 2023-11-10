% Given coefficients for the filter
ak = [0.1, 0.15, 0.25, 0.26, 0.34, 0.42, 0.25, 0.2, 0.15, 0.1, 0.1, 0.1];

% Length of the sequence (n days)
n = 100;

% Kronecker delta input signal
input_signal = [1 zeros(1, n - 1)]; % Kronecker delta at day 1

% Implement the filter
output_signal = filter(1, [1, -ak], input_signal);

% Plot the new daily infections
figure;
plot(1:n, output_signal(1:n), 'b');
xlabel('Days');
ylabel('New Daily Infections');
title('New Daily Infections for the First 100 Days');

% Calculate the total number of infections using an integrator filter
total_infections = cumsum(output_signal);
total_infections = total_infections(1:n); % Consider only the first n days

% Plot the total number of infections over n days
figure;
plot(1:n, total_infections, 'r');
xlabel('Days');
ylabel('Total Infections');
title('Total Number of Infections for the First 100 Days');

