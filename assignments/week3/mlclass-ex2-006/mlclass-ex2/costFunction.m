function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta
%
n = size(theta);
predictions = zeros(m, 1); % Cache predictions for faster exec.
% size(predictions)
% size(theta)

J_sum = 0;
for i=1:m
	val = sigmoid(X(i, :) * theta);
	predictions(i, :) = val;
	J_sum += -y(i) * log(predictions(i, :)) - (1 - y(i)) * log(1 - predictions(i, :));
end
J = 1/m * J_sum;

% How to vectorize this?
for j=1:n
	summation = 0;
	for i=1:m
		summation += (predictions(i) - y(i)) * X(i, j);
	end
	grad(j) = 1/m * summation;
end


% =============================================================

end
