%%%%%%%%%Bayesian Position Inference Scheme%%%%%%%%%%%%
%numbat24.04%
%
% Main function to execute the Bayesian inference and plot results
function BayesianPositionInferenceScheme()
    load('BayesData.mat');

    % Given beta value and alpha range
    beta = 4.5;
    alpha_values = linspace(-50, 50, 1000);

    % Number of measurements to evaluate the posterior
    N_values = [1, 2, 5, 30];

    % Case 1: Points Inside the Box (0 <= x <= 10)
    x_inside_box = x(x >= 0 & x <= 10);
    plot_posterior(x_inside_box, N_values, alpha_values, beta, ...
        'Posterior for Points Inside the Box (0 <= x <= 10)');

    % Case 2: All Points (No Restrictions)
    x_all_points = x; 
    plot_posterior(x_all_points, N_values, alpha_values, beta, 'Posterior for All Points');
end

% Function to calculate the posterior for a given dataset and N points
function posterior_values = calculate_posterior(data, N, alpha_values, beta)
    posterior_values = zeros(size(alpha_values)); % Initialize posterior array
    for i = 1:length(alpha_values)
        alpha = alpha_values(i); % Current alpha value
        likelihood = 1; % Initialize likelihood as 1
        for k = 1:min(N, length(data))
            x_k_val = data(k);
            % Calculate the likelihood for each x_k_val
            likelihood = likelihood * (beta / (pi * (beta^2 + (x_k_val - alpha)^2)));
        end
        posterior_values(i) = likelihood; % Store posterior value
    end
    % Normalize the posterior to sum to 1
    posterior_values = posterior_values / sum(posterior_values);
end

% Function to plot the posterior for different N values
function plot_posterior(data, N_values, alpha_values, beta, title_text)
    figure; % Create new figure
    hold on;
    for N = N_values
        % Calculate posterior for the current N
        posterior_values = calculate_posterior(data, N, alpha_values, beta);
        % Plot the posterior distribution for this N
        plot(alpha_values, posterior_values, 'DisplayName', ['N = ', num2str(N)]);
    end
    xlabel('Alpha');
    ylabel('Posterior Probability');
    title(title_text);
    legend show;
    grid on;
    hold off;
end
