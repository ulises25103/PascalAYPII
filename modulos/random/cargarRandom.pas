 procedure cargarRandom(var inmu1:inmueble);
    var 
         vTipos:array[1..4] of string= ('Casa', 'Departamento', 'Duplex', 'Local Comercial');
        vLocal:array[1..10] of string= ('La Plata', 'Berisso', 'Ensenada','Quilmes','Avellaneda','Bernal','Berazategui','Azul','Tandil','Dolores');
    begin
            inmu1.tipo:= vTipos[random(4)+1];
            inmu1.cantHab:=random(6);
            inmu1.cantBanos:=random(4)+1;
            inmu1.precio:=random(50000)/2+10000;
            inmu1.localidad:= vLocal[random(10)+1];
end