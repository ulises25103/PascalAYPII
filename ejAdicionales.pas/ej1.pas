program ejer1;
const
cantVendedoras = 7;
cantVentas = 50;
codProducto = 10;
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

resumen = record
    cantTotal: integer;
    montoTotal:real;
end;

mayor = record
    monto: real;
    codigo: integer;
end;

matrizVendedoras = array[1..cantVendedoras, 1..cantVentas] of ventas;
vectResumen = array[1..codProducto] of resumen;

procedure cargarM(var m: matrizVendedoras);
var
vendedoras, ventas: integer;
begin
for vendedoras:= 1 to cantVendedoras do begin
    for ventas:=1 to cantventas do begin
        m[vendedoras,ventas].cod_producto:= random(codProducto)+1;
        m[vendedoras,ventas].precio:= random(200 - 100) + 100;
        m[vendedoras,ventas].cant_vendidas:= random(5) + 1;
        m[vendedoras,ventas].fecha.dia:= random(31 - 1) + 1;
        m[vendedoras,ventas].fecha.mes:= random(12 - 1) + 1;
    end;
end;
end;

procedure InicializarVector(var v: vectResumen);
var i: integer;
begin
for i:= 1 to codProducto do
    v[i].cantTotal:= 0;
    v[i].montoTotal:= 0;
end;


procedure imprimirMatrizCant_vendidas(m: matrizVendedoras);
var
vendedoras, ventas: integer;
begin
for ventas:= 1 to cantVentas do begin
    for vendedoras:=1 to cantVendedoras do begin
        write(m[vendedoras, ventas].cod_producto, ' ');
    end;
    writeln;
end;

end;

function ordenarM( m: matrizVendedoras): matrizVendedoras;
var
i, j, k: integer;
temp: ventas;
begin
for i:= 1 to cantVendedoras do begin
    for j:= 1 to cantVentas - 1 do begin //no es necesario comparar el ultimo elemento
        for k:= 1 to cantVentas - j do begin //recorre las columnas que no estan ordenadas
            if m[i, k].cod_producto > m[i,k + 1].cod_producto then begin
                temp:= m[i,k];
                m[i,k]:= m[i,k+1];
                m[i,k+1]:= temp;
            end;
        end;
    end;
end;
ordenarM:= m;
end;

procedure crearResumen(var v: vectResumen; m: matrizVendedoras);
var
vendedoras, ventas: integer;
begin
InicializarVector(v);
for vendedoras:= 1 to cantVendedoras do begin
    for ventas:=1 to cantventas do begin
        v[m[vendedoras, ventas].cod_producto].cantTotal:= v[m[vendedoras, ventas].cod_producto].cantTotal + m[vendedoras, ventas].cant_vendidas;
        v[m[vendedoras, ventas].cod_producto].montoTotal:= v[m[vendedoras, ventas].cod_producto].montoTotal + m[vendedoras, ventas].precio;
    end;
end;
end;

procedure imprimirV(v: vectResumen);
var i: integer;
begin
for i:= 1 to codProducto do begin
    writeln('---------------------------------------');
    writeln('CODIGO DE PRODUCTO: ',i);
    writeln('CANTIDAD VENDIDA: ', v[i].cantTotal);
    writeln('MONTO TOTAL GENERADO POR EL PRODUCTO: ', v[i].montoTotal:2:0);
    end;
end;

function sumatoriaRec(v: vectResumen; i: integer; n: integer; m: mayor): mayor;
begin
// Condición base: si hemos recorrido todo el vector, devolvemos el mayor monto encontrado
if i > n then
    sumatoriaRec:= m
    else
    begin
    // verificamos si el monto actual es mayor al monto guardado
if v[i].montoTotal > m.monto then begin
    m.monto:= v[i].montoTotal;  
    m.codigo:= i;
    end;
    sumatoriaRec:= sumatoriaRec(v, i+1, n, m);
end;
end;

var
m: matrizVendedoras;
v: vectResumen;
my: mayor;
begin
randomize;
cargarM(m);
writeln('MATRIZ DESORDENADA -----------------------');
imprimirMatrizCant_vendidas(m);
writeln('MATRIZ ORDENADA -----------------------');
imprimirMatrizCant_vendidas(ordenarM(m));
crearResumen(v, ordenarM(m));
imprimirV(v);
my.monto:= -1;
my.codigo:= 0;
my:= sumatoriaRec(v,1, codProducto,my);
writeln('el producto mas vendido es: ', my.codigo,' con el monto: ', my.monto:2:0);
end.
