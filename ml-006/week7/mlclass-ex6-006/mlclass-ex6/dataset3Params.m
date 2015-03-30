function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
threshold = 10;
cur_sigma = 0.1;
cur_C = 0.1;
cur_err = inf;
min_err = inf;
while cur_sigma < threshold
	while cur_C < threshold
		cur_model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
		predictions = svmPredict(cur_model, Xval);
		cur_err = mean(double(predictions ~= yval));
		if cur_err < min_err
			min_err = cur_err;
			C = cur_C;
			sigma = cur_sigma;
		end
		cur_C *= 2;
	end
	cur_sigma *= 2;
end




% =========================================================================

end
