function cds = centroid_distance_signature(data)
    len = length(data);
    % Centroid Distance Signature
    cds = zeros(nchoosek(len,3),6);
 
    m = 1;

    for i = 1:len
        for j = i+1:len
            for k = j+1:len
                
                x = data(i,:);
                y = data(j,:);
                z = data(k,:);
                
                [~,dist,slope] = center2(x,y,z);
%                 X = pos(1,:);
%                 Y = pos(2,:);
%                 Z = X - Y;
%                 D1 = Z(1);
%                 D2 = Z(2);
                %I = atan(D2/D1);
                
                cds(m,:) = [dist,slope]; 
                
                m = m + 1;

            end
        end
    end
end