% CDS2 = zeros(size(CDS));
% for i = 1:3
%     CDS2(:,:,i) = hnormalize(CDS(:,:,i));
% end
% DATA = reshape(CDS2,[327,1330*6]);
DATA = TSS2(:,:,2);
input = DATA';
output = EMO2';

noTrain = 15;

netSize = 20;

NFOLD = zeros(noTrain,4);

mx = 1;
for i = 1:noTrain
    
    net = patternnet(netSize);
    [net,tr] = train(net,input,output);
    
    % Training Accuracy
    indx = tr.trainInd;
    y = net(input(:,indx));
    trc = confusion(output(:,indx),round(y));
    
    % Testing Accuracy
    indx = tr.testInd;
    y = net(input(:,indx));
    tsc = confusion(output(:,indx),round(y));
    
    % Validation Accuracy
    indx = tr.valInd;
    y = net(input(:,indx));
    vc = confusion(output(:,indx),round(y));
    
    % Total Accuracy
    y = net(input);
    [c,cm,ind,per] = confusion(output,round(y));
    
    NFOLD(i,:) = [trc,tsc,vc,c];
    
    
    if mx < (1-c)*100
        
        mx = (1-c)*100;
        bestNet = net;
        bestTr = tr;
        disp((1-c)*100)
        
        bc = c;
        bcm = cm;
        bind = ind;
        bper = per;
        
    end
    
   
end

% Training Accuracy
indx = bestTr.trainInd;
y = bestNet(input(:,indx));
[tc,tcm] = confusion(output(:,indx),round(y));

% Testing Accuracy
indx = bestTr.testInd;
y = bestNet(input(:,indx));
[tsc,tscm] = confusion(output(:,indx),round(y));

% Validation Accuracy
indx = bestTr.valInd;
y = bestNet(input(:,indx));
[vc,vcm] = confusion(output(:,indx),round(y));

% Total Accuracy
y = bestNet(input);
[c,cm] = confusion(output,round(y));

% All errors
ERR = [tc,tsc,vc,c];
ACC = (1-ERR)*100;
NFOLD = (1-NFOLD)*100;

disp(ACC)
save('bcm.mat','bcm','bper','ACC','NFOLD');

    