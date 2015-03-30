function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));
% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%
h = X * theta;
regterm = (lambda/(2*m)) * sum(theta(2:end) .^ 2);
J = ((1/(2*m)) * sum((h - y) .^ 2)) + regterm;

grad(1,:) = (1/m) * sum(h - y); % x(i,j) is 1, the intercept term
errors = (h - y);
grad_examples = X(:, 2:end);
summation = errors' * grad_examples;
% size(summation)
% size(theta(2:end, :))
grad(2:end,:) = (1/m) * summation' + (lambda/m) * theta(2:end, :);


% =========================================================================

grad = grad(:);

end
