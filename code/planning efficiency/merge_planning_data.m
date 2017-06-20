datasetSize = 12;
maxtimes = zeros(datasetSize);
for i = 0:1:12
  hmc_filename = sprintf('data/simple_HMC_%d.csv', i);
  hnr_filename = bsprintf('data/simple_HNR_%d.csv', i);
  rs_filename = sprintf('data/simple_RS_%d.csv', i);
  hrs_filename = sprintf('data/simple_HRS_%d.csv', i);
  
  HMC = csvread(hmc_filename);
  HNR = csvread(hnr_filename);
  RS = csvread(rs_filename);
  HRS = csvread(hrs_filename);
  
  allTime = vertcat(HMC(:,1), HNR(:,1), RS(:,1), HRS(:,1));
  
  maxtimes(i+1) = max(allTime);
end

maxT = max(maxtimes);

stepNum = 50;
HMC1 = zeros(stepNum+1, datasetSize);
HNR1 = zeros(stepNum+1, datasetSize);
RS1 = zeros(stepNum+1, datasetSize);
HRS1 = zeros(stepNum+1, datasetSize);

stepSize = log(maxT) / stepNum;
T = [0:stepSize:log(maxT)];
T = exp(T);

for i = 0:1:12
  hmc_filename = sprintf('data/simple_HMC_%d.csv', i);
  hnr_filename = sprintf('data/simple_HNR_%d.csv', i);
  rs_filename = sprintf('data/simple_RS_%d.csv', i);
  hrs_filename = sprintf('data/simple_HRS_%d.csv', i);
  
  HMC = csvread(hmc_filename);
  HNR = csvread(hnr_filename);
  RS = csvread(rs_filename);
  HRS = csvread(hrs_filename);

  
  HMC1(:,i+1) = resample_data(HMC(:,2), HMC(:,1), T');
  HNR1(:,i+1) = resample_data(HNR(:,2), HNR(:,1), T'); 
  RS1(:,i+1) = resample_data(RS(:,2), RS(:,1), T');
  HRS1(:,i+1) = resample_data(HRS(:,2), HRS(:,1), T');
end

minVals = zeros(4,1);
minVals(1,1) = min(min(HMC1));
minVals(2,1) = min(min(HNR1));
minVals(3,1) = min(min(RS1));
minVals(4,1) = min(min(HRS1));
minVal = min(minVals);

disT = log(T);
  
figure;
hold on;
errorbar(disT, mean((HMC1./minVal),2), var((HMC1./minVal),1,2), 'r');
errorbar(disT, mean((HNR1./minVal),2), var((HNR1./minVal),1,2), 'g');
errorbar(disT, mean((RS1./minVal),2), var((RS1./minVal),1,2), 'b');
errorbar(disT, mean((HRS1./minVal),2), var((HRS1./minVal),1,2), 'c');
plot(disT, mean((HMC1./minVal),2),'-.r');
plot(disT, mean((HNR1./minVal),2), '.-g');
plot(disT, mean((RS1./minVal),2), '.-b');
plot(disT, mean((HRS1./minVal),2), '.-c');
legend('HMC', 'HNR', 'RS', 'HRS');
xlabel('Time - log(ms)');
ylabel('Ratio to minimum');
hold off;