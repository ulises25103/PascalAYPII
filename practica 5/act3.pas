program untitled;
const
dimF = 20;
type
vectContador = array[1..dimF] of real;

procedure imprimision_rec(v: vectContador; i: integer);
begin	
if i < dimF then
	imprimision_rec(v, i+1);
writeln(v[i]:2:0);
end;

procedure cargarV(var v: vectContador);
var
	i:integer;
begin
for i:= 1 to dimF do
	v[i]:= random(100 - 1) +1;
end;


var
v: vectContador;
BEGIN
randomize;
cargarV(v);
imprimision_rec(v,1);
END.

