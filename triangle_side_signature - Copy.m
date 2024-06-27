function tss = triangle_side_signature(data)
    len = length(data);
    % Centroid Distance Signature
    tss = zeros(nchoosek(len,3),1);
 
    m = 1;

    for i = 1:len
        for j = i+1:len
            for k = j+1:len
                
                x = data(i,:);
                y = data(j,:);
                z = data(k,:);
                
                a = sum(sqrt((x - y).^2));
                b = sum(sqrt((y - z).^2));
                c = sum(sqrt((z - x).^2));
                
                tss(m,:) = (max([a,b,c]) - min([a,b,c]))/(a+b+c);
                
                m = m + 1;

            end
        end
    end
end