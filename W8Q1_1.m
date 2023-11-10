% Values of R0
R0_values = [3, 0.5];

for i = 1:length(R0_values)
    R0 = R0_values(i);

    % Define the transfer function
    num = 1;
    denom = [1, -R0];

    H = tf(num, denom, 1);

    % Plot the pole-zero plot in a new figure
    figure;
    pzmap(H);
    title(['Pole-Zero Plot for R_0 = ' num2str(R0)]);
    grid on;
end

