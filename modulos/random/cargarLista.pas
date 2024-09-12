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