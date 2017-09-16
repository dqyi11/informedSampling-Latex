set(0,'DefaultTextFontname', 'Times New Roman')
set(0,'DefaultAxesFontName', 'Times New Roman')

fastX = [1:1:45]';
slowX = [1:1:14]';

green = [49,163,84]/255;
red = [222 45 38]/255;
blue = [49,130,189]/255;
orange = [230,85,13]/255;
purple = [117,107,177]/255;
pink = [197,27,138]/255;

fig = figure(3);

step = 6;rMag = 0.1;
fastNum = size(fastpath,1);
slowNum = size(slowpath,1);
fastQuiverNum = floor(fastNum/step);
slowQuiverNum = floor(slowNum/step);
fastV0 = zeros(fastQuiverNum,2);
fastP = zeros(fastQuiverNum,2);
slowV0 = zeros(slowQuiverNum,2);
slowP = zeros(slowQuiverNum,2);

for i = 1:1:fastQuiverNum
    fastV0(i,1) = fastpath(i*step,2);
    fastV0(i,2) = fastpath(i*step,9);
    fastP(i,1) = (fastpath(i*step+1,2) - fastpath(i*step,2)) * rMag;
    fastP(i,2) = (fastpath(i*step+1,9) - fastpath(i*step,9)) * rMag;
end
for i = 1:1:slowQuiverNum
    slowV0(i,1) = slowpath(i*step,2);
    slowV0(i,2) = slowpath(i*step,9);
    slowP(i,1) = (slowpath(i*step+1,2) - slowpath(i*step,2)) * rMag;
    slowP(i,2) = (slowpath(i*step+1,9) - slowpath(i*step,9)) * rMag;
end

%colororder = get(gca, 'colororder');

limXLower = -0.4; limXUpper = 0.2;
limYLower = -0.4; limYUpper = 0.8;

fastColor = [0,0.447000000000000,0.741000000000000];
slowColor = [0.850000000000000,0.325000000000000,0.0980000000000000];

fastStartColor = fastColor;
fastGoalColor = fastColor;
fastMaxIdx = size(fastpath(:,9),1);
fastStartVel = fastpath(1,9);
fastStartPos = fastpath(1,2);
fastGoalVel = fastpath(fastMaxIdx, 9);
fastGoalPos = fastpath(fastMaxIdx, 2);

%fastStartVelLineX = 
%fastStartVelLineY = 
%fastStartPosLineX = 
%fastStartPosLineY =
fastGoalVelLineX = limXLower:0.01:fastGoalPos;
fastGoalVelLineY = fastGoalVel*ones(size(fastGoalVelLineX,2),1);
fastGoalPosLineY = limYLower:0.01:fastGoalVel;
fastGoalPosLineX = fastGoalPos*ones(size(fastGoalPosLineY,2),1);

slowStartColor = slowColor;
slowGoalColor = slowColor;
slowMaxIdx = size(slowpath(:,9),1);
slowStartVel = slowpath(1,9);
slowStartPos = slowpath(1,2);
slowGoalVel = slowpath(slowMaxIdx, 9);
slowGoalPos = slowpath(slowMaxIdx, 2);

%slowStartVelLineX = 
%slowStartVelLineY = 
%slowStartPosLineX = 
%slowStartPosLineY =
slowGoalVelLineX = limXLower:0.01:slowGoalPos;
slowGoalVelLineY = slowGoalVel*ones(size(slowGoalVelLineX,2),1);
slowGoalPosLineY = limYLower:0.01:slowGoalVel;
slowGoalPosLineX = slowGoalPos*ones(size(slowGoalPosLineY,2),1);

faceColor = [1 1 1];

hold on;

l3 = plot(fastGoalVelLineX, fastGoalVelLineY, 'color', fastColor);
l4 = plot(fastGoalPosLineX, fastGoalPosLineY, 'color', fastColor);
l1 = plot(slowGoalVelLineX, slowGoalVelLineY, 'color', slowColor);
l2 = plot(slowGoalPosLineX, slowGoalPosLineY, 'color', slowColor);

l1.Color(4) = 0.6;
l2.Color(4) = 0.6;
l3.Color(4) = 0.6;
l4.Color(4) = 0.6;

h1 = plot(fastpath(:,2), fastpath(:,9), '-', 'linewidth', 2, 'color', fastColor );
h2 = plot(slowpath(:,2), slowpath(:,9), '-', 'linewidth', 2, 'color', slowColor );
%h3 = quiver (fastV0(:,1),fastV0(:,2), fastP(:,1), fastP(:,2), 0.3, 'color', green, 'linewidth', 1); 
%h4 = quiver (slowV0(:,1),slowV0(:,2), slowP(:,1), slowP(:,2), 0.3, 'color', blue, 'linewidth', 1); 
scatter(fastStartPos, fastStartVel, 'o', 'MarkerEdgeColor', fastStartColor, 'MarkerFaceColor', faceColor, 'LineWidth',2);
scatter(slowStartPos, slowStartVel, 'o', 'MarkerEdgeColor', slowStartColor, 'MarkerFaceColor', faceColor, 'LineWidth',2);

scatter(fastGoalPos, fastGoalVel, 's', 'MarkerEdgeColor', fastGoalColor, 'MarkerFaceColor', faceColor, 'LineWidth',2);
scatter(slowGoalPos, slowGoalVel, 's', 'MarkerEdgeColor', slowGoalColor, 'MarkerFaceColor', faceColor, 'LineWidth',2);

xlim([-0.32, 0.12]);

xlabel('Position  $ q  $ (rad)', 'Interpreter','latex');
ylabel('Velocity $ \dot{q} $ (rad/sec) ', 'Interpreter','latex');
lgd = legend([h1, h2], {'non-zero goal velocity', 'zero goal velocity'}, 'Location', 'northwest');
hold off;
%lgd.Position = 'southeast';

set(gca,'FontSize',16);

%{
figure(4);
hold on;
plot(slowpath(:,2), slowpath(:,9)/1.5, 'linewidth', 2, 'color', green);
plot(slowpath(:,4), slowpath(:,11)/4, 'linewidth', 2, 'color', blue);
xlabel('DoF2');
ylabel('Vel DoF2');
hold off;
%}

set(fig,'Units','Inches');
figPos = get(fig,'Position');
set(fig,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[figPos(3), figPos(4)+0.01])

print phase_plot.pdf -dpdf -r0

