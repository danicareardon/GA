% usage: function Dist =
% crowding(OldChrom,Value,i);
%
% OldChrom1: an individual parent
% OldChrom2: an individual parent
% Chrom1: a child
% Chrom2: a child
% returns Dist where
%   Dist(1) = dist(p1,c1)
%   Dist(2) = dist(p2,c1)
%   Dist(3) = dist(p1,c2)
%   Dist(4) = dist(p2,c2)
%   written by Danica Reardon (d.reardon@live.com)
function [T] = crowding_dist(OldChrom1,OldChrom2,Chrom1,Chrom2);
    [~,n] = size(OldChrom1);
    dist = zeros(4,n);
    for i = 1:n
        dist(1,i) = crowding_dist_helper(OldChrom1(1,:),Chrom1(1,i),i);
        dist(2,i) = crowding_dist_helper(OldChrom2(1,:),Chrom1(1,i),i);
        dist(3,i) = crowding_dist_helper(OldChrom1(1,:),Chrom2(1,i),i);
        dist(4,i) = crowding_dist_helper(OldChrom2(1,:),Chrom2(1,i),i);
    end
   T(1) = sum(dist(1,:)) + sum(dist(4,:));
   T(2) = sum(dist(2,:)) + sum(dist(3,:));
end