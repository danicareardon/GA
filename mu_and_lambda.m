% MU_AND_LAMBDA.M      
%
% This function performs mu and lambda selection
%
% Syntax: [Chrom, ObjVCh] = mu_and_lambda(Chrom, SelCh, ObjVCh, ObjVSel)
%
% Input parameters:
%    Chrom     - Matrix containing the individuals (parents) of the current
%                population. Each row corresponds to one individual.
%    SelCh     - Matrix containing the offspring of the current
%                population. Each row corresponds to one individual.
%    ObjVCh    - Column vector containing the objective values
%                of the individuals (parents - Chrom) in the current 
%                population, needed for fitness-based insertion
%                saves recalculation of objective values for population
%    ObjVSel   - Column vector containing the objective values
%                of the offspring (SelCh) in the current population, needed for
%                partial insertion of offspring,
%                saves recalculation of objective values for population
%
% Output parameters:
%    Chrom     - Matrix containing the individuals of the current
%                population after reinsertion.
%    ObjVCh    - if ObjVCh and ObjVSel are input parameter, than column 
%                vector containing the objective values of the individuals
%                of the current generation after reinsertion.

% modified by Danica Reardon (d.reardon@live.com) based off of the 
% function reins by:
% Author:     Hartmut Pohlheim
% History:    10.03.94     file created
%             19.03.94     parameter checking improved

function [Chrom, ObjVCh] = mu_and_lambda(Chrom, SelCh, ObjVCh, ObjVSel);

    % concatonate the matrixes into one
    [mu_m, mu_n] = size(Chrom);
    
    new_mu = cat(1,Chrom,SelCh);
    
    % concatonate the fitness functions into 1
    % and get the indices beside them in preparation of sorting
    objv = cat(1,ObjVCh, ObjVSel);
    [m,~] = size(objv);
    indices = (1:m)';
    
    new_objv = cat(2,objv,indices);
    new_objv = sortrows(new_objv);
    
    for i = 1:mu_m
        index = new_objv(i,2);
        ObjVCh(i,1) = new_objv(i,1);
        for j = 1:mu_n
            Chrom(i,j) = new_mu(index,j);
        end
    end
    

end