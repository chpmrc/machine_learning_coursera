function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%
% By default each point has inf distance from the centroids

m = size(X,1);
for i=1:m
	% disp('Processing point: '), disp(i);
	% Find the distance from each centroid and store the min 
	min_dist = inf;
	min_dist_centroid = 0;
	for j=1:K
		d = norm(X(i, :) - centroids(j, :)) ^ 2;
		% disp('Distance from centroid: '), disp(j), disp(' is '), disp(d);
		if d < min_dist
			min_dist = d;
			min_dist_centroid = j;
		end
		% disp('Best centroid found: '), disp(min_dist_centroid);
		% disp('')
	end
	% Assign point i to the centroid with min distance
	idx(i) = min_dist_centroid;
end

% =============================================================

end

