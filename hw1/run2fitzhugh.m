function result = run2fitzhugh(d)
tspan = 0:0.5:100;
y0 = [0.1;0.1;0;0];

[t,result] = ode15s(@(t,var) f2fitzhugh(t,var,d),tspan,y0);

%{
v1 = result(:,1);
v2 = result(:,2);
w1 = result(:,3);
w2 = result(:,4);

figure(1);
set(gca,'FontSize',18);
hold on; box on;
plot(t,v2,'Color',[0 0 1]);
xlabel('t'); ylabel('v2')

figure(2);
set(gca,'Fontsize',18);
hold on; box on;
plot(t,v1,'Color',[0 0 1]);
xlabel('t'); ylabel('v1');


figure(3);
set(gca,'Fontsize',18);
hold on; box on;
plot(t,w1,'Color',[0 0 1]);
xlabel('t'); ylabel('w1');

figure(4);
set(gca,'Fontsize',18);
hold on; box on;
plot(t,w2,'Color',[0 0 1]);
xlabel('t'); ylabel('w2');
%}
