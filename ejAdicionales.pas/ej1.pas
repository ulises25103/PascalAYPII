program ejer1;
const
cantVendedoras = 7;
cantVentas = 50;
type
ventas = record
    cod_producto: integer;
    precio: real;
    cant_vendidas: integer;
    fecha: record
        dia: integer;
        mes: integer;
    end;
end;

matrizVendedoras = array[1..cantVendedoras, 1..cantVentas] of ventas;

procedure cargarM(var m: matrizVendedoras);
var
vendedoras, ventas: integer;
begin
for vendedoras:= 1 to cantVendedoras do begin
    for ventas:=1 to cantventas do begin
        m[vendedoras,ventas].cod_producto:= random(4)+1;
        m[vendedoras,ventas].precio:= random(200 - 100) + 100;
        m[vendedoras,ventas].cant_vendidas:= random(20 - 1) + 1;
        m[vendedoras,ventas].fecha.dia:= random(31 - 1) + 1;
        m[vendedoras,ventas].fecha.mes:= random(12 - 1) + 1;
    end;
end;

end;

{procedure imprimirMatrizCant_vendidas(m: matrizVendedoras);
var
vendedoras, ventas: integer;
begin
for ventas:= 1 to cantVentas do begin
    for vendedoras:=1 to cantVendedoras do begin
        write(m[vendedoras, ventas].cant_vendidas, ' ');
    end;
    writeln;
end;

end; }

procedure ordenarM(var m: matrizVendedoras);
var
codProducto: integer;
begin
codProducto:= -1;
for vendedoras:= 1 to cantVendedoras do begin
    for ventas:=1 to cantventas do begin
        
    end;
end;

end;


var
m: matrizVendedoras;
begin
randomize;
cargarM(m);
{imprimirMatrizCant_vendidas(m);}



end.
