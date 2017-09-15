set(0,'DefaultTextFontname', 'Times New Roman')
set(0,'DefaultAxesFontName', 'Times New Roman')

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

CL = [ 0         0.4470    0.7410
      0.9500    0.4250    0.1980
      0.9290    0.6940    0.1250
      0.4940    0.1840    0.5560
      0.4660    0.6740    0.1880
      0.0910    0.0550    0.5330
      0.6350    0.0780    0.1840]; 

volumeRatio = data(:,5);
RSTime = data(:,4)./data(:,6);
HRSTime = data(:,2)./data(:,6);
MHTime = data(:,1)./data(:,6);
HNRTime = data(:,3)./data(:,6);

ymin = min([RSTime; HRSTime; MHTime; HNRTime]);
ymax = max([RSTime; HRSTime; MHTime; HNRTime]);
xmin = min(volumeRatio);
xmax = max(volumeRatio);

figure(2);
%hold on;
marker_size = 4;

h1 = loglog(volumeRatio,RSTime,  'o', 'MarkerFaceColor', blue, 'MarkerEdgeColor', blue, 'MarkerSize', 4);
hold on;
h2 = loglog(volumeRatio,HRSTime, 'o', 'MarkerFaceColor', red, 'MarkerEdgeColor', red, 'MarkerSize', 4);
h3 = loglog(volumeRatio,MHTime,  'o', 'MarkerFaceColor', green, 'MarkerEdgeColor', green, 'MarkerSize', 4);
h4 = loglog(volumeRatio,HNRTime, 'o', 'MarkerFaceColor', purple, 'MarkerEdgeColor', purple, 'MarkerSize', 4);

hold off;
deltaXLower = 0.000001;
deltaXUpper = 0.002;
deltaYLower = 0.000001;
deltaYUpper = 2000;
xlim([xmin-deltaXLower,xmax+deltaXUpper]);
ylim([ymin-deltaYLower,ymax+deltaYUpper]);

xlabel('informed set volume ratio');
ylabel('time per sample (ms)');
lgd = legend([h1, h2, h3, h4], {'RS', 'HRS', 'MH', 'HNR'});
lgd.FontSize = 16;
set(gca, 'fontsize',12);
