procedure merge(e1, e2: listaLibros; 
var 
eNuevo: listaLibros);
var min: libro;

Begin
  eNuevo:= listaLibros.create();
  e1.reset(); e2.reset();
  minimo (e1, e2, min);
    while (min.titulo <> ‘zzz’) do
        begin
        eNuevo.add (min);
        minimo (e1, e2, min);
    end;
End; 