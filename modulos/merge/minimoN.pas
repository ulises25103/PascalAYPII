procedure minimo (var estantes: vector; var min:libro);
var 
    i,posmin :integer;
Begin
    min.titulo:= ‘zzz’;
For i:= 1 to cantEstantes do
    if not(estantes[i].eol()) then
    if estantes[i].current().titulo<= min.titulo then
        begin        
            min:= estantes[i].current();
            posmin:=i
        end;
if min.titulo<> ‘zzz’ then
    estantes[posmin].next();
end;
