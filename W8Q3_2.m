% Given coefficients for the filter
ak = [0.1, 0.15, 0.25, 0.26, 0.34, 0.42, 0.25, 0.2, 0.15, 0.1, 0.1, 0.1];
n = 100; % Length of the sequence

rhos = [0.25, 0.5, 0.75]; % Different values of ρ
num_rhos = length(rhos);

% Generate the Kronecker delta input
input_signal = [1 zeros(1, n - 1)];

% Create figure windows for daily and total infections
figure('Name', 'Daily Infections');
figure('Name', 'Total Infections');

for i = 1:num_rhos
    rho = rhos(i);
    
    % Implement the filter for the specific ρ value
    modified_ak = (1 - rho) * ak;
    output_signal = filter(1, [1, -modified_ak], input_signal);
    
    % Plot the new daily infections for the first 100 days in one figure
    figure(1);
    subplot(num_rhos, 1, i);
    stem(1:n, output_signal(1:n), 'filled', 'LineWidth', 1);
    title(sprintf('ρ = %.2f - Daily Infections', rho));
    xlabel('Days');
    ylabel('New Infections');
    
    % Calculate and plot the total number of infections for n days in another figure
    total_infections = cumsum(output_signal);
    total_infections = total_infections(1:n);
    
    figure(2);
    subplot(num_rhos, 1, i);
    plot(1:n, total_infections, 'LineWidth', 1);
    title(sprintf('ρ = %.2f - Total Infections', rho));
    xlabel('Days');
    ylabel('Total Infections');
end
