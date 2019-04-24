function H = calShannonEntropy(varData,p)

numOfVar = size(varData,2); H = zeros(numOfVar,1);
for i = 1:numOfVar
    [pAxis,pPdenf] = plpdf_Parameter_noFig((varData(:,i))',p);
    for j = 1:length(pPdenf)
        if pPdenf(j) == 0
            pdf_cal(j) = 0;    %% -p * log(p)  calculation
        else
            pdf_cal(j) = (-1) * pPdenf(j) * log2(pPdenf(j)); %% Unit --> bit
        end
    end
    H(i) = sum(pdf_cal);   
end
