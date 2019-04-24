function edgesDistSeries = distEdges(label,Output_dist)

label(label ~= 0) = 1;
edgesDistance = label .* Output_dist;

%% Set the elments in diagonal line 0. Only for NxN Matrix.
edgesDistance = edgesDistance - diag(diag(edgesDistance));

edgesDistSeries = edgesDistance(edgesDistance ~= 0);
