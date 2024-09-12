program ejer1;
const
cantAnios = 2020;
cantMeses = 12;

type 
vectorTemp = array[2000..cantAnios, 1..cantMeses] of integer;

procedure CargarMatriz(var vt: vectorTemp);
var
anios, meses: integer;
begin
randomize;
for anios:= 2000 to cantAnios do begin
	for meses:= 1 to cantMeses do begin
		vt[anios, meses]:= random(30);
	end;
end;

end;


procedure imprimirMatrizMes_ano(vt: vectorTemp);
var
anios, meses: integer;
begin
writeln('MESES X ANOS: ');
for meses:= 1 to cantMeses do begin
	for anios:= 2000 to cantAnios do begin
		// write('anio: ', anios, ' mes: ', meses, ' temperatura promedio: '); 
		write(vt[anios, meses]:2, ' '); // Corregido: se elimina ":10:2"
	end;
	writeln;
end;
end;

procedure imprimirMatrizAno_mes(vt: vectorTemp);
var
anios, meses: integer;
begin
writeln('ANOS X MESES: ');
for anios:= 2000 to cantAnios do begin
	for meses:= 1 to cantMeses do begin
		// write('anio: ', anios, ' mes: ', meses, ' temperatura promedio: '); 
		write(vt[anios, meses]:2, ' '); // Corregido: se elimina ":10:2"
	end;
	writeln;
end;
end;

procedure calcPromedio(vt: vectorTemp);
var
anios, meses: integer;
promedio: real;
begin
writeln('PROMEDIO X MES ');
for anios:= 2000 to cantAnios do begin
promedio:= 0;
	for meses:= 1 to cantMeses do begin
		promedio := promedio + vt[anios,meses];
	end;
	writeln(' el promedio del anio: ', anios,' es: ', promedio/12:10:2);
end;
end;

procedure tempBaja(vt: vectorTemp);
var
mesMenor, anioMenor,anios,meses: integer;
menorTemperatura: real;
begin
mesMenor:=0;
anioMenor:= 0;
menorTemperatura:= 99999;

for anios:= 2000 to cantAnios do begin
	for meses:= 1 to cantMeses do begin
		if vt[anios,meses] < menorTemperatura then begin
			mesMenor:= meses;
			anioMenor:= anios;
			menorTemperatura:= vt[anios,meses];
	end;
	end;
end;

writeln('el anio con menos temperatura es: ', anioMenor,' y el mes es: ', mesMenor, ' y la temperatura es: ', menorTemperatura:10:2);

end;

var
vt: vectorTemp;
begin
randomize;
CargarMatriz(vt);
imprimirMatrizMes_ano(vt);
imprimirMatrizAno_mes(vt);
calcPromedio(vt);
tempBaja(vt);

end.



