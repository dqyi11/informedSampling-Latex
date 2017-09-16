set(0,'DefaultTextFontname', 'Times New Roman')
set(0,'DefaultAxesFontName', 'Times New Roman')

data = sortrows(dim6, 5);

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

RSColor = [92, 121, 157]/255.; %[69,117,180]/255.;
HRSColor = [113, 174, 111]/255.; %[102,189,99]/255.;
MHColor = [219, 176, 132]/255.; %[253,174,97]/255.;
HNRColor = [243, 90, 83]/255.; %[215,48,39]/255.;

ymin = min([RSTime; HRSTime; MHTime; HNRTime]);
ymax = max([RSTime; HRSTime; MHTime; HNRTime]);
xmin = min(volumeRatio);
xmax = max(volumeRatio);

fig = figure(2);
%hold on;
marker_size = 4;

h1 = loglog(volumeRatio,RSTime,  'o', 'MarkerFaceColor', RSColor, 'MarkerEdgeColor', RSColor, 'MarkerSize', 4);
hold on;
h2 = loglog(volumeRatio,HRSTime, 'o', 'MarkerFaceColor', HRSColor, 'MarkerEdgeColor', HRSColor, 'MarkerSize', 4);
h3 = loglog(volumeRatio,MHTime,  'o', 'MarkerFaceColor', MHColor, 'MarkerEdgeColor', MHColor, 'MarkerSize', 4);
h4 = loglog(volumeRatio,HNRTime, 'o', 'MarkerFaceColor', HNRColor, 'MarkerEdgeColor', HNRColor, 'MarkerSize', 4);
hold off;

h1.Color(4) = 0.9; h2.Color(4) = 0.9; h3.Color(4) = 0.9;

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
set(gca, 'fontsize',16);

set(fig,'Units','Inches');
figPos = get(fig,'Position');
set(fig,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[figPos(3), figPos(4)+0.04])

print sample_efficiency_6d.pdf -dpdf -r0
