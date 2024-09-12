procedure minimo (var v: vectorListas; var min: gasto);
var 
    indiceMin,i:integer;
begin
    min.tipo:= 'zzz'; indiceMin:= -1;
for i:= 1 to cant do
    if (not v[i].eol ()) then 
        if (v[i].current().tipo <= min.tipo) then begin
            indiceMin:= i; 
            min:= v[i].current();
        end;
if (indiceMin <> -1) then 
    v[indiceMin].next();
end;