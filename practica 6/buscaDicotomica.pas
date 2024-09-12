program ej1;

type

vectEnteros = array[1..10] of integer;

procedure cargarV(var v: vectEnteros);
var
i: integer;
begin

	for i:= 1 to 10 do 
		v[i]:= random(1000 - 200) + 200;
end;

procedure imprimirV(v: vectEnteros);
var
i: integer;
begin

for i:= 1 to 10 do
	writeln(v[i]);
end;

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
var

v: vectEnteros;
BEGIN
	randomize;
	cargarV(v);
	imprimirV(v);
END.

