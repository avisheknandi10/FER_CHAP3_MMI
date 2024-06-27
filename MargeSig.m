% Marged Signature
MS = cell(12,1);

MS{1} = TSS;
for i = 2:6
    MS{i} = FTS(:,:,i-1);
end

for i = 7:12
    MS{i} = CDS(:,:,i-6);
end