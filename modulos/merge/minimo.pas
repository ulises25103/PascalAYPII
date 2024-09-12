 procedure minimo(var e1, e2:lista; var min:libro);
 Begin
  min.titulo:= ‘zzz’;
  if (not e1.eol()) and (not e2.eol())
  then if (e1.current().titulo <= e2.current().titulo ) 
then begin
              min:= e1.current();
              e1.next(); 
            end; 
else begin
              min:= e2.current();
              e2.next();
            end 
  else if (not e1.eol())
       then begin
              min:= e1.current();
              e1.next(); 
            end 
       else if (not e2.eol()) then 
            begin
              min:= e2.current();
              e2.next();
            end;
 end;