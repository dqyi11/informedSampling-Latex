data = sortrows(dim6, 5);

data(:,1) = log(data(:,1));
data(:,2) = log(data(:,2));
data(:,3) = log(data(:,3));
data(:,4) = log(data(:,4));

green = [49,163,84]/255;
red = [222 45 38]/255;
blue = [49,130,189]/255;
orange = [230,85,13]/255;
purple = [117,107,177]/255;
pink = [197,27,138]/255;

figure;
hold on;
marker_size = 20;
scatter(log(data(:,5)),data(:,4)./data(:,6), marker_size, 'MarkerFaceColor', blue, 'MarkerEdgeColor', blue, 'Marker', 's');
scatter(log(data(:,5)),data(:,2)./data(:,6), marker_size, 'MarkerFaceColor', red, 'MarkerEdgeColor', red, 'Marker', 'd');
scatter(log(data(:,5)),data(:,1)./data(:,6), marker_size, 'MarkerFaceColor', green, 'MarkerEdgeColor', green, 'Marker', 'h');
scatter(log(data(:,5)),data(:,3)./data(:,6), marker_size, 'MarkerFaceColor', purple, 'MarkerEdgeColor', purple, 'Marker', 'o');

xlabel('informed set volume ratio');
ylabel('time per sample (ms)');
legend('Rejection', 'HRS', 'MCMC', 'Hit&Run');
hold off;
