program untitled;


function sumatoria_rec(n: integer): integer;
begin	
if n <> 1 then 
	sumatoria_rec:= sumatoria_rec(n-1) + n
else 
	sumatoria_rec:= 1;

end;

var
n: integer;
sumatoria: integer;
BEGIN
writeln('ingrese un numero para hacer la sumatoria');read(n);
sumatoria:= sumatoria_rec(n);	
writeln(sumatoria);
END.

