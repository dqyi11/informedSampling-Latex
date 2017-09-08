figure(100);
hold on;

%HMC2 = log(HMC1);
%HNR2 = log(HNR1);
%RS2 = log(RS1);
%HRS2 = log(HRS1);

MCMC2 = MCMC1;
RS2 = RS1;
HRS2 = HRS1;
HNR2 = HNR1;

errorbar(T2, mean(MCMC2,1), std(MCMC2), 'g', 'LineWidth',2);
errorbar(T3, mean(RS2,1), std(RS2), 'b', 'LineWidth',2);
errorbar(T4, mean(HRS2,1), std(HRS2), 'c', 'LineWidth',2);
errorbar(T1, mean(HNR2,1), std(HNR2)', 'r', 'LineWidth',2);


plot(T1, mean(MCMC2,1), 'o', 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g', 'MarkerSize', 4);
plot(T2, mean(RS2,1), 'o', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'b', 'MarkerSize', 4);
plot(T3, mean(HRS2,1), 'o', 'MarkerFaceColor', 'c', 'MarkerEdgeColor', 'c', 'MarkerSize', 4);
plot(T4, mean(HNR2,1), 'o', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'r', 'MarkerSize', 4);

xlim([0, 10]);
legend('MCMC', 'RS', 'HRS', 'HNR');
xlabel('Time - s');
ylabel('Ratio to minimum');
hold off;