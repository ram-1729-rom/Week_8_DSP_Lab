% Below data is the data from 1st April 2020 to 12th April 2020
new_cases = [424, 486, 579, 609, 573, 565, 813, 854, 758, 1031];

% Choosing the 5th day as a reference for estimation
reference_day = 5;
growth_rate = new_cases(reference_day) / new_cases(reference_day - 1);

R0 = growth_rate + 1;

fprintf('Estimated R0 using the one-point method: %.2f\n', R0);
