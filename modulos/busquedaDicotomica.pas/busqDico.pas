function busquedaDicotomica(v: vectEnteros; buscar, min, max: integer):integer;
var medio: integer;
begin
if min > max then
        busquedaDicotomica:= -1
else
    begin
        medio:= (max + min) div 2;
	    if v[medio] = buscar then
		    busquedaDicotomica:= medio
	    else
		    if v[medio] > buscar then
			    busquedaDicotomica:= busquedaDicotomica(v, buscar, min, medio - 1)
		    else
			    busquedaDicotomica:= busquedaDicotomica(v, buscar, medio + 1, max);
	    end;
end;