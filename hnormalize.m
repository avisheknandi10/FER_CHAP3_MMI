function nData = hnormalize(Data)
    nData = zeros(size(Data));
    for i = 1:size(Data,2)
        %normalize rows
        col = Data(:,i);
        mx = max(col);
        mn = min(col);
        nData(:,i) = (col-mn)/(mx-mn);  
    end
        
        