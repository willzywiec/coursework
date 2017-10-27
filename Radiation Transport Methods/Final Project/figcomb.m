% Will Zywiec
% Rensselaer Polytechnic Institute
% Radiation Transport Methods
% May 11, 2013
%
% figcomb.m
%
% This script combines four figures saved from the output of final.m

clear
clc

fig1 = open('Fig1.fig');
fig2 = open('Fig2.fig');
fig3 = open('Fig3.fig');
fig4 = open('Fig4.fig');

ax1 = get(fig1,'Children');
ax2 = get(fig2,'Children');
ax3 = get(fig3,'Children');
ax4 = get(fig4,'Children');

for i = 1:numel(ax2)
    ax2figc = get(ax2(i),'Children');
    copyobj(ax2figc,ax1(i));
end

for i = 1:numel(ax3)
    ax3figc = get(ax3(i),'Children');
    copyobj(ax3figc,ax1(i));
end

for i = 1:numel(ax4)
    ax4figc = get(ax4(i),'Children');
    copyobj(ax4figc,ax1(i));
end

close(fig2);
close(fig3);
close(fig4);