function Child=cross_edge2(Parents);
    [~,n] = size(Parents);
    
    Child = zeros(1,n);
    Nxt = randi([1,n],1,1);
    
    % populate the table
    Table = cross_edge_table(Parents);

    for i = 1:(n-1)
        Curr = Nxt;
        p = find(Table == Curr,1);
        Child(i) = Table(p,1);
        Choices = Table(p,:);
        Table(p,:) = [];
        if Choices(6) ~= 0 && Choices(7) ~= 0
            r = randi([6,7],1,1);
            Nxt = Choices(r);
            Table = cross_edge_finder(Table,Curr);
        elseif Choices(6) ~= 0
            Nxt = Choices(6);
            Table = cross_edge_finder(Table,Curr);
        else
            Nxt = cross_edge_counter(Table,Choices);
            Table = cross_edge_finder(Table,Curr);
        end
    end
    
    Child(n) = Table(p,1);
    
    
    
    
    
    