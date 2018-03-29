% low level function for calculating an offspring
% given 2 parent in the Parents - agrument
% represent the genocode of the parent
% modified by Danica Reardon d.reardon@live.com

function [Offspring]=pmx(OldChrom1,OldChrom2);
    [~,n] = size(OldChrom1);
    Offspring = zeros(2,n);
    
    % determine the map size
    ran = randi([1,n],1,2);
    start_pos = min(ran);
    end_pos = max(ran);
    ran = start_pos:end_pos;
    [~,map_m] = size(ran);
    Map = zeros(map_m,2);
    
    % create the map
    for i = 1:map_m
        Value = ran(i);
        Map(i,1) = OldChrom1(1,Value);
        Map(i,2) = OldChrom2(1,Value);
    end
    
    % create the offspring
    for i = start_pos:end_pos
        Offspring(1,i) = OldChrom1(1,i);
        Offspring(2,i) = OldChrom2(1,i);
    end
    
    % populate the rest of the values
    for i = 1:n
        if(Offspring(1,i) == 0)
            Value = OldChrom2(1,i);
            Value_pos = find(Map(:,1)==Value);
            [Flag, ~] = size(Value_pos);
            if Flag == 0
                Offspring(1,i) = Value;
            else
                for j = 1:map_m
                    New_Value = Map(Value_pos,2);
                    Value_pos2 = find(Map(:,1)==New_Value);
                    [Flag, ~] = size(Value_pos2);
                    if Flag == 0
                        Offspring(1,i) = New_Value;
                    else
                        Value_pos = Value_pos2;
                    end
                end
            end
        end
    end
    for i = 1:n
        if(Offspring(2,i) == 0)
            Value = OldChrom1(1,i);
            Value_pos = find(Map(:,2)==Value);
            [Flag, ~] = size(Value_pos);
            if Flag == 0
                Offspring(2,i) = Value;
            else
                for j = 1:map_m
                    New_Value = Map(Value_pos,1);
                    Value_pos2 = find(Map(:,2)==New_Value);
                    [Flag, ~] = size(Value_pos2);
                    if Flag == 0
                        Offspring(2,i) = New_Value;
                    else
                        Value_pos = Value_pos2;
                    end
                end
            end
        end
    end
end