function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));
lambda = 150;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

n = size(theta);
predictions = zeros(m, 1); % Cache predictions for faster exec.
reg_term = 0; % Regularization term

J_sum = 0; % Main summation in cost function
for i=1:m
	val = sigmoid(X(i, :) * theta);
	predictions(i, :) = val;
	J_sum += -y(i) * log(predictions(i, :)) - (1 - y(i)) * log(1 - predictions(i, :));
end
for j=2:n % 2 because theta_0 (which in octave is in 1) is not included
	reg_term += theta(j) .^ 2;
end
reg_term *= lambda / (2 * m);

J = 1/m * J_sum + reg_term;

% How to vectorize this?
for j=1:n
	summation = 0;
	for i=1:m
		summation += (predictions(i) - y(i)) * X(i, j);
	end
	grad(j) = 1/m * summation;
	if j > 1
		grad(j) += (lambda/m) * theta(j);
	end
end


% =============================================================

end
