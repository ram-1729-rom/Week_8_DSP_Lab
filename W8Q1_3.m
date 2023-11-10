R0 = 2.5;
initialInfections = 1;
targetInfections = 1e6;

y = zeros(1, targetInfections);
y(1) = initialInfections;

for n = 2:targetInfections
    y(n) = 1 + R0 * y(n-1);
    
    if y(n) >= targetInfections
        fprintf('The target of 1 million infections is reached on day %d.\n', n-1);
        break;
    end
end

figure;
plot(0:n-1, y(1:n));
xlabel('Days');
ylabel('New Daily Infections');
title('Epidemic Curve');
grid on;
