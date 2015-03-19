function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%

pos = find(y == 1); % Positive indices
neg = find(y == 0); % Negative indices

% Plot only the indices we want
plot(X(pos, 1), X(pos, 2), 'k+', 'LineWidth', 2)
plot(X(neg, 1), X(neg, 2), 'ko', 'LineWidth', 2)

% My shitty implementation below! Yay!

% pos = zeros(size(X, 1), 2); % All X pairs [x1, x2] whose y = 1
% neg = zeros(size(X, 1), 2); % All X pairs [x1, x2] whose y = 0

% pos_i = 1;
% neg_i = 1;

% for i=1:size(X,1) % Scan all rows
% 	if y(i) == 1 % Positive
% 		pos(pos_i, :) = X(i, :);
% 		pos_i = pos_i + 1;
% 	else % Positive
% 		neg(neg_i, :) = X(i, :);
% 		neg_i = neg_i + 1;
% 	end
% end

% [r, c] = find(pos); % Find last non-zero pair's row
% idx = max(r);
% pos = pos(1:idx, :);
% [r, c] = find(neg);
% idx = max(r);
% neg = neg(1:idx, :);

% plot(pos(:, 1), pos(:, 2), 'k+', 'LineWidth', 2);
% plot(neg(:, 1), neg(:, 2), 'ko', 'LineWidth', 2);



% =========================================================================



hold off;

end
