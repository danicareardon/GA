% pmx crossover for TSP
% this crossover assumes that the path representation is chosen for the TSP
% problem.  based off of the xalt_edges.m by kuleuven 2002
% modified by Danica Reardon (d.reardon@live.com)
%
% Syntax:  NewChrom = pmx_crossover(OldChrom, XOVR)
%
% Input parameters:
%    OldChrom  - Matrix containing the chromosomes of the old
%                population. Each line corresponds to one individual
%                (in any form, not necessarily real values).
%    XOVR      - Probability of recombination occurring between pairs
%                of individuals.
%
% Output parameter:
%    NewChrom  - Matrix containing the chromosomes of the population
%                after mating, ready to be mutated and/or evaluated,
%                in the same format as OldChrom.

function NewChrom = pmx_crossover(OldChrom, XOVR);
if nargin < 2, XOVR = NaN; end
   
[rows,cols]=size(OldChrom);
   
    maxrows=rows;
    if rem(rows,2)~=0
       maxrows=maxrows-1;
    end
   
    for row=1:2:maxrows

	if rand<XOVR			% recombine with a given probability
		Children = pmx(OldChrom(row,:),OldChrom(row+1,:));
        NewChrom(row,:) = Children(1,:);
        NewChrom(row+1,:) = Children(2,:);
		
	else
		NewChrom(row,:)=OldChrom(row,:);
		NewChrom(row+1,:)=OldChrom(row+1,:);
	end
   end
    
    if rem(rows,2)~=0
       NewChrom(rows,:)=OldChrom(rows,:);
    end

% End of function

end