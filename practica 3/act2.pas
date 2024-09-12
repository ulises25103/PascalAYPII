program untitled;
uses GenericLinkedList;
const
cant_lugares = 6
type
paquete = record
	cod: integer;
	codLugar: 1..cant_lugares;
	destino: string;
	peso: integer;
end;

listaPaquete = specialize LinkedList<paquete>;
vectorPaquetes = array[1..cant_lugares] of listaPaquete;

procedure LeerPaquete(var l: listaPaquete; var v: vectorPaquetes);
var
i,j: integer;
p: paquete;
vDest: array[1..5] of string = ('asd1','asd2','asd3','asd4','asd5');
cargado: boolean;
begin

for j:= 1 to cant_lugares do
	v[j]:= listaPaquete.create();
	
for i:= 1 to cant_lugares do begin
	v[i].reset();
	p.cod:= -1 + random(100); //nums randoms desde -1 hasta 98
	while p.cod <> -1 do begin
		p.codLugar:= i;
		p.destino:= vDest[random(5)+1];
		p.peso:= (1000 + (random(19) * 500));
		cargado:= false;
		while(not v[i].eol()) and (not cargado) do begin
		if(v[i].current().peso >= p.peso) then begin
			cargado:= true;
		end
		else begin
			v[i].next();
		end;
		v[i].insertCurrent(p);
		p.cod:= -1 + random(100);
	end;
end;

procedure minimo(var v: vectorPaquetes, var min: paquete);
var
i,posmin: integer;
begin
min.peso:= 999;

for i:= 1 to cant_lugares do
	if not(v[i].eol()) then begin
		if (v[i].current().peso <= min.peso then begin
			min:= v[i].current();
			posmin:=i;
		end;
	end;
	
	if min.peso <> 999 then 
		v[posmin].next();
end;

procedure merge(v: vectorPaquetes; var lNueva: listaPaquetes);
var 
min: paquete;
i: integer;
begin
lNueva: listaPaquetes.create();
for i:= 1 to cant_lugares do 
	v[i].reset();
	
minimo(v,min)

while min.titulo <> 999 do begin
	lNueva.add(min);
	minimo(v,min);
end;
end;

procedure imprimirLista(l: listaPaquetes);
begin

l.reset();

while (not l.eol()) do begin
	writeln(l.current().peso);

end;

var
l, lNueva: listaPaquetes;
v: vectorPaquetes;
BEGIN
LeerPaquete(l,v);
merge(v,lNueva);
imprimirLista(lNueva);
END.

