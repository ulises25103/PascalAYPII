program listas;
uses GenericLinkedList;
type
    ListNum = specialize LinkedList<integer>;

procedure CargarLista (var l:ListNum;cant_num,max,min:integer);
var
    num_ale,i:integer
begin
    randomize;
    l:= ListNum.create();
    for i:= 1 to cant_num do
      begin 
         num_ale:= random (max - min) + min;
         l.add(num_ale);
      end;
end;
procedure ImprimirLista (l:ListNum);
var
    contador:integer;
begin
    l.reset();
    contador:=1;
    while (not l.eol()) do
      begin
        writeln ('El elemento numero ',contador,' de la lista es: ',l.current());
        l.next();
      end;
end;
procedure EliminarElemento (var l:ListNum; n:integer);
var
    encontre:boolean;
begin
    encontre:= false
    l.reset();
    while (not l.eol()) and (encontre=false) do
      begin
        if (l.current() = n) then
            encontre = true;
        else
            l.next()
      end;
    if (encontre = true) then
      l.removeCurrent();
end;
procedure EliminarTodosLosElementos (var l:ListNum; n:integer);
begin
    l.reset();
    while (not l.eol()) do
      begin
        if (l.current() = n) then
          l.removeCurrent();
        l.next();
      end;
end;
function CargarListaOrdenada (l:ListNum;num,max,min:integer):ListNum;
var
    num_ale, i:integer;
    seguir:boolean;
begin
    randomize;
    l:= ListNum.create();
    i:= 1;
    while (i <= num) do
      begin
        num_ale:= random (max - min) + min;
        while (not l.eol()) and (seguir = false) do
          begin
            if (l.current() > num_ale) then
                seguir = true;
            else 
                l.next();
          end;
        l.insertcurrent(num_ale);
        i:= i + 1;
      end;
    CargarListaOrdenada:= l;
end;
function BuscarElemento (l:ListNum; numero:integer): boolean;
var
    encontrado: boolean;
begin
    l.reset();
    encontrado:= false;
    while (not l.eol()) and (encontrado = false) do
      begin
        if (l.current = numero) then
            encontrado:= true;
        else
            l.next();
      end;
    BuscarElemento:= encontrado;
end;
procedure EliminarElementoConOrden (var l:ListNum; valor_eliminar: integer);
var
    eliminado:boolean;
begin
    l.reset();
    eliminado:= false;
    while (not l.eol()) and (eliminado = false) and (l.current() <= valor_eliminar) do
      begin
        if (l.current() = valor_eliminar) then
            begin
                eliminado:= true;
                l.removeCurrent();
            end;
        else
            l.next()
      end;
end;
rocedure EliminarTodosLosElementosConOrden (var l:ListNum; n:integer);
begin
    l.reset();
    while (not l.eol()) and (l.current() <= n) do
      begin
        if (l.current() = n) then
          l.removeCurrent();
        l.next();
      end;
end;
        



#Programa principal
var
    min,max,num,num_eliminar:integer;
    list,listorden:ListNum;
    esta: boolean;
begin
    write('Dime un numero maximo para el rango de numeros: ');
    readln (max);
    write('Dime un numero minimo para el rango de numeros: ');
    readln (min);
    write ('Dime de cuantos numeros quieres la lista: ');
    readln (num);
    CargarLista (list,num,max,min);
    ImprimirLista (list);
    write ('Dime un numero para eliminarlo: ');
    readln (num_eliminar);
    EliminarElemento (list,num_eliminar);
    write ('Dime un numero para eliminarlo en toda la lista: ');
    readln (num_eliminar);
    EliminarTodosLosElementos (list,num_eliminar);
    ImprimirLista (list);
    write('Dime un numero maximo para el rango de numeros: ');
    readln (max);
    write('Dime un numero minimo para el rango de numeros: ');
    readln (min);
    write ('Dime de cuantos numeros quieres la lista: ');
    readln (num);
    listorden:= CargarListaOrdenada (list,num,max,min);
    ImprimirLista (listorden);
    write ('Dime un numero para saber si esta en la lista: ');
    readln (num);
    esta:= BuscarElemento (listorden,num);
    if (esta = true) then
        writeln ('El numero ha sido encontrado');
    else
        writeln ('El numero no pudo ser encontrado; ')
    writeln ('Dime un numero que quieras eliminar: ');
    readln (num);
    EliminarElementoConOrden (listorden,num);
    writeln ('Dime un numero que quieras eliminar de toda la lista: ');
    readln (num);
    EliminarTodosLosElementosConOrden (listorden,num);
    ImprimirLista (listorden);
end.
