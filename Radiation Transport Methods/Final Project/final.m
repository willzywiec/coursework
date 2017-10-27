% Will Zywiec
% Rensselaer Polytechnic Institute
% Radiation Transport Methods
% May 11, 2013
%
% final.m
%
% This script solves isotropically-scattering, one-group, planar geometry 
% neutron transport problems using diamond-differenced iterative Sn and 
% Gauss-Seidel iterative diffusion methods. A uniform cell distribution 
% is applied to material regions to simplify user input while allowing for
% solutions to complex heterogeneous systems. Error messages are only
% written for internal source input.
%
% This script calls function [u,w] = lgwt(N) to calculate Gauss-Legendre 
% nodes and weights on an interval [-1,1] with truncation order N. This 
% function was originally written by Greg von Winckel, but was modified 
% for use in this script.
%
% Individual graphs were saved and combined using figcomb.m.
%
% Acknowledgements:
% Dr. Wei Ji
% Andrew Pavlou

% Diamond-Differenced Iterative Sn Method

clear
clc

% Input

h = input('Enter cell width (cm): ');
x = input('Enter slab width (cm): ');

ct = ['Cell total: ',num2str(x/h)];
disp(ct);

m = input('Enter the number of material regions: ');
mt = x/h/m;
mt2 = ['Cells per material region: ',num2str(mt)];
disp(mt2);

k = 0;

for i = 1:m
    k = k + 1;
    ci = ['Enter scattering ratio (c) of region ',num2str(k),': '];
    c2(i) = input(ci);
    ti = ['Enter macroscopic total cross-section of region ',num2str(k),': '];
    t2(i) = input(ti);
    a2(i) = t2(i) - c2(i);
end

t3 = repmat(t2,mt,1);
t = transpose(t3(:)); % Macroscopic total cross-sections
a3 = repmat(a2,mt,1);
a = transpose(a3(:)); % Macroscopic absorption cross-sections

f = input('Enter left boundary condition (1 = Isotropic incident flux , 2 = Vacuum , 3 = Reflector): ');
f2 = input('Enter right boundary condition (1 = Isotropic incident flux , 2 = Vacuum , 3 = Reflector): ');
N = input('Enter order of Gauss-Legendre quadrature set: ');

Q2 = input('Enter internal source (Q) value: ');
if Q2 > 0
    lbs = ['Enter left source boundary cell (1 - ',num2str(x/h),'): ']; % Calculates source boundaries
    Q3 = input(lbs);
    if Q3 >= (x/h)
        error('Invalid left source boundary');
    end
    if Q3 < 1
        error('Invalid left source boundary');
    end
    rbs = ['Enter right source boundary cell (',num2str(Q3),' - ',num2str(x/h),'): ']; % Updates source boundaries
    Q4 = input(rbs);
    if Q4 > (x/h)
        error('Invalid right source boundary');
    end
    if (Q4 - Q3) < 0
        error('Invalid source boundaries');
    end
    if (Q4 - Q3) == 0
        disp('Internal point source');
    end
else
    Q3 = 1;
    Q4 = x/h;
end

ep = input('Enter convergence criterion exponent (10^-?): ');
ep = 10^-(ep);

Q = zeros(1,x/h);
Q(Q3:Q4) = Q2;

[u,w] = lgwt(N);

phi0old = 0.000001*ones(1,x/h);
phi0new = zeros(1,x/h);
phi1new = zeros(1,x/h);

k = 0;

