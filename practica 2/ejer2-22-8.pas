program precipitaciones;
const
cantMes = 12;
cantAnios = 2020;

type
vectPrecip = array[2000..cantAnios, 1..cantMes] of integer;

procedure inicializarMatriz(var vt: vectPrecip);
var
anios, meses: integer;
begin
randomize;
for anios:= 2000 to cantAnios do begin
	for meses:= 1 to cantMes do begin
		vt[anios, meses]:= 0;
	end;
end;

end;


procedure cargarMatriz(var vt: vectPrecip);
var
anios, mes, precipitacion: integer;
seguir: boolean;
begin
anios:= 0;
mes:= 0;
precipitacion:=0;
seguir:= true;
while seguir = true do begin
	write('ingrese el ano: '); readln(anios);
		if (anios >= 2000) and (anios<= 2020) then begin
			write('ingrese el mes: '); readln(mes);
			write('ingrese la precipitacion: '); readln(precipitacion);
			vt[anios,mes]:= precipitacion;
		end
		else
			seguir:= false;
	end;
end;


procedure imprimirMatrizMes_ano(vt: vectPrecip);
var
anios, meses: integer;
begin
writeln('MESES X ANOS: ');
for meses:= 1 to cantMes do begin
	for anios:= 2000 to cantAnios do begin
		// write('anio: ', anios, ' mes: ', meses, ' temperatura promedio: '); 
		write(vt[anios, meses]:2, ' '); // Corregido: se elimina ":10:2"
	end;
	writeln;
end;
end;

var
vt: vectPrecip;
begin
inicializarMatriz(vt);
cargarMatriz(vt);
imprimirMatrizMes_ano(vt);

end.
