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

stepNum = 20;
HMC1 = zeros(datasetSize, stepNum+1);
HNR1 = zeros(datasetSize, stepNum+1);
RS1 = zeros(datasetSize, stepNum+1);
HRS1 = zeros(datasetSize, stepNum+1);

stepSize = maxT / stepNum;
deltaStepSize = stepSize / 5;
T1 = 0:stepSize:maxT;
T2 = T1 + deltaStepSize; T2(1) = 0;
T3 = T1 + deltaStepSize*2; T3(1) = 0;
T4 = T1 + deltaStepSize*3; T4(1) = 0; 

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

  HMC_tmp = resample_data(HMC(:,2), HMC(:,1), T1');
  HNR_tmp = resample_data(HNR(:,2), HNR(:,1), T2');
  RS_tmp = resample_data(RS(:,2), RS(:,1), T3');
  HRS_tmp = resample_data(HRS(:,2), HRS(:,1), T4');
  HMC1(i+1,:) = HMC_tmp;
  HNR1(i+1,:) = HNR_tmp;
  RS1(i+1,:) = RS_tmp;
  HRS1(i+1,:) = HRS_tmp;
end

figure(100);
hold on;

errorbar(T1, mean(HMC1,1), std(HMC1)', 'r', 'LineWidth',2);
errorbar(T2, mean(HNR1,1), std(HNR1), 'g', 'LineWidth',2);
errorbar(T3, mean(RS1,1), std(RS1), 'b', 'LineWidth',2);
errorbar(T4, mean(HRS1,1), std(HRS1), 'c', 'LineWidth',2);

plot(T1, mean(HMC1,1), 'o', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'r', 'MarkerSize', 4);
plot(T2, mean(HNR1,1), 'o', 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g', 'MarkerSize', 4);
plot(T3, mean(RS1,1), 'o', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'b', 'MarkerSize', 4);
plot(T4, mean(HRS1,1), 'o', 'MarkerFaceColor', 'c', 'MarkerEdgeColor', 'c', 'MarkerSize', 4);

legend('HMC', 'Hit&Run', 'RS', 'HRS');
xlabel('Time - ms');
ylabel('Ratio to minimum');
hold off;