set(groot,'DefaultFigureRenderer','painters')

figure;
hold on;
X = 1:1:6
mean_hmc1 = mean(testtimesnhmc1')
mean_hmc2 = mean(testtimesnhmc2')
mean_mcmc = mean(testtimesnmcmc')
mean_rs = mean(testtimesnrs')
mean_hrs = mean(testtimesnhrs')
plot(X,mean_hmc1,'b.-')
%boxplot(testtimesnhmc1', 'Notch', 'on', 'Labels', {100, 200, 500, 1000, 3000, 5000},'Colors','b')
plot(X,mean_hmc2,'g*-')
%boxplot(testtimesnhmc2', 'Notch', 'on', 'Labels', {100, 200, 500, 1000, 3000, 5000},'Colors','g')
plot(X,mean_mcmc,'ys-')
%boxplot(testtimesnmcmc', 'Notch', 'on', 'Labels', {100, 200, 500, 1000, 3000, 5000},'Colors','y')
plot(X,mean_rs,'ro-')
%boxplot(testtimesnrs', 'Notch', 'on', 'Labels', {100, 200, 500, 1000, 3000, 5000},'Colors','r')
plot(X,mean_hrs,'c+-')
%boxplot(testtimesnhrs', 'Notch', 'on', 'Labels', {100, 200, 500, 1000, 3000, 5000},'Colors','c')
legend('HMC1','HMC2','MCMC','RS','HRS')
xlabel('Number of samples')
ylabel('ms')
title('Sampling efficiency')
hold off;