%data = sortrows(dim3, 5);

%data(:,1) = log(data(:,1));
%data(:,2) = log(data(:,2));
%data(:,3) = log(data(:,3));
%data(:,4) = log(data(:,4));

green = [49,163,84]/255;
red = [222 45 38]/255;
blue = [49,130,189]/255;
orange = [230,85,13]/255;
purple = [117,107,177]/255;
pink = [197,27,138]/255;

figure;
hold on;
marker_size = 20;
plot(dim2(:,12), dim2(:,13), 'color', blue, 'linewidth', 4);
plot(dim6(:,12), dim6(:,13), 'color', red, 'linewidth', 4);
%scatter(log10(data(:,5)),log10(data(:,1)./data(:,6)), marker_size, 'MarkerFaceColor', green, 'MarkerEdgeColor', green, 'Marker', 'h');
%scatter(log10(data(:,5)),log10(data(:,3)./data(:,6)), marker_size, 'MarkerFaceColor', purple, 'MarkerEdgeColor', purple, 'Marker', 'o');

xlim([1, 1.41]);
xlabel(' c_{best} / c^*_{best}');
ylabel('informed set volume ratio');
%legend('Rejection', 'HRS', 'MCMC', 'Hit&Run');
legend('4-dimension', '12-dimension');
hold off;

set(gca,'FontSize',16)