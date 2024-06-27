function e = entropy2(dat)
    [r,~] = size(dat);
    e = zeros(r,1);
    for i = 1:r
        e(i) = entropy(dat(i,:));
    end
end