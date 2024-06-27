function tss = triangle_side_signature(data)
    len = length(data);
    % Centroid Distance Signature
    tss = zeros(nchoosek(len,3),11);
 
    m = 1;

    for i = 1:len
        for j = i+1:len
            for k = j+1:len
                
                x = data(i,:);
                y = data(j,:);
                z = data(k,:);
                
                a = sqrt(sum((x - y).^2));
                b = sqrt(sum((y - z).^2));
                c = sqrt(sum((z - x).^2));
                
                d1 = max([a,b,c])/(a+b+c);
                d2 = min([a,b,c])/(a+b+c);
                d3 = min([a,b,c])/max([a,b,c]);
                d4 = (max([a,b,c])-min([a,b,c]))/(a+b+c);
                d5 = (max([a,b,c])+min([a,b,c]))/(a+b+c);
                d6 = (max([a,b,c])-min([a,b,c]))/(max([a,b,c])+min([a,b,c]));
                d7 = max([a,b,c])/(max([a,b,c])+min([a,b,c]));
                d8 = min([a,b,c])/(max([a,b,c])+min([a,b,c]));
                d9 = min([a,b,c])/(max([a,b,c])-min([a,b,c]));
                d10 = min([a,b,c])/((a+b+c)-min([a,b,c]));
                d11 = max([a,b,c])/((a+b+c)-min([a,b,c]));
               
                tss(m,:) = [d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11];
                
                m = m + 1;

            end
        end
    end
end