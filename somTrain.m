net = selforgmap([2 3]);
net = train(net,TSS');
view(net)
y = net(TSS');
classes = vec2ind(y);