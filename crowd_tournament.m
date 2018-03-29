% usage: function [NewChrom, FitNew] =
% crowding(OldChrom,NewChrom,FitOld,FitNew);
%
% OldChrom : the individuals chosen to be parents
% NewChrom: their children
% FitOld: the fitness of the parents
% FitNew: the fitness of the children
% performs deterministic crowding as outlined on page 94 of the textbook
% this is the low level algorithm
%   written by Danica Reardon (d.reardon@live.com)
function [ChromSel, FitSel] = crowd_tournament(OldChrom,NewChrom,FitOld,FitNew);
    if FitNew > FitOld
        ChromSel = OldChrom;
        FitSel = FitOld;
    else
        ChromSel = NewChrom;
        FitSel = FitNew;
    end
end