data = sortrows(dim2, 5);

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
h1 = scatter(log10(data(:,5)),log10(data(:,4)./data(:,6)), marker_size, 'MarkerFaceColor', blue, 'MarkerEdgeColor', blue, 'Marker', 's');
h2 = scatter(log10(data(:,5)),log10(data(:,2)./data(:,6)), marker_size, 'MarkerFaceColor', red, 'MarkerEdgeColor', red, 'Marker', 'd');
h3 = scatter(log10(data(:,5)),log10(data(:,1)./data(:,6)), marker_size, 'MarkerFaceColor', green, 'MarkerEdgeColor', green, 'Marker', 'h');
h4 = scatter(log10(data(:,5)),log10(data(:,3)./data(:,6)), marker_size, 'MarkerFaceColor', purple, 'MarkerEdgeColor', purple, 'Marker', 'o');
%plot(log10(data(:,5)),log10(data(:,4)./data(:,6)), 'color', blue, 'linewidth', 1);
%plot(log10(data(:,5)),log10(data(:,2)./data(:,6)), 'color', red, 'linewidth', 1);
%plot(log10(data(:,5)),log10(data(:,1)./data(:,6)), 'color', green, 'linewidth', 1);
%plot(log10(data(:,5)),log10(data(:,3)./data(:,6)), 'color', purple, 'linewidth', 1);
hold off;
%xlim([-4, 0]);ylim([-2,1]);
yval = -2:0.5:1;
ytk = power(10,yval);
ytks = cell(1,size(ytk,2));
for i = 1:1:size(ytk,2)
    ytks{i} = num2str(ytk(1,i),'%10.2e\n');
end


xlabel('informed set volume ratio');
ylabel('time per sample - (ms)');
lgd = legend([h1, h2, h3, h4], {'RS', 'HRS', 'MH', 'HNR'});
lgd.FontSize = 16;
%xticks([-0.0001 -0.001 -0.01 -0.1 1]);
set(gca, 'XTickLabel', {'0.0001','0.001','0.01', '0.1', '1'});
set(gca,'YTickLabel',ytks);
set(gca, 'fontsize',12);

set(gca,'YTickLabelRotation',20);
