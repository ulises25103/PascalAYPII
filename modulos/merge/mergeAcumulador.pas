procedure mergeAcumulador (v: vectorListas; var listaUnica: listaGastos);
var 
    gastoActual, min: gasto;
    i:integer;
begin
    listaUnica:= listaGastos.create();
for i:= 1 to cant do
    v[i].reset();
    minimo (v, min);
while (min.tipo <> ‘zzz’) do begin
    gastoActual.tipo:= min.tipo; 
    gastoActual.monto:=0;
while (min.tipo = gastoActual.tipo) do begin
    gastoActual.monto:= gastoActual.monto + min.monto;
    minimo (v, min);
    end;
        listaUnica.addFirst(gastoActual);
    end;
end; 