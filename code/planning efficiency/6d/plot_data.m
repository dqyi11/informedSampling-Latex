figure(100);
hold on;

color1 = [57./255,  106./255, 177./255];
color2 = [218./255, 124./255, 48./255];
color3 = [62./255,  150./255, 81./255];
color4 = [204./255, 37./255,  41./255];

%HMC2 = log(HMC1);
%HNR2 = log(HNR1);
%RS2 = log(RS1);
%HRS2 = log(HRS1);

HMC2 = HMC1;
HNR2 = HNR1;
RS2 = RS1;
HRS2 = HRS1;

errorbar(T1, mean(HMC2,1), std(HMC2)', 'Color', color1, 'LineWidth',2);
errorbar(T2, mean(HNR2,1), std(HNR2), 'Color', color2, 'LineWidth',2);
errorbar(T3, mean(RS2,1), std(RS2), 'Color', color3, 'LineWidth',2);
errorbar(T4, mean(HRS2,1), std(HRS2), 'Color', color4, 'LineWidth',2);

plot(T1, mean(HMC2,1), 'o', 'MarkerFaceColor', color1, 'MarkerEdgeColor', color1, 'MarkerSize', 4);
plot(T2, mean(HNR2,1), 'o', 'MarkerFaceColor', color2, 'MarkerEdgeColor', color2, 'MarkerSize', 4);
plot(T3, mean(RS2,1), 'o', 'MarkerFaceColor', color3, 'MarkerEdgeColor', color3, 'MarkerSize', 4);
plot(T4, mean(HRS2,1), 'o', 'MarkerFaceColor', color4, 'MarkerEdgeColor', color4, 'MarkerSize', 4);

xlim([0, 50]);
legend('HMC', 'Hit&Run', 'RS', 'HRS');
xlabel('Time - s');
ylabel('Ratio to minimum');
hold off;