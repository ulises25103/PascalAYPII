program asd;
var
ale:integer;
i: integer;

begin
randomize;

for i:= 1 to 20 do begin
ale:= random(30-20)+20;
writeln('el numero aleatorio es:', ale);
end;

writeln('presione cualquier tecla para finalizar');
readln;

end.
