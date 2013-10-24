% Hrothgar, 15 Oct 2013
% Loop through Wiener trials, plotting them
% for some visual guidance.

function wiener_plots(N, seed)

onlywinners = false;         % only show winners

if nargin < 1,              % number of time steps
    N = 20000;               % (inverse of dt)
end
if nargin < 2,
    seed = randi(2^31);
end

while 1,
    % execute the trial
    [winding,Z] = wiener(N, seed);

    circled = max(abs(winding)) >= 1;

    if circled,
        disp([num2str(seed) ' circled the origin.'])
    else
        disp([num2str(seed) ' did not circle the origin.'])
    end

    if ~onlywinners || circled,
        wiener_plot(winding,Z);
        subplot(2,1,1);
        title(['Wiener process for N = ' num2str(N) ...
            ', seed = ' num2str(seed)]);
        pause;
    end

    seed = seed + 1;
end

return
