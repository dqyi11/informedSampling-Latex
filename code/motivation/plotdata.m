
fastX = [1:1:45]';
slowX = [1:1:14]';

green = [49,163,84]/255;
red = [222 45 38]/255;
blue = [49,130,189]/255;
orange = [230,85,13]/255;
purple = [117,107,177]/255;
pink = [197,27,138]/255;


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

