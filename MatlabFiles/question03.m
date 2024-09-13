% Parameters for the PDF distribution
alpha = 4;  % Location parameter (peak position)
beta = 2;   % Scale parameter (determines the width)

% Generate x values
x = linspace(-10, 10, 1000);

% PDF distribution function
pdf = @(x, alpha, beta) beta ./ (pi * (beta^2 + (x - alpha).^2));

% Calculate y values
y = pdf(x, alpha, beta);

% Plot the distribution
figure;
plot(x, y, 'b', 'LineWidth', 2);
hold on;

% Plot the half maximum line
y_half_max = max(y) / 2;
plot(x, y_half_max * ones(size(x)), 'r--', 'LineWidth', 1.5);

% Plot the FWHM lines
plot([alpha - beta, alpha - beta], [0, y_half_max], 'g--', 'LineWidth', 1.5);
plot([alpha + beta, alpha + beta], [0, y_half_max], 'g--', 'LineWidth', 1.5);

% Add labels and legend
xlabel('x');
ylabel('p(x)');
title('PDF Distribution');
legend('PDF Distribution', 'Half Maximum', 'Width at Half Max');
hold off;

