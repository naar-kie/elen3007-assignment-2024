%%%%%%%%%Estimating alpha using Maximum Likelyhood Solution%%%%%%%%%%%%
%numbat24.04%
% (which estimates the mean of the data)

% Load the data from BayesData.mat
load('BayesData.mat');

% Given y-position (beta)
beta = 4.5;

% Define the log-likelihood function so that product becomes a sum
log_likelihood = @(alpha) sum(log(beta ./ (pi * (beta^2 + (x - alpha).^2))));

% Find the alpha that maximizes the log-likelihood, 
% use fminsearch to minimize the negative log-likelihood, (equivalent to
% maximizing the likelihood)
alpha_mle = fminsearch(@(alpha) -log_likelihood(alpha), mean(x));

% Display the MLE result
disp(['Maximum Likelihood Estimate for alpha: ', num2str(alpha_mle)]);
%% alpha = 7.2287 %%
