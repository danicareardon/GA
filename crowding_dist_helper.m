% usage: function Dist =
% crowding(OldChrom,Value,i);
%
% OldChrom : an individual parent
% Value: the value the child that will be found
% i: the index that this value occurs at
% a helper function to get the tournament distances
%   written by Danica Reardon (d.reardon@live.com)
function Dist = crowding_dist_helper(OldChrom,Value,i);
    j = find(OldChrom==Value);
    Dist = abs(j - i);
end
