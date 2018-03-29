%
% ObjVal = tspfun_path(Phen, Dist)
% Implementation of the TSP fitness function
%	Phen contains the phenocode of the matrix coded in path
%	representation
%	Dist is the matrix with precalculated distances between each pair of cities
%	ObjVal is a vector with the fitness values for each candidate tour (=each row of Phen)
%
%   written by Danica Reardon (d.reardon@live.com)
%   based off of the template implementation

function ObjVal = tspfun(Phen, Dist);
    [m,n]=size(Phen);
    ObjVal = zeros(m,1);
    
    for d=1:m
        ObjVal(d) = Dist(Phen(d,1),Phen(d,n));
        for i=1:(n-1)
            ObjVal(d)=ObjVal(d)+Dist(Phen(d,i),Phen(d,i+1));
        end
    end
% End of function