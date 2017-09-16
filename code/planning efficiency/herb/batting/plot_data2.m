set(0,'DefaultTextFontname', 'Times New Roman');
set(0,'DefaultAxesFontName', 'Times New Roman');

fig = figure(100);
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

RSColor = [92, 121, 157]/255.; %[69,117,180]/255.;
HRSColor = [113, 174, 111]/255.; %[102,189,99]/255.;
MCMCColor = [219, 176, 132]/255.; %[253,174,97]/255.;
HNRColor = [243, 90, 83]/255.; %[215,48,39]/255.;

e1 = errorbar(T2, mean(RS2,1), std(RS2), 'color', RSColor, 'LineWidth',2);
e2 = errorbar(T3, mean(HRS2,1), std(HRS2), 'color', HRSColor, 'LineWidth',2);
e3 = errorbar(T1, mean(MCMC2,1), std(MCMC2), 'color', MCMCColor, 'LineWidth',2);
e4 = errorbar(T4, mean(HNR2,1), std(HNR2), 'color', HNRColor, 'LineWidth',2);


p1 = plot(T2, mean(RS2,1), 'o', 'MarkerFaceColor', RSColor, 'MarkerEdgeColor', RSColor, 'MarkerSize', 4);
p2 = plot(T3, mean(HRS2,1), 'o', 'MarkerFaceColor', HRSColor, 'MarkerEdgeColor', HRSColor, 'MarkerSize', 4);
p3 = plot(T1, mean(MCMC2,1), 'o', 'MarkerFaceColor', MCMCColor, 'MarkerEdgeColor', MCMCColor, 'MarkerSize', 4);
p4 = plot(T4, mean(HNR2,1), 'o', 'MarkerFaceColor', HNRColor, 'MarkerEdgeColor', HNRColor, 'MarkerSize', 4);

e1.Color(4) = 0.9; e2.Color(4) = 0.9; e3.Color(4) = 0.9;
p1.Color(4) = 0.9; p2.Color(4) = 0.9; p3.Color(4) = 0.9;

xlim([0, 24]);
legend('RS', 'HRS', 'MH', 'HNR');
xlabel('Time (sec.)');
ylabel('Ratio to minimum');
hold off;

set(gca, 'FontSize', 16);

set(fig,'Units','Inches');
figPos = get(fig,'Position');
set(fig,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[figPos(3), figPos(4)+0.01])

print herb_batting_efficiency.pdf -dpdf -r0