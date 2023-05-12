
create table atronauta(
licencia int primary key,
nombre varchar(15),
genero varchar(1) check (genero in ('F','M','O')),
fecha_nacimiento date,
estatura decimal,
agencia varchar(10),
foreign key (agencia) references agencia(sigla)
);

create table cohete(
codigo int primary key,
agencia varchar(5),
foreign key (agencia) references agencia(sigla)
);

create table mision(
nombre varchar(15),
destino int,
foreign key (destino) references destino(codigo),
fecha_despegue date,
fecha_regreso date,
nave varchar(15),
agencia_lider varchar(5),
foreign key (agencia_lider) references agencia(sigla),
cantidad_astronautas int,
valor_mision int
);