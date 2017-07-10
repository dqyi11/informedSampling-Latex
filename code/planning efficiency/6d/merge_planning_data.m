datasetSize = 20;
maxtimes = zeros(datasetSize,1);
minvals = zeros(datasetSize,1);

hmc_filename = cell(datasetSize, 1);
hnr_filename = cell(datasetSize, 1);
rs_filename = cell(datasetSize, 1);
hrs_filename = cell(datasetSize, 1);

HMC = cell(datasetSize, 1);
HNR = cell(datasetSize, 1);
RS = cell(datasetSize, 1);
HRS = cell(datasetSize, 1);

for i = 0:1:datasetSize-1
  hmc_filename{i+1} = sprintf('data/45s2/simple_HMC_%d.csv', i);
  hnr_filename{i+1} = sprintf('data/45s2/simple_HNR_%d.csv', i);
  rs_filename{i+1} = sprintf('data/45s2/simple_RS_%d.csv', i);
  hrs_filename{i+1} = sprintf('data/45s2/simple_HRS_%d.csv', i);

  HMC{i+1} = csvread(hmc_filename{i+1});
  HNR{i+1} = csvread(hnr_filename{i+1});
  RS{i+1} = csvread(rs_filename{i+1});
  HRS{i+1} = csvread(hrs_filename{i+1});
end
  
for i = 0:1:datasetSize-1  
   
  allTime = vertcat(HMC{i+1}(:,1), HNR{i+1}(:,1), RS{i+1}(:,1), HRS{i+1}(:,1));
  allVal = vertcat(HMC{i+1}(:,2), HNR{i+1}(:,2), RS{i+1}(:,2), HRS{i+1}(:,2));
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
  
  HMC{i+1}(:,2) = HMC{i+1}(:,2)./minVal;
  HNR{i+1}(:,2) = HNR{i+1}(:,2)./minVal;
  RS{i+1}(:,2) = RS{i+1}(:,2)./minVal;
  HRS{i+1}(:,2) = HRS{i+1}(:,2)./minVal;

  HMC_tmp = resample_data(HMC{i+1}(:,2), HMC{i+1}(:,1), T1');
  HNR_tmp = resample_data(HNR{i+1}(:,2), HNR{i+1}(:,1), T2');
  RS_tmp = resample_data(RS{i+1}(:,2), RS{i+1}(:,1), T3');
  HRS_tmp = resample_data(HRS{i+1}(:,2), HRS{i+1}(:,1), T4');
  HMC1(i+1,:) = HMC_tmp;
  HNR1(i+1,:) = HNR_tmp;
  RS1(i+1,:) = RS_tmp;
  HRS1(i+1,:) = HRS_tmp;
end

T1 = T1/1000;
T2 = T2/1000;
T3 = T3/1000;
T4 = T4/1000;

save('data.mat', 'T1', 'T2', 'T3', 'T4', 'HMC1', 'HNR1', 'RS1', 'HRS1');