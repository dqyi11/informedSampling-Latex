datasetSize = 20;
maxtimes = zeros(datasetSize,1);
minvals = zeros(datasetSize,1);

hmc1_filename = cell(datasetSize, 1);
hmc2_filename = cell(datasetSize, 1);
hmc3_filename = cell(datasetSize, 1);
hrs_filename = cell(datasetSize, 1);

HMC1 = cell(datasetSize, 1);
HMC2 = cell(datasetSize, 1);
HMC3 = cell(datasetSize, 1);
HRS = cell(datasetSize, 1);

for i = 0:1:datasetSize-1
  hmc1_filename{i+1} = sprintf('data/45s4/diffHMC0_HMC_%d.csv', i);
  hmc2_filename{i+1} = sprintf('data/45s4/diffHMC1_HMC_%d.csv', i);
  hmc3_filename{i+1} = sprintf('data/45s4/diffHMC2_HMC_%d.csv', i);
  hrs_filename{i+1} = sprintf('data/45s4/HRS_HRS_%d.csv', i);
  
  HMC1{i+1} = csvread(hmc1_filename{i+1});
  HMC2{i+1} = csvread(hmc2_filename{i+1});
  HMC3{i+1} = csvread(hmc3_filename{i+1});
  HRS{i+1} = csvread(hrs_filename{i+1}); 
end
    
for i = 0:1:datasetSize-1
  
  allTime = vertcat(HMC1{i+1}(:,1), HMC2{i+1}(:,1), HMC3{i+1}(:,1), HRS{i+1}(:,1));
  allVal = vertcat(HMC1{i+1}(:,2), HMC2{i+1}(:,2), HMC3{i+1}(:,2), HRS{i+1}(:,2));  

  maxtimes(i+1,1) = max(allTime);
  minvals(i+1,1) = min(allVal);
end

maxT = max(maxtimes);
minVal = min(minvals);

stepNum = 10;
nHMC1 = zeros(datasetSize, stepNum+1);
nHMC2 = zeros(datasetSize, stepNum+1);
nHMC3 = zeros(datasetSize, stepNum+1);
nHRS = zeros(datasetSize, stepNum+1);

stepSize = maxT / stepNum;
deltaStepSize = stepSize / 5;
T1 = 0:stepSize:maxT;
T2 = T1 + deltaStepSize; T2(1) = 0;
T3 = T1 + deltaStepSize*2; T3(1) = 0;
T4 = T1 + deltaStepSize*3; T4(1) = 0; 
%T5 = T1 + deltaStepSize*4; T4(1) = 0; 
%T6 = T1 + deltaStepSize*5; T4(1) = 0; 

for i = 0:1:datasetSize-1

  HMC1{i+1}(:,2) = HMC1{i+1}(:,2)./minVal;
  HMC2{i+1}(:,2) = HMC2{i+1}(:,2)./minVal;
  HMC3{i+1}(:,2) = HMC3{i+1}(:,2)./minVal;
  HRS{i+1}(:,2) = HRS{i+1}(:,2)./minVal;

  HMC1_tmp = resample_data(HMC1{i+1}(:,2), HMC1{i+1}(:,1), T1');
  HMC2_tmp = resample_data(HMC2{i+1}(:,2), HMC2{i+1}(:,1), T2');
  HMC3_tmp = resample_data(HMC3{i+1}(:,2), HMC3{i+1}(:,1), T3');
  
  HRS_tmp = resample_data(HRS{i+1}(:,2), HRS{i+1}(:,1), T4');

  
  nHMC1(i+1,:) = HMC1_tmp;
  nHMC2(i+1,:) = HMC2_tmp;
  nHMC3(i+1,:) = HMC3_tmp;  
  nHRS(i+1,:) = HRS_tmp;

end

T1 = T1/1000;
T2 = T2/1000;
T3 = T3/1000;
T4 = T4/1000;

save('data.mat', 'T1', 'T2', 'T3', 'T4', 'nHMC1', 'nHMC2', 'nHMC3', 'nHRS');
