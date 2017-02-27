load('testtime')

testtimelvlhmc1=log(testtimelvlhmc1)
testtimelvlhmc2=log(testtimelvlhmc2)
testtimelvlmcmc=log(testtimelvlmcmc)
testtimelvlrs=log(testtimelvlrs)
testtimelvlhrs=log(testtimelvlhrs)

figure;
hold on;
X = 1:1:6
mean_hmc1 = mean(testtimelvlhmc1')
mean_hmc2 = mean(testtimelvlhmc2')
mean_mcmc = mean(testtimelvlmcmc')
mean_rs = mean(testtimelvlrs')
mean_hrs = mean(testtimelvlhrs')
plot(X,mean_hmc1,'b.-')
%boxplot(testtimelvlhmc1', 'Notch', 'on', 'Labels', {100, 200, 500, 1000, 3000, 5000},'Colors','b')
plot(X,mean_hmc2,'g*-')
%boxplot(testtimelvlhmc2', 'Notch', 'on', 'Labels', {100, 200, 500, 1000, 3000, 5000},'Colors','g')
plot(X,mean_mcmc,'ys-')
%boxplot(testtimelvlmcmc', 'Notch', 'on', 'Labels', {100, 200, 500, 1000, 3000, 5000},'Colors','y')
plot(X,mean_rs,'ro-')
%boxplot(testtimelvlrs', 'Notch', 'on', 'Labels', {100, 200, 500, 1000, 3000, 5000},'Colors','r')
plot(X,mean_hrs,'c+-')
%boxplot(testtimelvlhrs', 'Notch', 'on', 'Labels', {100, 200, 500, 1000, 3000, 5000},'Colors','c')
legend('HMC1','HMC2','MCMC','RS','HRS')

set(gca, 'XTick', 1:6, 'XTickLabel', {'2.29', '1.94', '1.35', '0.955', '0.84', '0.609'})
xlabel('Level set')
ylabel('log time')
title('Sampling efficiency')
hold off;