function J = computeCostMulti(X, y, theta)
%COMPUTECOSTMULTI Compute cost for linear regression with multiple variables
%   J = COMPUTECOSTMULTI(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.

% Vectorized form
main_part = (X * theta - y)' * (X * theta - y);
J = 1/(2*m) * main_part;

% Iterative form (equivalent)
% Compute summation
% for i=1:m
% 	% Compute hypothesis
% 	h = ((X(i,:) * theta) - y(i)).^2; % Take all the columns of row i in X and row i in y (which is a vector)
% 	                                    % We need to compute the transpose of both because theta is a 2x1 and X(i,:) is a 1x2 and the result would be a 2x2!
% 	                                    % Alternatively just swap X and theta
% 	J = J + (h * 1/(2*m));
% end

% =========================================================================

end
