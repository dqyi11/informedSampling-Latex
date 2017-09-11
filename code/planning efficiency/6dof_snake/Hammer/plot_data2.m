figure(100);
hold on;

%HMC2 = log(HMC1);
%HNR2 = log(HNR1);
%RS2 = log(RS1);
%HRS2 = log(HRS1);

green = [49,163,84]/255;
red = [222 45 38]/255;
blue = [49,130,189]/255;
orange = [230,85,13]/255;
purple = [117,107,177]/255;
pink = [197,27,138]/255;

MCMC2 = MCMC1;
RS2 = RS1;
HRS2 = HRS1;
HNR2 = HNR1;

errorbar(T2, mean(RS2,1), std(RS2), 'color', blue, 'LineWidth',2);
errorbar(T3, mean(HRS2,1), std(HRS2), 'color', red, 'LineWidth',2);
errorbar(T1, mean(MCMC2,1), std(MCMC2), 'color', green, 'LineWidth',2);
errorbar(T4, mean(HNR2,1), std(HNR2), 'color', purple, 'LineWidth',2);


plot(T2, mean(RS2,1), 'o', 'MarkerFaceColor', blue, 'MarkerEdgeColor', blue, 'MarkerSize', 4);
plot(T3, mean(HRS2,1), 'o', 'MarkerFaceColor', red, 'MarkerEdgeColor', red, 'MarkerSize', 4);
plot(T1, mean(MCMC2,1), 'o', 'MarkerFaceColor', green, 'MarkerEdgeColor', green, 'MarkerSize', 4);
plot(T4, mean(HNR2,1), 'o', 'MarkerFaceColor', purple, 'MarkerEdgeColor', purple, 'MarkerSize', 4);

xlim([0, 8]);
legend('MCMC', 'RS', 'HRS', 'HNR');
xlabel('Time - s');
ylabel('Ratio to minimum');
hold off;