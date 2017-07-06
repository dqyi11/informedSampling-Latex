datasetSize = 20;
maxtimes = zeros(datasetSize,1);
minvals = zeros(datasetSize,1);
for i = 0:1:datasetSize-1
  hmc1_filename = sprintf('data/45s/diffHMC0_HMC_%d.csv', i);
  hmc2_filename = sprintf('data/45s/diffHMC1_HMC_%d.csv', i);
  hmc3_filename = sprintf('data/45s/diffHMC2_HMC_%d.csv', i);
  hmc4_filename = sprintf('data/45s/diffHMC3_HMC_%d.csv', i);
  hmc5_filename = sprintf('data/45s/diffHMC4_HMC_%d.csv', i);
  hmc6_filename = sprintf('data/45s/diffHMC5_HMC_%d.csv', i);
  
  HMC1 = csvread(hmc1_filename);
  HMC2 = csvread(hmc2_filename);
  HMC3 = csvread(hmc3_filename);
  HMC4 = csvread(hmc4_filename);
  HMC5 = csvread(hmc5_filename);
  HMC6 = csvread(hmc6_filename);
  
  allTime = vertcat(HMC1(:,1), HMC2(:,1), HMC3(:,1), HMC4(:,1), HMC5(:,1), HMC6(:,1));
  allVal = vertcat(HMC1(:,2), HMC2(:,2), HMC3(:,2), HMC4(:,2), HMC5(:,2), HMC6(:,2));
  maxtimes(i+1,1) = max(allTime);
  minvals(i+1,1) = min(allVal);
end

maxT = max(maxtimes);
minVal = min(minvals);

stepNum = 20;
nHMC1 = zeros(datasetSize, stepNum+1);
nHMC2 = zeros(datasetSize, stepNum+1);
nHMC3 = zeros(datasetSize, stepNum+1);
nHMC4 = zeros(datasetSize, stepNum+1);
nHMC5 = zeros(datasetSize, stepNum+1);
nHMC6 = zeros(datasetSize, stepNum+1);

stepSize = maxT / stepNum;
deltaStepSize = stepSize / 7;
T1 = 0:stepSize:maxT;
T2 = T1 + deltaStepSize; T2(1) = 0;
T3 = T1 + deltaStepSize*2; T3(1) = 0;
T4 = T1 + deltaStepSize*3; T4(1) = 0; 
T5 = T1 + deltaStepSize*4; T4(1) = 0; 
T6 = T1 + deltaStepSize*5; T4(1) = 0; 

for i = 0:1:datasetSize-1
  hmc1_filename = sprintf('data/45s/diffHMC0_HMC_%d.csv', i);
  hmc2_filename = sprintf('data/45s/diffHMC1_HMC_%d.csv', i);
  hmc3_filename = sprintf('data/45s/diffHMC2_HMC_%d.csv', i);
  hmc4_filename = sprintf('data/45s/diffHMC3_HMC_%d.csv', i);
  hmc5_filename = sprintf('data/45s/diffHMC4_HMC_%d.csv', i);
  hmc6_filename = sprintf('data/45s/diffHMC5_HMC_%d.csv', i);
  
  HMC1 = csvread(hmc1_filename);
  HMC2 = csvread(hmc2_filename);
  HMC3 = csvread(hmc3_filename);
  HMC4 = csvread(hmc4_filename);
  HMC5 = csvread(hmc5_filename);
  HMC6 = csvread(hmc6_filename);
  
  HMC1(:,2) = HMC1(:,2)./minVal;
  HMC2(:,2) = HMC2(:,2)./minVal;
  HMC3(:,2) = HMC3(:,2)./minVal;
  HMC4(:,2) = HMC4(:,2)./minVal;
  HMC5(:,2) = HMC5(:,2)./minVal;
  HMC6(:,2) = HMC6(:,2)./minVal;

  HMC1_tmp = resample_data(HMC1(:,2), HMC1(:,1), T1');
  HMC2_tmp = resample_data(HMC2(:,2), HMC2(:,1), T2');
  HMC3_tmp = resample_data(HMC3(:,2), HMC3(:,1), T3');
  HMC4_tmp = resample_data(HMC4(:,2), HMC4(:,1), T4');
  HMC5_tmp = resample_data(HMC5(:,2), HMC5(:,1), T5');
  HMC6_tmp = resample_data(HMC6(:,2), HMC6(:,1), T6');

  
  nHMC1(i+1,:) = HMC1_tmp;
  nHMC2(i+1,:) = HMC2_tmp;
  nHMC3(i+1,:) = HMC3_tmp;
  nHMC4(i+1,:) = HMC4_tmp;
  nHMC5(i+1,:) = HMC5_tmp;
  nHMC6(i+1,:) = HMC6_tmp;

end

T1 = T1/1000;
T2 = T2/1000;
T3 = T3/1000;
T4 = T4/1000;
T5 = T5/1000;
T6 = T6/1000;

save('data.mat', 'T1', 'T2', 'T3', 'T4', 'T5', 'T6', 'nHMC1', 'nHMC2', 
'nHMC3', 'nHMC4', 'nHMC5', 'nHMC6');