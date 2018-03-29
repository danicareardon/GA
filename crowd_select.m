% usage: OldChrom = crowd_select(OldChrom);
%
% OldChrom : the individuals chosen to be parents
% NewChrom: a random shuffling of the parents
% performs deterministic crowding as outlined on page 94 of the textbook
% this is the high level algorithm
%   written by Danica Reardon (d.reardon@live.com)
function OldChrom = crowd_select(OldChrom);
    [m,~] = size(OldChrom);
    [~, shuf] = sort(rand(m, 1));
    OldChrom = OldChrom(shuf,:);
    