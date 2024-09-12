function sumaTotal_rec(l: lista): real;
var
    res: real;
begin
if not l.eol() then  begin
    res:= l.current();
    l.next();
    sumaTotal_rec:= res + sumaTotal_rec(l);
end
    else
        sumaTotal_rec:= 0;
end;