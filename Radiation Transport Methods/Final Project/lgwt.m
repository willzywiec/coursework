function [u,w] = lgwt(N)

% lgwt.m
%
% This script is for computing definite integrals using Legendre-Gauss 
% Quadrature. It computes the Legendre-Gauss nodes and weights on an 
% interval [-1,1] with truncation order N.
%
% The sign of u has been corrected. - W.Z.
%
% Written by Greg von Winckel - 02/25/2004
%
% Modified by Will Zywiec - 05/10/2013

N = N - 1;
N1 = N + 1; N2 = N + 2;

xu = linspace(-1,1,N1)';

% Initial guess
y = cos((2*(0:N)'+1)*pi/(2*N+2)) + (0.27/N1)*sin(pi*xu*N/N2);

% Legendre-Gauss Vandermonde Matrix
L = zeros(N1,N2);

% Derivative of LGVM
Lp = zeros(N1,N2);

% Compute the zeros of the N+1 Legendre Polynomial
% using the recursion relation and the Newton-Raphson method

y0 = 2;

% Iterate until new points are uniformly within epsilon of old points
while max(abs(y - y0)) > eps
    L(:,1) = 1;
    Lp(:,1) = 0;
    L(:,2) = y;
    Lp(:,2) = 1;
    for k = 2:N1
        L(:,k + 1)=((2*k - 1)*y.*L(:,k) - (k - 1)*L(:,k - 1))/k;
    end
    Lp = (N2)*( L(:,N1) - y.*L(:,N2) )./(1 - y.^2);   
    y0 = y;
    y = y0 - L(:,N2)./Lp;
end

% Linear map from [-1,1] to [a,b]
u = -((-1*(1 - y) + (1 + y))/2);      

% Compute the weights
w = (2)./((1 - y.^2).*Lp.^2)*(N2/N1)^2;