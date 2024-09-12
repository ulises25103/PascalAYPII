program ejer2;
const
dimF = 10;
type

vectEnteros = array[1..dimF] of integer;

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

procedure buscar10(v: vectEnteros); 
var
max,min,buscar,i: integer;
encontrado, noEncontrado: integer;
begin
encontrado:= 0;
noEncontrado:= 0;
for i:= 1 to dimF do begin
    buscar:= random(1000 - 200) + 200;
    if v[i] = buscar then begin
        encontrado:= encontrado +1;
    end
    else begin
        noEncontrado:= noEncontrado +1;
    end;
end;
writeln('CANTIDAD DE VECES ENCONTRADO: ',encontrado, 'CANTIDAD DE VECES NO ENCONTRADO: ', noEncontrado);
end;
procedure OrdenPorSeleccion (var v: vectEnteros);
var
minIndex,temp,i,j: integer;
begin

for j:= 0 to dimF -1 do begin
	minIndex:= j;
	for i:= j+1 to dimF do begin
			if v[i] < v[minIndex] then begin
				minIndex:= i;
				end;
	end;
temp:=v[j];
v[j]:= v[minIndex];
v[minIndex]:= temp;

end; 


end;

var
v: vectEnteros;
nrandom: integer;
BEGIN
	randomize;
	cargarV(v);
	imprimirV(v);
	writeln('VECTOR ORDENADO ----------------------------------');
	OrdenPorSeleccion(v);
	imprimirV(v);
	writeln('BUSQUEDA DICOTOMICA ------------------------------');
	nrandom:= v[random(10-1)+1];
	writeln(nrandom);
	writeln(busquedaDicotomica(v,nrandom,1,10));
    writeln('RANDOM 10 ----------------------------------------');
    buscar10(v);
END.

