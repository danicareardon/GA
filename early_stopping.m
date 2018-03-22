function Ret = early_stopping(sObjV,stopN,gen,ngen,best);
    Ret = 0;
    
    if (sObjV(stopN)-sObjV(1) <= 1e-15)
        Ret = 1;
    end
    
    if (gen>ngen)
        same = 1;
        for i=1:ngen
            if (best(gen)~=best(gen-1))
                same = 0;          
            end
            if same == 1
                Ret = 1;
            end
        end
    end