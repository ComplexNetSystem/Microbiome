function [X] = groupAnalysis_TE(X)

varName = fieldnames(X);
% numOfVar = length(varName);

for i = 1:length(varName)
    if strfind(varName{i},'threshold')
        thres = eval(['X.',varName{i}]);
        if i == 1
            floor_thr = min(thres);threshold_N = thres(thres < 0);
            upper_thr = max(thres);threshold_P = thres(thres >= 0);
        else
            if min(eval(['X.',varName{i}])) < floor_thr
                threshold_N = thres(thres < 0);
            end
            if max(eval(['X.',varName{i}])) > upper_thr
                threshold_P = thres(thres >= 0);
            end
        end
        X.threshold = [threshold_N,threshold_P];
    elseif strfind(varName{i},'rawTE')
        rawTE = eval(['X.',varName{i}]);
        if i == 1
            X.group_rawTE = rawTE;
        else
            
        end
        
    elseif strfind(varName{i},'absTE')
        
        
    end        
end
