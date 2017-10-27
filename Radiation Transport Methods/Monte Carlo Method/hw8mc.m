% Will Zywiec
% Radiation Transport Methods
% Homework 8
%
% hw8mc.m
%
% Monte Carlo Method

clear
clc

t = 1;
a = input('Enter macroscopic cross-section of absorption: '); % Input
sc = t - a;

m = 0;
n = 0;
o = 0;
p = 0;

while n < 10^6
    n = n + 1;
    x = 0;
    mu = sqrt(rand(1));
    s = -1/t*log(rand(1));
    x = x + mu*s;
    if x > 15
        m = m + 1;
    end
    if x < 0
        o = o + 1;
    end
    if x > 0 && x < 15
        while x > 0 && x < 15
            if rand(1) < sc/t
                mu = 2*rand(1) - 1;
                s = -1/t*log(rand(1));
                x = x + mu*s;
            else
                p = p + 1;
                break
            end
            if x > 15
                m = m + 1;
            end
            if x < 0
                o = o + 1;
            end
        end
    end
end

probl = o/n % Left boundary leakage probability
ldev = 1/(sqrt(n))*sqrt(probl - probl^2) % Left boundary leakage standard deviation
proba = p/n % Absorption probability
adev = 1/(sqrt(n))*sqrt(proba - proba^2) % Absorption standard deviation
probr = m/n % Right boundary leakage probability
rdev = 1/(sqrt(n))*sqrt(probr - probr^2) % Right boundary leakage standard deviation