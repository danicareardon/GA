function Table=cross_edge_finder(Table,Val);
    [n,~] = size(Table);
    
    p = find(Table == Val);
    [m,~] = size(p);
    
    for i = 1:m
        if p(i) - n > 0
            Table(p(i)) = 0;
        end
    end
    