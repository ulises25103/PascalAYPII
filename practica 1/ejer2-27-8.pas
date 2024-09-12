program ejer2;
const
cantAlum = 2;
cantComi = 2;

TYPE
estudiantes = record
	nombre: string;
	apellido: string;
	nota: integer;
	f: integer;
	c: integer;
end;
//						F			C
matCatedra = array[1..cantComi, 1..cantAlum] of estudiantes;

procedure cargarMatriz(var mc: matCatedra);
var
comision, alumno: integer;
f,c: integer;
begin
f:= 1;
c:= 0;
for comision:= 1 to cantComi do begin
	for alumno:= 1 to cantAlum do begin
		c:= c+1;
		writeln('ingrese el alumno numero: ', alumno,' de la comision: ', comision);
		write('nombre: '); readln(mc[comision,alumno].nombre);
		write('apellido: '); readln(mc[comision,alumno].apellido);
		write('nota: '); readln(mc[comision,alumno].nota);
		mc[comision,alumno].c:= c;
		mc[comision,alumno].f:= f;
	end;
	c:= 0;
	f:= f+1;
end;
end;


procedure imprimirMatrizFImpar_Par(mc: matCatedra);
var
com, alu: integer;
begin
for com:= 1 to cantComi do begin
	if (com MOD 2 = 1) then begin //para filas impares
		for alu:= 1 to cantAlum do begin
			write(mc[com, alu].nombre,' ', mc[com, alu].apellido,' nota : ', mc[com, alu].nota, ' fila: ', mc[com,alu].f,' columna: ', mc[com,alu].c, ' |');
		end;
		end
		else begin //para filas pares
		for alu:= cantAlum downto 1 do begin
			write(mc[com, alu].nombre,' ', mc[com, alu].apellido,' nota: ', mc[com, alu].nota, ' fila: ', mc[com,alu].f,' columna: ', mc[com,alu].c ,' |');
		end;
		writeln;
	end;
end;

end;

procedure imprimirMatrizCImpar_Par(mc: matCatedra);
var
com, alu: integer;
begin

for alu:= 1 to cantAlum do begin
	if (alu MOD 2 = 1) then begin 
		for com:= 1 to cantComi do begin
			write(mc[com, alu].nombre,' ', mc[com, alu].apellido,' nota : ', mc[com, alu].nota, ' fila: ', mc[com,alu].f,' columna: ', mc[com,alu].c, ' |');
		end;
		end
		else begin
		for com:= cantComi downto 1 do begin
			write(mc[com, alu].nombre,' ', mc[com, alu].apellido,' nota: ', mc[com, alu].nota, ' fila: ', mc[com,alu].f,' columna: ', mc[com,alu].c ,' |');
		end;
		writeln;
	end;
end;

end;

procedure buscarFImpar_par(mc: matCatedra; var nota:integer);
var
com, alu: integer;
encontrado: boolean;
nom, ap: string;
begin
encontrado:= false;

for com:= 1 to cantComi do begin
if not encontrado then begin
	if (com MOD 2 = 1) then begin //para filas impares
		for alu:= 1 to cantAlum do begin
			if (nota = mc[com, alu].nota) then begin
				nom:= mc[com,alu].nombre;
				ap:= mc[com,alu].apellido;
				encontrado:= true;
			end;
		end;
		end
		else begin //para filas pares
		for alu:= cantAlum downto 1 do begin
			if (nota = mc[com, alu].nota) then begin
				nom:= mc[com,alu].nombre;
				ap:= mc[com,alu].apellido;
				encontrado:= true;
			end;
		end;
		writeln;
	end;
end;
end;
if encontrado then begin
	writeln('el alumno con la nota: ', nota, ' se llama: ', nom, ' ', ap);
	end
else begin
	writeln('ninguno');
end;
end;




var
mc: matCatedra;
nota: integer;
begin
nota:= 0;
cargarMatriz(mc);
imprimirMatrizFImpar_Par(mc);
imprimirMatrizCImpar_Par(mc);
write('ingrese la nota que desea buscar: '); read(nota);
buscarFImpar_par(mc, nota);

end.
