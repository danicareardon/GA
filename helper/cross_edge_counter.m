function Nxt=cross_edge_counter(Table,Curr);
    [m,~] = size(Table);
    [~,n] = size(find(Curr(2:5) ~= 0));
    if n > 1
        Next = [0 10];
        for i = 2:5
            if Curr(i) ~= 0
                Chx = Curr(i);
                p = find(Table == Chx,1);
                [~,Cnt] = size(find(Table(p,2:5) ~= 0));
                if Cnt < Next(2)
                    Next = [Chx Cnt];
                elseif Cnt == Next(2)
                    r = randi([1,2],1,1);
                    if r == 2
                        Next = [Chx Cnt];
                    end
                end
            end
        end
        Nxt = Next(1);
    elseif m == 0
        Nxt = Curr(1);
    else
        r = randi([1,m],1,1);
        Nxt = Table(r,1);
    end
    
    