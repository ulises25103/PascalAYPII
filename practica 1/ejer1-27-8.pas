program untitled;
const
cantAlum = 1;
cantComi = 2;

TYPE
estudiantes = record
	nombre: string;
	apellido: string;
	nota: integer;
end;

matCatedra = array[1..cantComi, 1..cantAlum] of estudiantes;

procedure cargarMatriz(var mc: matCatedra);
var
comision, alumno: integer;
begin

for comision:= 1 to cantComi do begin
	for alumno:= 1 to cantAlum do begin
		writeln('ingrese el alumno numero: ', alumno,' de la comision: ', comision);
		write('nombre: '); readln(mc[comision,alumno].nombre);
		write('apellido: '); readln(mc[comision,alumno].apellido);
		write('nota: '); readln(mc[comision,alumno].nota);
	end;
end;
end;

procedure notaMaxima(mc: matCatedra);
var
comision, alumno: integer;
notaMax: integer;
nom,ap: string;
begin
notaMax:= -1;
for comision:= 1 to cantComi do begin
	for alumno:= 1 to cantAlum do begin
		if (mc[comision, alumno].nota > notaMax) then begin
			notaMax:= mc[comision, alumno].nota;
			nom:= mc[comision, alumno].nombre;
			ap:= mc[comision, alumno].apellido;
		end;
	end;
end;

writeln('el estudiante con la nota maxima es: ', nom,' ',ap, ' con la nota: ', notaMax);
end;

function encontrarNota(mc: matCatedra; nota: integer): boolean;
var
comision, alumno: integer;
encontrado: boolean;
begin
encontrado:= false;
comision:= 1;
while (not encontrado) and (comision <= cantComi) do begin
alumno:= cantAlum;
while (not encontrado) and (alumno <= cantAlum) do begin
		if (mc[comision, alumno].nota = nota) then begin
			encontrado:= true;
		end;
		alumno:= alumno +1;
	end;
	comision:= comision +1;
end;
encontrarNota:= encontrado;
end;

var
mc: matCatedra;
nota: integer;
BEGIN
	cargarMatriz(mc);
	notaMaxima(mc);
	writeln('ingrese la nota a buscar: '); readln(nota);
	
	if encontrarNota(mc, nota) then begin
		writeln('la nota fue encontrada!');
	end
	else begin
		writeln('la nota no fue encontrada');
	end;
	
	
	
END.

