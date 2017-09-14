datasetSize = 10;
maxtimes = zeros(datasetSize,1);
minvals = zeros(datasetSize,1);
for i = 0:1:datasetSize-1
  mcmc_filename = sprintf('data/60s/simple_MCMC_%d.csv', i);
  rs_filename = sprintf('data/60s/simple_RS_%d.csv', i);
  hrs_filename = sprintf('data/60s/simple_HRS_%d.csv', i);
  hnr_filename = sprintf('data/60s/simple_HNR_%d.csv', i);
  
  MCMC = csvread(mcmc_filename);
  RS = csvread(rs_filename);
  HRS = csvread(hrs_filename);
  HNR = csvread(hnr_filename);
  
  allTime = vertcat(MCMC(:,1), RS(:,1), HRS(:,1), HNR(:,1));
  allVal = vertcat(MCMC(:,2), RS(:,2), HRS(:,2), HNR(:,2));
  maxtimes(i+1,1) = max(allTime);
  minvals(i+1,1) = min(allVal);
end

maxT = max(maxtimes);
minVal = min(minvals);

stepNum = 20;
MCMC1 = zeros(datasetSize, stepNum+1);
RS1 = zeros(datasetSize, stepNum+1);
HRS1 = zeros(datasetSize, stepNum+1);
HNR1 = zeros(datasetSize, stepNum+1);

stepSize = maxT / stepNum;
deltaStepSize = stepSize / 5;
T1 = 0:stepSize:maxT;
T2 = T1 + deltaStepSize; T2(1) = 0;
T3 = T1 + deltaStepSize*2; T3(1) = 0;
T4 = T1 + deltaStepSize*3; T4(1) = 0; 

for i = 0:1:datasetSize-1
  mcmc_filename = sprintf('data/20s/simple_MCMC_%d.csv', i);
  rs_filename = sprintf('data/20s/simple_RS_%d.csv', i);
  hrs_filename = sprintf('data/20s/simple_HRS_%d.csv', i);
  hnr_filename = sprintf('data/20s/simple_HNR_%d.csv', i);
  
  MCMC = csvread(mcmc_filename);
  RS = csvread(rs_filename);
  HRS = csvread(hrs_filename);
  HNR = csvread(hnr_filename);
  
  MCMC(:,2) = MCMC(:,2)./minVal;
  RS(:,2) = RS(:,2)./minVal;
  HRS(:,2) = HRS(:,2)./minVal;
  HNR(:,2) = HNR(:,2)./minVal;

  MCMC_tmp = resample_data(MCMC(:,2), MCMC(:,1), T1');
  RS_tmp = resample_data(RS(:,2), RS(:,1), T2');
  HRS_tmp = resample_data(HRS(:,2), HRS(:,1), T3');
  HNR_tmp = resample_data(HNR(:,2), HNR(:,1), T4');
  
  
  MCMC1(i+1,:) = MCMC_tmp;
  RS1(i+1,:) = RS_tmp;
  HRS1(i+1,:) = HRS_tmp;
  HNR1(i+1,:) = HNR_tmp;
end

T1 = T1/1000;
T2 = T2/1000;
T3 = T3/1000;
T4 = T4/1000;

save('data.mat', 'T1', 'T2', 'T3', 'T4', 'MCMC1', 'RS1', 'HRS1', 'HNR1');