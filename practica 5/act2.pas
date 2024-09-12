program untitled;
const
dimF = 20;
type
vectContador = array[1..dimF] of real;

function sumatoria_rec(v: vectContador; i: integer): real;
begin	
if i <> 1 then 
	sumatoria_rec:= sumatoria_rec(v, i-1) + v[i]
else 
	sumatoria_rec:= v[i];

end;

procedure cargarV(var v: vectContador);
var
	i,j:integer;
begin
for i:= 1 to dimF do
	v[i]:= random(100 - 1) +1;
for j:= 1 to dimF do
	writeln(v[j]:2:2);
end;
var
v: vectContador;
BEGIN
randomize;
cargarV(v);
sumatoria_rec(v,dimF);	
writeln('Σ: ', sumatoria_rec(v,dimF):2:2);
END.

