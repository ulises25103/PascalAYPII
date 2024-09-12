function sumatoria_rec(N: integer): integer;
begin
    if N <> 1 then
        sumatoria_rec:= sumatoria_rec(N-1) + N
    else
        sumatoria_rec:= 1;
end;