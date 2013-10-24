% print the plots

% N = 5000, s = 1226670440

N = 20000;
seeds = [278271979,538469999,538470134,673656161,673656233];

for seed = seeds,
    [winding, Z] = wiener(N, seed);
    wiener_plot(winding, Z);
    subplot(2,1,1);
    title(['Wiener process for N = ' num2str(N) ...
        ', seed = ' num2str(seed)],'FontSize',24);
    print('-depsc2',['s' num2str(seed) '.eps']);
end
