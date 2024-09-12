procedure merge (estantes: vector; 
var 
eNuevo: listaLibros);
var min: libro;
    i: integer;
Begin
    eNuevo:= listaLibros.create();
For i:= 1 to cantEstantes do
    estantes [i].reset();
minimo (estantes, min);
while (min.titulo <> ‘ZZZ’) do
    begin
        eNuevo.add (min);
        minimo (estantes, min);
    end;
End;