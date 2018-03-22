%
% ObjVal = tspfun(Phen, Dist)
% Implementation of the TSP fitness function
%	Phen contains the phenocode of the matrix coded in adjacency
%	representation
%	Dist is the matrix with precalculated distances between each pair of cities
%	ObjVal is a vector with the fitness values for each candidate tour (=each row of Phen)
%

function ObjVal = tspfun(Phen, Dist);
    [m,n] = size(Phen);
    ObjVal = zeros(m,1);
    
    for i = 1:m
        ObjVal(i) = Dist(Phen(i,1),Phen(i,n));
        for j = 1:(n-1)
            ObjVal(i) = ObjVal(i)+Dist(Phen(i,j),Phen(i,j+1));
        end
    end
% End of function

