datasetSize = 10;
maxtimes = zeros(datasetSize,1);
minvals = zeros(datasetSize,1);
for i = 0:1:datasetSize-1
  hnr_filename = sprintf('data/3d/3s/simple_HNR_%d.csv', i);
  mcmc_filename = sprintf('data/3d/3s/simple_MCMC_%d.csv', i);
  rs_filename = sprintf('data/3d/3s/simple_RS_%d.csv', i);
  hrs_filename = sprintf('data/3d/3s/simple_HRS_%d.csv', i);
  
  HNR = csvread(hnr_filename);
  MCMC = csvread(mcmc_filename);
  RS = csvread(rs_filename);
  HRS = csvread(hrs_filename);
  
  allTime = vertcat(HNR(:,1), MCMC(:,1), RS(:,1), HRS(:,1));
  allVal = vertcat(HNR(:,2), MCMC(:,2), RS(:,2), HRS(:,2));
  maxtimes(i+1,1) = max(allTime);
  minvals(i+1,1) = min(allVal);
end

maxT = max(maxtimes);
minVal = min(minvals);

stepNum = 20;
HNR1 = zeros(datasetSize, stepNum+1);
MCMC1 = zeros(datasetSize, stepNum+1);
RS1 = zeros(datasetSize, stepNum+1);
HRS1 = zeros(datasetSize, stepNum+1);

stepSize = maxT / stepNum;
deltaStepSize = stepSize / 5;
T1 = 0:stepSize:maxT;
T2 = T1 + deltaStepSize; T2(1) = 0;
T3 = T1 + deltaStepSize*2; T3(1) = 0;
T4 = T1 + deltaStepSize*3; T4(1) = 0; 

for i = 0:1:datasetSize-1
  hnr_filename = sprintf('data/3d/3s/simple_HNR_%d.csv', i);
  mcmc_filename = sprintf('data/3d/3s/simple_MCMC_%d.csv', i);
  rs_filename = sprintf('data/3d/3s/simple_RS_%d.csv', i);
  hrs_filename = sprintf('data/3d/3s/simple_HRS_%d.csv', i);
  
  HNR = csvread(hnr_filename);
  MCMC = csvread(mcmc_filename);
  RS = csvread(rs_filename);
  HRS = csvread(hrs_filename);
  
  HNR(:,2) = HNR(:,2)./minVal;
  MCMC(:,2) = MCMC(:,2)./minVal;
  RS(:,2) = RS(:,2)./minVal;
  HRS(:,2) = HRS(:,2)./minVal;

  HNR_tmp = resample_data(HNR(:,2), HNR(:,1), T1');
  MCMC_tmp = resample_data(MCMC(:,2), MCMC(:,1), T2');
  RS_tmp = resample_data(RS(:,2), RS(:,1), T3');
  HRS_tmp = resample_data(HRS(:,2), HRS(:,1), T4');
  HNR1(i+1,:) = HNR_tmp;
  MCMC1(i+1,:) = MCMC_tmp;
  RS1(i+1,:) = RS_tmp;
  HRS1(i+1,:) = HRS_tmp;
end

T1 = T1/1000;
T2 = T2/1000;
T3 = T3/1000;
T4 = T4/1000;

save('data.mat', 'T1', 'T2', 'T3', 'T4', 'HNR1', 'MCMC1', 'RS1', 'HRS1');