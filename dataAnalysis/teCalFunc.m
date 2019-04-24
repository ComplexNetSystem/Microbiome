function Output = teCalFunc(x)

npoints = size(x,1); % number of data points
ntotal  = size(x,2); % number of variables

% If you use Matlab, choose using the Statistics toolbox (=1) or not (=0):
options.useStatistics = 1;

% Data curation step:
options.correctOutliers = 1; % correct outliers (=1) or not (=0)

% Entropic parameter:
options.q = 1; % q = 1 (Boltzmann-Gibbs entropy) | q > 1 (Tsallis entropy) 

% Normalization of the mutual information (MI):
options.MItype = 'MI'; %'MI' | 'MImichaels' | 'MIlinfoot' | 'MIstudholme'  

% Adaptive estimation of MI -> Partition the joint space of X,Y so that the
% fraction of occupied bins with >= 5 points is at least = options.fraction:
options.fraction  = 0.1*(log10(npoints)-1); 
if options.fraction < 0.01, options.fraction = 0.01; end %lower bound=0.01

% Maximum time lag considered (>= 0):
options.taumax = 10;
if options.taumax > (npoints/2 -1)
    options.taumax = floor(npoints/2);
    fprintf(1,'\n Warning: the maximum time lag you have requested is too large for the number of data points.'); 
    fprintf(1,'\n => Setting the max. time lag to %d',options.taumax); 
end

% Number of entropy reduction (ERT) rounds to carry out (0, 1, 2, or 3):
options.ert_crit = 2;  

% Entropy reduction threshold. Enter a number between 0.0 and 0.2 to fix it
% manually, or enter 1 to use a value obtained from the data:
options.threshold = 1;

% Plot MI arrays (=1) or not (=0):
options.plotMI = 0;


%--------------------------------------------------------------------------
% RUN MIDER

if options.useStatistics == 1

    % Check if there are missing values in the input data:
    [row, col] = find(isnan(x));

    % If there are missing values, use TSR to complete the data set:
    if numel(row) ~= 0
        fprintf(1,'\n Warning: there are %d missing values in the input data file.',numel(row)/2);
        x = TSR(x);
        fprintf(1,'\n The missing values have been replaced with new data using the TSR method.');
    end

    % Detect possible outliers:
    [xmd,ol] = OUTLIERS(x);
    if numel(ol) ~= 0
        fprintf(1,'\n Warning: %d outlier(s) detected in the data file.',numel(ol)/2);
        fprintf(1,'\n Row(s) and column(s) of the outliers:\n');
        for i=1:numel(ol)/2
            disp(ol(i,:));
        end
        % Correct outliers, if that option has been selected:
        if options.correctOutliers == 1        
            x = TSR(xmd);
            fprintf(1,' The outliers have been replaced with new data generated with the TSR method.');
        else
            fprintf(1,' You have selected not to correct outliers.');
            fprintf(1,'\n Data points detected as outliers will be used without further processing.');
            fprintf(1,'\n If you prefer to replace them by adequate values, set options.correctOutliers = 1.');
        end
    end
    
    % Run MIDER in Matlab/Octave:
    Output = mider(x,options);

else
        
    fprintf(1,'\n You have chosen not to use functions from the Statistics toolbox.');
    fprintf(1,'\n Hence MIDER will run with limited capabilities (no data curation nor visual output).');
    fprintf(1,'\n If you have installed the Statistics toolbox and want to use it, set options.useStatistics = 1;');
    
    % Run MIDER in Matlab/Octave:
    Output = mider(x,options);

end

