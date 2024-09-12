program ejer3;

type
	vectorRandom = array[1..50] of integer;

procedure CargarVector(var v: vectorRandom; min,max: integer);
	var 
		i: integer;
	begin
		randomize;
		for i:=1 to 50 do
			v[i] := random(max-min) + min;
	end;
var
	min,max: integer;
	vector: vectorRandom;

begin

writeln('Ingrese el minimo'); readLn(min);
writeln('Ingrese el maximo'); readLn(max);

CargarVector(vector, min, max)

end.
