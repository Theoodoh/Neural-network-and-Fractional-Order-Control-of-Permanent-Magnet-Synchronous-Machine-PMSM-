I1 = Input1';
T1 = Output1';
I = Input';
T = Output';
net=newff(minmax(I),[3,8,1],{'logsig','tansig','purelin'},'trainlm');
nett=newff(minmax(I1),[3,8,1],{'logsig','tansig','purelin'},'trainlm');

net = init(net);                % Used to initialize the network (weight and biases)
net.trainParam.show = 1;        % The result of error (mse) is shown at each iteration (epoch)
net.trainParam.epochs = 5000;   % Maximum limit of the network training iteration process (epoch)
net.trainParam.goal = 1e-12;    % Stopping criterion based on error (mse) goal
net=train(net,I,T);             % Start training the network

nett = init(nett);                % Used to initialize the network (weight and biases)
nett.trainParam.show = 1;        % The result of error (mse) is shown at each iteration (epoch)
nett.trainParam.epochs = 5000;   % Maximum limit of the network training iteration process (epoch)
nett.trainParam.goal = 1e-12;    % Stopping criterion based on error (mse) goal
nett=train(nett,I1,T1);             % Start training the network
