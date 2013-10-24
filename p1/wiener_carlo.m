% Hrothgar, 15 Oct 2013

diary off;
diary('log.txt');
diary on;
tic;

N = 10000;                              % discretization parameter
seed = randi(2^31);
loginterval = 20000;
disp(['seed = ' num2str(seed) ', N = ' num2str(N)])
k = 0;

maxwinds = zeros(1,loginterval);        % vector of max winding numbers
hittings = zeros(1,loginterval);        % hitting times

while 1,                                % loop through
    [winding,Z] = wiener(N, seed+k);    % run the process
    maxwinds(k+1) = max(abs(winding));  % record the data
    if maxwinds(k+1) >= 1,
        hittings(k+1) = find(abs(winding) > 1, 1)/(N+1);
    end

    if mod(k,loginterval) == 0,
        pct = sum(maxwinds>=1)/(k+1);
        t = toc;
        disp(['t=' num2str(t,'%.0f') 's, iter #' num2str(k+1) ...
            ', pct_circled = ' num2str(pct,'%.16f')])
        maxwinds = [maxwinds zeros(1,loginterval)];
        diary off;
        diary on;                       % triggers printing to diary
    end
    k = k + 1;
end

% figure(1); clf; hold on
% hist(maxwinds,100)
% pct = sum(maxwinds>=1)/length(maxwinds);
% disp(['pct_circled = ' num2str(pct)])
