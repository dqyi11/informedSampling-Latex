datasetSize = 50;
maxtimes = zeros(datasetSize,1);
minvals = zeros(datasetSize,1);
for i = 0:1:datasetSize-1
  hmc_filename = sprintf('data/simple_HMC_%d.csv', i);
  hnr_filename = sprintf('data/simple_HNR_%d.csv', i);
  rs_filename = sprintf('data/simple_RS_%d.csv', i);
  hrs_filename = sprintf('data/simple_HRS_%d.csv', i);
  
  HMC = csvread(hmc_filename);
  HNR = csvread(hnr_filename);
  RS = csvread(rs_filename);
  HRS = csvread(hrs_filename);
  
  allTime = vertcat(HMC(:,1), HNR(:,1), RS(:,1), HRS(:,1));
  allVal = vertcat(HMC(:,2), HNR(:,2), RS(:,2), HRS(:,2));
  maxtimes(i+1,1) = max(allTime);
  minvals(i+1,1) = min(allVal);
end

maxT = max(maxtimes);
minVal = min(minvals);

stepNum = 30;
HMC1 = zeros(datasetSize, stepNum+1);
HNR1 = zeros(datasetSize, stepNum+1);
RS1 = zeros(datasetSize, stepNum+1);
HRS1 = zeros(datasetSize, stepNum+1);

stepSize = maxT / stepNum;
T = 0:stepSize:maxT;

for i = 0:1:datasetSize-1
  hmc_filename = sprintf('data/simple_HMC_%d.csv', i);
  hnr_filename = sprintf('data/simple_HNR_%d.csv', i);
  rs_filename = sprintf('data/simple_RS_%d.csv', i);
  hrs_filename = sprintf('data/simple_HRS_%d.csv', i);
  
  HMC = csvread(hmc_filename);
  HNR = csvread(hnr_filename);
  RS = csvread(rs_filename);
  HRS = csvread(hrs_filename);
  
  HMC(:,2) = HMC(:,2)./minVal;
  HNR(:,2) = HNR(:,2)./minVal;
  RS(:,2) = RS(:,2)./minVal;
  HRS(:,2) = HRS(:,2)./minVal;

  HMC_tmp = resample_data(HMC(:,2), HMC(:,1), T');
  HNR_tmp = resample_data(HNR(:,2), HNR(:,1), T');
  RS_tmp = resample_data(RS(:,2), RS(:,1), T');
  HRS_tmp = resample_data(HRS(:,2), HRS(:,1), T');
  HMC1(i+1,:) = HMC_tmp;
  HNR1(i+1,:) = HNR_tmp;
  RS1(i+1,:) = RS_tmp;
  HRS1(i+1,:) = HRS_tmp;
end

distT = T;
figure(100);
hold on;
tmpMean = mean(HMC1,1);
tmpVar = var(HMC1,1,1);
% x = 1:10:100;
% y = [20 30 45 40 60 65 80 75 95 90];
% err = 8*ones(size(y));
% errorbar(x,y,err)


errorbar(distT, mean(HMC1,1), var(HMC1,1,1)', 'r');
errorbar(distT, mean(HNR1,1), var(HNR1,1,1), 'g');
errorbar(distT, mean(RS1,1), var(RS1,1,1), 'b');
errorbar(distT, mean(HRS1,1), var(HRS1,1,1), 'c');
%plot(distT, mean(HMC1,1),'-.r');
%plot(distT, mean(HNR1,1), '.-g');
%plot(distT, mean(RS1,1), '.-b');
%plot(distT, mean(HRS1,1), '.-c');
legend('HMC', 'HNR', 'RS', 'HRS');
xlabel('Time - ms');
ylabel('Ratio to minimum');
hold off;