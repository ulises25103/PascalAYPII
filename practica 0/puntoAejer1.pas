program asd;
var
num:integer;
a,b,f: integer;

begin
randomize;
writeln('ingrese el minimo:');
readln(a);
writeln('ingrese el maximo:');
readln(b);
num:= random(b-a+1)+a;
f:=-1;
while (f < a) or (f > b) do begin
writeln('ingrese el numero a buscar');
readln(f);
end;

while (num <> f) do begin
	num:= random(b-a+1)+a;
	writeln('el numero aleatorio es: ', num);
	end;

writeln('presione cualquier tecla para finalizar');
readln;

end.
