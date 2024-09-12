function sumaTotal_rec(v: vector; i: integer): real;
begin
    if i > 1 then
        sumaTotal_rec:= sumaTotal_rec(v,i-1) + v[i]
    else
        sumaTotal_rec:= v[i];
end;