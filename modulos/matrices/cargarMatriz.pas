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