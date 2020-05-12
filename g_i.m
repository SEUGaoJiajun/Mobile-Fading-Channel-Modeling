function gi = g_i(c,f,theta,t)
% To simulate the deterministic processes tilde_g_i(t)
%   c: gains
%   f: discrete Doppler frequencies
%   theta: phases
%   t: instant
%   gi: calculated value
gi=sum(c.*cos(2*pi*f*t+theta));
end