while max(abs(phi0new - phi0old)) >= ep
    phi0old = phi0new;
    phi1old = phi1new;
    phi0new = zeros(1,x/h);
    phi1new = zeros(1,x/h);
    psiin = zeros(1,N);
    if f == 1
        for n = (N/2 + 1):N
            psiin(n) = ((sum(w(1:n)) - 1)^2 - (sum(w(1:(n-1))) - 1)^2)/(2*u(n)*w(n));
        end
    end
    if f == 3
        psiin = fliplr(psiin);
    end
    for j = 1:(x/h)
        for n = (N/2 + 1):N
            s(n,j) = 0.5*((t(j) - a(j))*phi0old(j) + Q(j));
            psiout(n) = (1 - t(j)*h/(2*u(n)))/(1 + t(j)*h/(2*u(n)))*psiin(n) + s(n,j)*h/u(n)/(1 + t(j)*h/(2*u(n)));
            psiavg = 0.5*psiout(n) + 0.5*psiin(n);
            phi0new(j) = phi0new(j) + psiavg*w(n);
            phi1new(j) = phi1new(j) + u(n)*psiavg*w(n);
            psiin(n) = psiout(n);
        end
    end
    if f2 == 1
        for n = 1:(N/2)
            psiin(n) = ((sum(w(1:n)) - 1)^2 - (sum(w(1:(n-1))) - 1)^2)/(2*u(n)*w(n));
        end
    end
    if f2 == 3
        psiin = fliplr(psiin);
    end
    for j = (x/h):-1:1
        for n = 1:(N/2)
            s(n,j) = 0.5*((t(j) - a(j))*phi0old(j) + Q(j));
            psiout(n) = (1 + t(j)*h/(2*u(n)))/(1 - t(j)*h/(2*u(n)))*psiin(n) - s(n,j)*h/u(n)/(1 - t(j)*h/(2*u(n)));
            psiavg = 0.5*psiout(n) + 0.5*psiin(n);
            phi0new(j) = phi0new(j) + psiavg*w(n);
            phi1new(j) = phi1new(j) + u(n)*psiavg*w(n);
            psiin(n) = psiout(n);
        end
    end
    k = k+1;
end

k2 = ['Nit = ',num2str(k)];
disp(k2);
pl = ['DD Sn Phi(0) = ',num2str(phi0new(1))];
disp(pl);
pc = ['DD Sn Phi(',num2str(x/h/2),') = ',num2str(phi0new(x/h/2))];
disp(pc);
pr = ['DD Sn Phi(',num2str(x/h),') = ',num2str(phi0new(x/h))];
disp(pr);

ss = get(0,'ScreenSize');
figure('Position',[(ss(1) + 100),(ss(2) + 100),(ss(3) - 200),(ss(4) - 200)]);
subplot(1,3,1),semilogy(0:h:(x - h),phi0new);
title('Diamond-Differenced Iterative Sn Method');
xlabel('x (cm)');
ylabel('\phi');
u = transpose(u);
w = transpose(w);
for n = 1:N
    upw(n) = abs(u(n))*psiout(n)*w(n);
end
hold on;
subplot(1,3,2),plot(1:N,upw);
title('Diamond-Differenced Iterative Sn Method');
xlabel('N');
ylabel('\mu \psi w');

% Gauss-Seidel Iterative Diffusion Method (Using Vector Arrays)
% Cell-edged Discretization

D = 1/3;

if f == 1 % Left boundary isotropic incident flux
    A(1) = D/h + 0.5*a(1)*h + 0.5;
elseif f == 2 % Left boundary vacuum
    A(1) = D/h + 0.5*a(1)*h + 0.5;
elseif f == 3 % Left boundary reflector
    A(1) = D/h + 0.5*a(1)*h;
end

if f == 1 % Left boundary isotropic incident flux
    S(1) = 0.5*Q(1)*h + 1;
elseif f == 2 % Left boundary vacuum
    S(1) = 0.5*Q(1)*h;
elseif f == 3 % Left boundary reflector
    S(1) = 0.5*Q(1)*h;
end

a(x/h + 1) = a(x/h);

if f2 == 1 % Right boundary isotropic incident flux
    A(x/h + 1) = D/h + 0.5*a(x/h + 1)*h + 0.5;
elseif f2 == 2 % Right boundary vacuum
    A(x/h + 1) = D/h + 0.5*a(x/h + 1)*h + 0.5;
elseif f2 == 3 % Right boundary reflector
    A(x/h + 1) = D/h + 0.5*a(x/h + 1)*h;
end

if f2 == 1 % Right boundary isotropic incident flux
    S(x/h + 1) = 0.5*Q(x/h)*h + 1;
elseif f2 == 2 % Right boundary vacuum
    S(x/h + 1) = 0.5*Q(x/h)*h;
elseif f2 == 3 % Right boundary reflector
    S(x/h + 1) = 0.5*Q(x/h)*h;
end

for j = 2:(x/h)
    A(j) = 2*D/h + a(j)*h;
    S(j) = Q(j)*h;
end

for j = 1:(x/h)
    B(j) = D/h;
end

phi = zeros(1,x/h + 1);
phiold = 0.000001*ones(1,x/h + 1);

k = 0;

