function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

% You need to set these values correctly
X_norm = X;
mu = zeros(1, size(X, 2)); % mean
sigma = zeros(1, size(X, 2)); % standard deviation

% ====================== YOUR CODE HERE ======================
% Instructions: First, for each feature dimension, compute the mean
%               of the feature and subtract it from the dataset,
%               storing the mean value in mu. Next, compute the 
%               standard deviation of each feature and divide
%               each feature by it's standard deviation, storing
%               the standard deviation in sigma. 
%
%               Note that X is a matrix where each column is a 
%               feature and each row is an example. You need 
%               to perform the normalization separately for 
%               each feature. 
%
% Hint: You might find the 'mean' and 'std' functions useful.
%       

% WARNING: x0 = 1 columnt has not been added yet!
for f=1:size(X_norm,2) % For each feature compute the mean and the std
	mu(1, f) = mean(X_norm(:, f));
	sigma(1, f) = std(X_norm(:, f));
	X_norm(:, f) = (X_norm(:, f) .- mu(1, f)) ./ sigma(1, f);
end


% ============================================================

end
