function fts = fuzzy_tringle_signature(pts)

    len = length(pts);
    fts = zeros(nchoosek(len,3),5);
    
    m = 1;
    for i = 1:len
        for j = i+1:len
            for k = j+1:len
                x = pts(i,:);
                y = pts(j,:);
                z = pts(k,:);
                
                vertices = [x;y;z];
                angels = real(TRIangles(vertices));
                
                angels = sort(angels,'descend');
                
                
                A = angels(1);
                B = angels(2);
                C = angels(3);
                
                
                % fuzzy membership
                I = 1 - (1/60)*min(A-B,B-C);
                R = 1 - (1/90)*abs(A-90);
                E = 1 - (1/180)*(A-C);
                IR = min(I,R);
                T = 1 - max([I,R,E]);
               
               fuzzyMem = [I,R,E,IR,T];
             
               fts(m,:) = fuzzyMem;
               m = m + 1;
                
            end
        end
    end
end