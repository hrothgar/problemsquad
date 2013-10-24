% Hrothgar, 15 Oct 2013
% extended Higham's bpath2.m code

function [winding,Z] = wiener(N, seed)

if nargin < 1,              % number of time steps
    N = 1000;               % (inverse of dt)
end

if nargin < 2,              % random seed
    rng('shuffle');         % shuffle if not passed to function
else
    rng(seed);
end

T = 1;                      % discretization variables
dt = T/N;

dZ = sqrt(dt)*randn(1,N) ...% path increments
   + 1i*sqrt(dt)*randn(1,N); 
Z = [0 cumsum(dZ)];         % cumulative sum to get coordinates
Z = 1 + Z;                  % begin at (1,0)

argZ = angle(Z)/(2*pi);
dargZ = diff(argZ);
winding = argZ - cumsum([sign(argZ).*(abs([0 dargZ])>.5)]);

return
