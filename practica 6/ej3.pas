program ejer2;
const
dimF = 10;
type

vectEnteros = array[1..dimF] of integer;

procedure cargarV(var v: vectEnteros);
var
i: integer;
begin

	for i:= 1 to dimF do 
		v[i]:= random(10- 200) + 200;
end;

procedure imprimirV(v: vectEnteros);
var
i: integer;
begin

for i:= 1 to dimF do
	writeln(v[i]);
end;

function busquedaDicotomica(v: vectEnteros; buscar, min, max: integer):boolean;
var medio: integer;
begin
if min > max then
busquedaDicotomica:= false
else
begin
medio:= (max + min) div 2;
	if v[medio] = buscar then
		busquedaDicotomica:= true
	else
		if v[medio] > buscar then
			busquedaDicotomica:= busquedaDicotomica(v, buscar, min, medio - 1)
		else
			busquedaDicotomica:= busquedaDicotomica(v, buscar, medio + 1, max);
	end;
end;

procedure buscar10(v: vectEnteros);
var 
i: integer;
buscar: integer;
encontrado, noEncontrado: integer;
aux: boolean;
begin
encontrado:= 0;
noEncontrado:= 0;
for i:= 1 to 10 do begin
    buscar:= random(10- 200) + 200;
    writeln(buscar);
    aux:= busquedaDicotomica(v,buscar, 1, dimF);
        if aux then
            encontrado:= encontrado +1
        else 
            noEncontrado:= noEncontrado +1;
end;

writeln('encontramos: ', encontrado,' numeros', ' y no encontramos: ', noEncontrado,' numeros.');
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
BEGIN
	randomize;
	cargarV(v);
	imprimirV(v);
	writeln('VECTOR ORDENADO ----------------------------------');
	OrdenPorSeleccion(v);
	imprimirV(v);
	writeln('BUSQUEDA DICOTOMICA ------------------------------');
	buscar10(v);

END.

