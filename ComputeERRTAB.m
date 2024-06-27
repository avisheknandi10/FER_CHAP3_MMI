function ERR = ComputeERRTAB(bper)
    [r,~] = size(bper);
    ERR = zeros(r,3);
    for i = 1:r
        FN = bper(i,1);
        FP = bper(i,2);
        TP = bper(i,3);
        TN = bper(i,4);
        
        ERR(i,1) = FP/(FP+TN);
        ERR(i,2) = FN/(FN+TP);
        ERR(i,3) = (FP+FN)/(TP+TN+FN+FP);
    end
end
    
        