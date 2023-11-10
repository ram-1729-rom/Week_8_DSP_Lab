R0 = 2.5;
n_max = 20;

y = zeros(1, n_max + 1);
y(1) = 1; % Initial infection

% Initialize total infections array
total_infections = zeros(1, n_max + 1);

for n = 2:n_max + 1
    y(n) = R0 * y(n - 1);
    total_infections(n) = sum(y(1:n)); % Cumulative sum for total infections
end

figure;
subplot(2, 1, 1);
stem(0:n_max, y, 'b');
title('New Daily Infections Over Time');
xlabel('Day (n)');
ylabel('Number of Newly Infected People');
grid on;

subplot(2, 1, 2);
stem(0:n_max, total_infections, 'r');
title('Total Infections Over Time');
xlabel('Day (n)');
ylabel('Total Number of Infections');
grid on;
