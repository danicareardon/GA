function Table=cross_edge_table(Parents);
    [~,n] = size(Parents);
    Table = zeros(n,7);
    
    % populate the table
    for i=1:n
        value = Parents(1,i);
        Table(i,1) = value;
        if i == 1
            Table(i,2) = Parents(1,n);
            Table(i,3) = Parents(1,i+1);
        elseif i == n
            Table(i,2) = Parents(1,n-1);
            Table(i,3) = Parents(1,1);
        else
            Table(i,2) = Parents(1,i-1);
            Table(i,3) = Parents(1,i+1);
        end
        pos = find(Parents(2,:) == value);
        if pos == 1
            v1 = Parents(2,n);
            v2 = Parents(2,pos+1);
        elseif pos == n
            v1 = Parents(2,n-1);
            v2 = Parents(2,1);
        else
            v1 = Parents(2,pos-1);
            v2 = Parents(2,pos+1);
        end
        
        j = 4;
        k = 6;
        if Table(i,2) ~= v1 && Table(i,3) ~= v1
            Table(i,j) = v1;
            j = j+1;
        else
            Table(i,k) = v1;
            k = k+1;
        end
        if Table(i,2) ~= v2 && Table(i,3) ~= v2
            Table(i,j) = v2;
        else
            Table(i,k) = v2;
        end
        
    end
    
    Table = sortrows(Table);