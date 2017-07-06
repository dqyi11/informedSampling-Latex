figure(100);
hold on;

color1 = [57./255,  106./255, 177./255];
color2 = [218./255, 124./255, 48./255];
color3 = [62./255,  150./255, 81./255];
color4 = [204./255, 37./255,  41./255];
color5 = [83./255,  81./255,  84./255];
color6 = [107./255, 76./255,  154./255];

errorbar(T1, mean(nHMC1,1), std(nHMC1), 'Color', color1, 'LineWidth',2);
errorbar(T2, mean(nHMC2,1), std(nHMC2), 'Color', color2, 'LineWidth',2);
errorbar(T3, mean(nHMC3,1), std(nHMC3), 'Color', color3, 'LineWidth',2);
errorbar(T4, mean(nHMC4,1), std(nHMC4), 'Color', color4, 'LineWidth',2);
errorbar(T5, mean(nHMC5,1), std(nHMC5), 'Color', color5, 'LineWidth',2);
errorbar(T6, mean(nHMC6,1), std(nHMC6), 'Color', color6, 'LineWidth',2);

plot(T1, mean(nHMC1,1), 'o', 'MarkerFaceColor', color1, 'MarkerEdgeColor', color1, 'MarkerSize', 4);
plot(T2, mean(nHMC2,1), 'o', 'MarkerFaceColor', color2, 'MarkerEdgeColor', color2, 'MarkerSize', 4);
plot(T3, mean(nHMC3,1), 'o', 'MarkerFaceColor', color3, 'MarkerEdgeColor', color3, 'MarkerSize', 4);
plot(T4, mean(nHMC4,1), 'o', 'MarkerFaceColor', color4, 'MarkerEdgeColor', color4, 'MarkerSize', 4);
plot(T5, mean(nHMC5,1), 'o', 'MarkerFaceColor', color5, 'MarkerEdgeColor', color5, 'MarkerSize', 4);
plot(T6, mean(nHMC6,1), 'o', 'MarkerFaceColor', color6, 'MarkerEdgeColor', color6, 'MarkerSize', 4);

xlim([0, 50]);
legend('$\epsilon = 0.1$, $\L = 5$', '$\epsilon = 0.05$, $\L = 5$', '$\epsilon = 0.2$, $\L = 5$', '$\epsilon = 0.1$, $\L = 10$', '$\epsilon = 0.05$, $\L = 10$', '$\epsilon = 0.2$, $\L = 10$');
xlabel('Time - s');
ylabel('Ratio to minimum');
hold off;