% Train Using Neural Network
 % Marged Signature
MS = cell(12,1);

MS{1} = hnormalize(TSS);
for i = 2:6
    MS{i} = hnormalize(FTS(:,:,i-1));
end

for i = 7:12
    MS{i} = hnormalize(CDS(:,:,i-6));
end

CFARR = cell(length(MS),2);

for i = 1:length(MS)
    input = MS{i}';
    output = EMO2';

    noTrain = 100;
    ERR = zeros(1,noTrain);
    %netSize = round(sqrt(size(input,1)));

    netSize = 20;

    mx = 1;
    for j = 1:noTrain

        net = patternnet(netSize);
        net = train(net,input,output);
        y = net(input);

        [c,cm,ind,per] = confusion(output,round(y));


        if mx < (1-c)*100

            mx = (1-c)*100;
            best = net;
            disp((1-c)*100)

            bc = c;
            bcm = cm;
            bind = ind;
            bper = per;
            
            CFARR{i,1} = (1-bc)*100;
            CFARR{i,2} = bcm;

        end

    end
    
end
    