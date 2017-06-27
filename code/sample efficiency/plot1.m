data = sortrows(data05, 9);

data(:,1) = log(data(:,1));
data(:,3) = log(data(:,3));
data(:,5) = log(data(:,5));
data(:,7) = log(data(:,7));


figure;
hold on;
scatter(log(data(:,9)),data(:,1)./data(:,2),'MarkerFaceColor','r', 'Marker', 'h');
scatter(log(data(:,9)),data(:,3)./data(:,4),'MarkerFaceColor','g', 'Marker', 'd');
scatter(log(data(:,9)),data(:,5)./data(:,6),'MarkerFaceColor','b', 'Marker', 'o');
scatter(log(data(:,9)),data(:,7)./data(:,8),'MarkerFaceColor','c', 'Marker', 's');
xlabel('informed set volume ratio');
ylabel('time per sample (ms)');
legend('HMC', 'HRS', 'Hit&Run', 'Rejection');
hold off;