while max(abs(phi - phiold)) >= ep
    phiold = phi;
    phi(1) = S(1)/A(1) + B(1)/A(1)*phiold(2);
    for j = 2:x/h
        phi(j) = S(j)/A(j) + B(j-1)/A(j)*phi(j-1) + B(j)/A(j)*phiold(j+1);
    end
    phi(x/h + 1) = S(x/h + 1)/A(x/h + 1) + B(x/h)/A(x/h + 1)*phi(x/h);
    k = k + 1;
end

phi2 = phi; % Stores cell-edged discretization values of Phi

pl2 = ['GS CE Phi(0) = ',num2str(phi2(1))];
disp(pl2);
pcc = 0.5*(phi2(x/h/2) + phi2(x/h/2 + 1));
pc2 = ['GS CE Phi(',num2str(x/h/2),') = ',num2str(pcc)];
disp(pc2);
pr2 = ['GS CE Phi(',num2str(x/h),') = ',num2str(phi2(x/h + 1))];
disp(pr2);

hold on;
subplot(1,3,3),semilogy(0:h:x,phi2,'r');
title('Gauss-Seidel Iterative Diffusion Method');
xlabel('x (cm)');
ylabel('\phi');

a(:,(x/h + 1)) = [];

% Gauss-Seidel Iterative Diffusion Method (Using Vector Arrays)
% Cell-centered Discretization

A = zeros(1,x/h);
B = zeros(1,x/h);
S = zeros(1,x/h);

if f == 1 % Left boundary isotropic incident flux
    A(1) = D/h + a(1)*h + (0.5*D/h)/(0.25 + D/h);
elseif f == 2 % Left boundary vacuum
    A(1) = D/h + a(1)*h + (0.5*D/h)/(0.25 + D/h);
elseif f == 3 % Left boundary reflector
    A(1) = D/h + a(1)*h;
end

if f == 1 % Left boundary isotropic incident flux
    S(1) = Q(1)*h + (2*D/h)/(0.25 + D/h)*0.5;
elseif f == 2 % Left boundary vacuum
    S(1) = Q(1)*h;
elseif f == 3 % Left boundary reflector
    S(1) = Q(1)*h;
end

if f2 == 1 % Right boundary isotropic incident flux
    A(x/h) = 2*D/h + a(x/h)*h;
elseif f2 == 2 % Right boundary vacuum
    A(x/h) = 2*D/h + a(x/h)*h;
elseif f2 == 3 % Right boundary reflector
    A(x/h) = D/h + a(x/h)*h;
end

if f2 == 1 % Right boundary isotropic incident flux
    S(x/h) = Q(x/h)*h + (2*D/h)/(0.25 + D/h)*0.5;
elseif f2 == 2 % Right boundary vacuum
    S(x/h) = Q(x/h)*h;
elseif f2 == 3 % Right boundary reflector
    S(x/h) = Q(x/h)*h;
end

for j = 2:(x/h - 1)
    A(j) = 2*D/h + a(j)*h;
    S(j) = Q(j)*h;
end

for j = 1:(x/h - 1)
    B(j) = D/h;
end

phi = zeros(1,x/h);
phiold = 0.000001*ones(1,x/h);

k = 0;

while max(abs(phi - phiold)) >= ep
    phiold = phi;
    phi(1) = S(1)/A(1) + B(1)/A(1)*phiold(2);
    for j = 2:(x/h - 1)
        phi(j) = S(j)/A(j) + B(j-1)/A(j)*phi(j-1) + B(j)/A(j)*phiold(j+1);
    end
    phi(x/h) = S(x/h)/A(x/h) + B(x/h - 1)/A(x/h)*phi(x/h - 1);
    k = k + 1;
end

pl3 = ['GS CC Phi(0) = ',num2str(phi(1) - 0.5*(phi(2) - phi(1)))];
disp(pl3);
pc3 = ['GS CC Phi(',num2str(x/h/2),') = ',num2str(phi(x/h/2) + 0.5*(phi(x/h/2 + 1) - phi(x/h/2)))];
disp(pc3);
pr3 = ['GS CC Phi(',num2str(x/h),') = ',num2str(phi(x/h) + 0.5*(phi(x/h) - phi(x/h - 1)))];
disp(pr3);

hold on;
subplot(1,3,3),semilogy(0:h:(x - h),phi,'g');
legend('Cell-edged','Cell-centered','Location','SouthEast');