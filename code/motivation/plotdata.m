
fastX = [1:1:45]';
slowX = [1:1:14]';

green = [49,163,84]/255;
red = [222 45 38]/255;
blue = [49,130,189]/255;
orange = [230,85,13]/255;
purple = [117,107,177]/255;
pink = [197,27,138]/255;

%{
figure(1);
hold on;
plot(fastX, fastpath(:,9)/1.5,'-', 'linewidth', 2, 'color', green);
plot(fastX, fastpath(:,11)/4,'-', 'linewidth', 2, 'color',red);
plot(fastX, fastpath(:,13)/5,'-', 'linewidth', 2, 'color', blue);

plot(fastX, fastpath(:,2), '--', 'linewidth', 2, 'color', orange);
plot(fastX, fastpath(:,4), '--', 'linewidth', 2, 'color', purple);
plot(fastX, fastpath(:,6), '--', 'linewidth', 2,'color',pink);

xlim([1,45]);
legend('DoF2', 'DoF4', 'DoF6', 'Vel2', 'Vel4', 'Vel6');
xlabel('Time step');
ylabel('Value');
hold off;


figure(2);
hold on;
plot(slowX, slowpath(:,9)/1.5, '-', 'linewidth', 2, 'color', green);
plot(slowX, slowpath(:,11)/4, '-', 'linewidth', 2, 'color',red);
plot(slowX, slowpath(:,13)/5, '-', 'linewidth', 2, 'color',blue);

plot(slowX, slowpath(:,2), '--', 'linewidth', 2, 'color',orange);
plot(slowX, slowpath(:,4), '--', 'linewidth', 2, 'color',purple);
plot(slowX, slowpath(:,6), '--', 'linewidth', 2, 'color',pink);
hold off;

xlim([1,14]);
legend('DoF2', 'DoF4', 'DoF6', 'Vel2', 'Vel4', 'Vel6');
xlabel('Time step');
ylabel('Value');
%}

figure(3);

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
hold on;
h1 = plot(fastpath(:,2), fastpath(:,9), '-', 'linewidth', 2 , 'color', green);
h2 = plot(slowpath(:,2), slowpath(:,9), '--', 'linewidth', 2, 'color', blue);
h3 = quiver (fastV0(:,1),fastV0(:,2), fastP(:,1), fastP(:,2), 0.3, 'color', green, 'linewidth', 1); 
h4 = quiver (slowV0(:,1),slowV0(:,2), slowP(:,1), slowP(:,2), 0.3, 'color', blue, 'linewidth', 1); 
xlabel('Position');
ylabel('Velocity');
legend([h1, h2], {'non-zero goal velocity', 'zero goal velocit'});
hold off;



%{
figure(4);
hold on;
plot(slowpath(:,2), slowpath(:,9)/1.5, 'linewidth', 2, 'color', green);
plot(slowpath(:,4), slowpath(:,11)/4, 'linewidth', 2, 'color', blue);
xlabel('DoF2');
ylabel('Vel DoF2');
hold off;
%}


