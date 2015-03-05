function k = fmodes(N,L)
% Returns the corresponding 1D Fourier modes for a vector of size N
%
% Usage:
%   k = fmodes(N,L);
%
% Returns the 1D Fourier modes for a vector of size N
% in the order returned by the FFT 
% If the physical length L is not specified, then a length
% L = 1 is assumed.
%
% Input:
%   N - size of vector, number of elements
%   L - physical length of data set (optional)
% Output:
%   k - Fourier modes in same order returned by FFT
%
% See also fmodes2


if nargin<2
    L=1;
end %if

if mod(N,2)==1; % if N is odd
    
        k = [1:(N-1)/2];
        k = [0 k -fliplr(k)];
        k = (2*pi/L)*k;

else %

        k = [1:N/2-1];
        k = [0 k -N/2 -fliplr(k)];
        k = (2*pi/L)*k;
        

end %if

% Created 6/20/2006 Jori
