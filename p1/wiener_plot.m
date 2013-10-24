% Hrothgar, 15 Oct 2013
% Plot a single wiener trial.

function wiener_plot(winding, Z)

figure(1); clf;
N = length(winding) - 1;
X = real(Z);
Y = imag(Z);

% 1st subplot: the 2D wiener process itself.
subplot(2,1,1); hold on
plot(1.3*[min(-.3,min(X)) max(X)], [0 0], 'b-')
plot([0 0], 1.3*[min(Y) max(Y)], 'b-')
plot(X,Y,'k-')
plot(X(1),Y(1),'g.','markersize',30)
plot(X(end),Y(end),'r.','markersize',30)
xlabel('X(t)','FontSize',24)
ylabel('Y(t)','FontSize',24,'Rotation',0)
axis equal, axis off

% 2nd subplot: the winding number with time.
subplot(2,1,2); hold on
N = length(winding);
plot(linspace(0,1,N), winding)
plot([0 0; 1 1], [1 -1; 1 -1], 'r--')
set(gca,'xtick',[],'Xcolor','w','box','off')
ylim([min(-1.25,min(winding)), max(1.25,max(winding))])
xlabel('time','FontSize',24)
ylabel('winding number','FontSize',24)

return
