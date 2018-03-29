% usage: function [NewChrom, FitNew] =
% crowding(OldChrom,NewChrom,FitOld,FitNew);
%
% OldChrom : the individuals chosen to be parents
% NewChrom: their children
% performs deterministic crowding as outlined on page 94 of the textbook
% this is the high level algorithm
%   written by Danica Reardon (d.reardon@live.com)
function [ChromSel, FitSel] = crowding(OldChrom,NewChrom,Dist);
    [m,n] = size(OldChrom);
    FitOld = tspfun(OldChrom,Dist);
    FitNew = tspfun(NewChrom,Dist);
    ChromSel = zeros(m,n);
    FitSel = zeros(m,1);
    for i = 1:2:m
        T = crowding_dist(OldChrom(i,:),OldChrom(i+1,:),NewChrom(i,:),NewChrom(i+1,:));
        if T(1) < T(2)
            [ChromSel(i,:), FitSel(i,1)] = crowd_tournament(OldChrom(i,:),NewChrom(i,:),FitOld(i,1),FitNew(i,1));
            [ChromSel(i+1,:), FitSel(i+1,1)] = crowd_tournament(OldChrom(i+1,:),NewChrom(i+1,:),FitOld(i+1,1),FitNew(i+1,1));
        else
            [ChromSel(i,:), FitSel(i,1)] = crowd_tournament(OldChrom(i,:),NewChrom(i+1,:),FitOld(i,1),FitNew(i+1,1));
            [ChromSel(i+1,:), FitSel(i+1,1)] = crowd_tournament(OldChrom(i+1,:),NewChrom(i,:),FitOld(i+1,1),FitNew(i,1));
        end
    end
end