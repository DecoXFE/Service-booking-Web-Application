drop table Comentario;
drop table Reserva;
drop table Horario;
drop table Dia;
drop table Precio;
drop table Tarjeta;
drop table Favorito;
drop table Empresa;
drop table Cliente;
drop table Usuario;

create table Usuario (
    idUsuario varchar(20),
    correo varchar(50) unique not null,
    contra varchar(20) not null,
    telefono varchar(15) unique,
    direccion varchar(50),
    tipoUsuario bit not null, -- 0:empresa | 1:cliente
    icono blob,
    primary key (idUsuario)
);

create table Cliente (
    idUsuario varchar(20),
    nombre varchar(30) not null,
    apellidos varchar(30) not null,
    primary key (idUsuario),
    foreign key (idUsuario) references Usuario(idUsuario)
);

create table Empresa (
    idUsuario varchar(20),
    tipoServicio varchar(20) not null,
    nombre varchar(30) not null,
    descripcion varchar(500),
    iban varchar(24),
    puntuacion integer,
    imagenFondo blob,
    publicado bit not null, -- 0:anuncio no publicado | 1:anuncio publicado
    primary key (idUsuario),
    foreign key (idUsuario) references Usuario(idUsuario)
);

create table Favorito (
    cliente varchar(20),
    empresa varchar(20),
	primary key (cliente,empresa),
	foreign key (cliente) references Cliente(idUsuario),
	foreign key (empresa) references Empresa(idUsuario)
);

create table Tarjeta (
    idUsuario varchar(20),
    numTarjeta varchar(16) not null,
    nombreTitular varchar(60) not null,
    fechaCaducidad date not null,
    primary key (idUsuario,numTarjeta),
    foreign key (idUsuario) references Cliente(idUsuario)
);

create table Servicio (
    idUsuario varchar(20),
    nombreServicio varchar(30) not null,
    precio float not null,
    primary key (idUsuario,nombreServicio),
    foreign key (idUsuario) references Empresa(idUsuario)
);

-- Enum
create table Dia (
    id integer,
    nombre varchar(9) not null unique,
    primary key (id)
);

insert into Dia values (1,'Lunes');
insert into Dia values (2,'Martes');
insert into Dia values (3,'Miércoles');
insert into Dia values (4,'Jueves');
insert into Dia values (5,'Viernes');
insert into Dia values (6,'Sábado');
insert into Dia values (7,'Domingo');

create table Horario (
    idUsuario varchar(20),
    dia integer,
    horas varchar(30),
    primary key (idUsuario,dia),
    foreign key (idUsuario) references Empresa(idUsuario),
    foreign key (dia) references Dia(id)
);

create table Reserva (
    idReserva integer not null auto_increment,
    cliente varchar(20),
    empresa varchar(20) not null,
    fechaReserva date not null,
    horaReserva time not null,
    fechaRegistro timestamp,
    -- Atributos relacionados con el pago si es necesario
    precioTotal float,
    pagado bit,
    numTarjeta varchar(16),
    titularTarjeta varchar(60),
    primary key(idReserva),
    foreign key (cliente) references Cliente(idUsuario),
    foreign key (empresa) references Empresa(idUsuario)
);

create table Comentario (
    idComentario integer not null auto_increment,
    idReserva integer unique not null,
    cliente varchar(20) not null,
    empresa varchar(20) not null,
    comentario varchar(200) not null,
    voto bit not null,
    fecha timestamp not null,
    primary key (idComentario),
    foreign key (idReserva) references Reserva(idReserva),
    foreign key (cliente) references Cliente(idUsuario),
    foreign key (empresa) references Empresa(idUsuario)
);

insert into Usuario(idUsuario,correo,contra,telefono,direccion,tipoUsuario) values ('johana','johana@gmail.com','pass',111111111,'Calle Proyecto 1',1);
insert into Cliente(idUsuario,nombre,apellidos) values ('johana','Johana','Ramírez');
insert into Usuario(idUsuario,correo,contra,telefono,direccion,tipoUsuario) values ('diego','diego@gmail.com','contra',222222222,'Calle Proyecto 2',1);
insert into Cliente(idUsuario,nombre,apellidos) values ('diego','Diego','Valladolid');
insert into Usuario(idUsuario,correo,contra,telefono,direccion,tipoUsuario) values ('kevin','kevin@gmail.com','1234',333333333,'Calle Proyecto 3',1);
insert into Cliente(idUsuario,nombre,apellidos) values ('kevin','Kevin','Sánchez');
insert into Usuario(idUsuario,correo,contra,telefono,direccion,tipoUsuario) values ('adrian','adrian@gmail.com','qwerty',444444444,'Calle Proyecto 4',1);
insert into Cliente(idUsuario,nombre,apellidos) values ('adrian','Adrian','Sanz');

insert into Usuario(idUsuario,correo,contra,telefono,direccion,tipoUsuario) values ('innove','innove@gmail.com','abcde',983000000,'Paseo de Zorrilla 66, Valladolid',0);
insert into Empresa(idUsuario,tipoServicio,nombre,descripcion,iban,puntuacion,publicado)
    values ('innove','Peluquerías','Peluquería Innove','Cortes y peinados para hombre y mujer.','ES1234567890123456789012',95,1);

insert into Usuario(idUsuario,correo,contra,telefono,direccion,tipoUsuario) values ('color','color@gmail.com','abcde',983000001,'Paseo de Filipinos 3, Valladolid',0);
insert into Empresa(idUsuario,tipoServicio,nombre,descripcion,iban,puntuacion,publicado)
    values ('color','Peluquerías','Peluquería Color','Tintes de todos los colores.','ES1234567890123456789012',43,1);

insert into Usuario(idUsuario,correo,contra,telefono,direccion,tipoUsuario) values ('cocinitas','cocinitas@gmail.com','abcde',983000002,'Plaza circular 14, Valladolid',0);
insert into Empresa(idUsuario,tipoServicio,nombre,descripcion,iban,puntuacion,publicado)
    values ('cocinitas','Restaurantes','Restaurante Cocinitas','Los platos más exóticos y variopintos de la ciudad. ¡Prueba nuestras delicias!','ES1234567890123456789012',87,1);

insert into Usuario(idUsuario,correo,contra,telefono,direccion,tipoUsuario) values ('smile','smile@gmail.com','abcde',983000003,'Avenida de Salamanca 6, Valladolid',0);
insert into Empresa(idUsuario,tipoServicio,nombre,descripcion,iban,puntuacion,publicado)
    values ('smile','Dentistas','Smile','Tratamientos de ortodoncia y blanqueamiento dental. ¡Sonríele a la vida!','ES1234567890123456789012',99,1);

insert into Usuario(idUsuario,correo,contra,telefono,direccion,tipoUsuario) values ('melenas','el_melenas@gmail.com','abcde',983000004,'Calle Victoria, 11, Valladolid',0);
insert into Empresa(idUsuario,tipoServicio,nombre,descripcion,iban,puntuacion,publicado)
    values ('melenas','Peluquerías','Peluquería El Melenas','Hacemos cositas chulas en el pelo.','ES1234567890123456789012',86,1);

insert into Servicio(idUsuario,nombreServicio,precio) values ('color','Coloración cabello corto',44.99);
insert into Servicio(idUsuario,nombreServicio,precio) values ('color','Coloración cabello medio',64.99);
insert into Servicio(idUsuario,nombreServicio,precio) values ('color','Coloración cabello largo',84.99);
insert into Servicio(idUsuario,nombreServicio,precio) values ('color','Mechas cabello corto',63.5);
insert into Servicio(idUsuario,nombreServicio,precio) values ('color','Mechas cabello medio',83.5);
insert into Servicio(idUsuario,nombreServicio,precio) values ('color','Mechas cabello largo',103.5);

insert into Servicio(idUsuario,nombreServicio,precio) values ('innove','Corte cabello corto',20);
insert into Servicio(idUsuario,nombreServicio,precio) values ('innove','Corte cabello medio',30);
insert into Servicio(idUsuario,nombreServicio,precio) values ('innove','Corte cabello largo',40);
insert into Servicio(idUsuario,nombreServicio,precio) values ('innove','Peinado cabello corto',22.3);
insert into Servicio(idUsuario,nombreServicio,precio) values ('innove','Peinado cabello largo',35.45);

insert into Servicio(idUsuario,nombreServicio,precio) values ('melenas','Corte cabello corto',20);
insert into Servicio(idUsuario,nombreServicio,precio) values ('melenas','Corte cabello medio',30);
insert into Servicio(idUsuario,nombreServicio,precio) values ('melenas','Corte cabello largo',40);
insert into Servicio(idUsuario,nombreServicio,precio) values ('melenas','Peinado cabello corto',30);
insert into Servicio(idUsuario,nombreServicio,precio) values ('melenas','Peinado cabello medio',45);
insert into Servicio(idUsuario,nombreServicio,precio) values ('melenas','Peinado cabello largo',50);
insert into Servicio(idUsuario,nombreServicio,precio) values ('melenas','Coloración cabello corto',50.95);
insert into Servicio(idUsuario,nombreServicio,precio) values ('melenas','Coloración cabello medio',70.95);
insert into Servicio(idUsuario,nombreServicio,precio) values ('melenas','Coloración cabello largo',90.95);
insert into Servicio(idUsuario,nombreServicio,precio) values ('melenas','Mechas cabello corto',63.5);
insert into Servicio(idUsuario,nombreServicio,precio) values ('melenas','Mechas cabello medio',83.5);
insert into Servicio(idUsuario,nombreServicio,precio) values ('melenas','Mechas cabello largo',103.5);
insert into Servicio(idUsuario,nombreServicio,precio) values ('melenas','Tratamiento de reparación',58.76);
insert into Servicio(idUsuario,nombreServicio,precio) values ('melenas','Tratamiento de keratina',140);

insert into Servicio(idUsuario,nombreServicio,precio) values ('cocinitas','Menú del día',33.5);
insert into Servicio(idUsuario,nombreServicio,precio) values ('cocinitas','Menú especial de la casa',40);
insert into Servicio(idUsuario,nombreServicio,precio) values ('cocinitas','Fugu',218);
insert into Servicio(idUsuario,nombreServicio,precio) values ('cocinitas','Sannakji',105);
insert into Servicio(idUsuario,nombreServicio,precio) values ('cocinitas','Chapulines',8.4);
insert into Servicio(idUsuario,nombreServicio,precio) values ('cocinitas','Lutefisk',39);

insert into Servicio(idUsuario,nombreServicio,precio) values ('smile','Empaste',57.54);
insert into Servicio(idUsuario,nombreServicio,precio) values ('smile','Endodoncia',209.2);
insert into Servicio(idUsuario,nombreServicio,precio) values ('smile','Ortodoncia',2602.65);
insert into Servicio(idUsuario,nombreServicio,precio) values ('smile','Blanqueamiento',310);

insert into Horario(idUsuario,dia,horas) values ('cocinitas',1,'13:00-16:00 | 21:00-23:00');
insert into Horario(idUsuario,dia,horas) values ('cocinitas',2,'13:00-16:00 | 21:00-23:00');
insert into Horario(idUsuario,dia,horas) values ('cocinitas',3,'13:00-16:00 | 21:00-23:00');
insert into Horario(idUsuario,dia,horas) values ('cocinitas',4,'13:00-16:00 | 21:00-23:00');
insert into Horario(idUsuario,dia,horas) values ('cocinitas',5,'13:00-16:00 | 21:00-00:00');
insert into Horario(idUsuario,dia,horas) values ('cocinitas',6,'13:00-16:00 | 21:00-00:00');
insert into Horario(idUsuario,dia,horas) values ('cocinitas',7,'13:00-16:00');

insert into Horario(idUsuario,dia,horas) values ('smile',1,'09:00-15:00 | 18:00-21:00');
insert into Horario(idUsuario,dia,horas) values ('smile',2,'09:00-15:00 | 18:00-21:00');
insert into Horario(idUsuario,dia,horas) values ('smile',3,'09:00-15:00 | 18:00-21:00');
insert into Horario(idUsuario,dia,horas) values ('smile',4,'09:00-15:00 | 18:00-21:00');
insert into Horario(idUsuario,dia,horas) values ('smile',5,'10:00-14:00 | 18:00-20:30');
insert into Horario(idUsuario,dia,horas) values ('smile',6,'09:00-15:00');
insert into Horario(idUsuario,dia,horas) values ('smile',7,'cerrado');

insert into Horario(idUsuario,dia,horas) values ('color',1,'10:00-15:00');
insert into Horario(idUsuario,dia,horas) values ('color',2,'10:00-15:00');
insert into Horario(idUsuario,dia,horas) values ('color',3,'10:00-15:00');
insert into Horario(idUsuario,dia,horas) values ('color',4,'10:00-15:00');
insert into Horario(idUsuario,dia,horas) values ('color',5,'10:00-15:00');
insert into Horario(idUsuario,dia,horas) values ('color',6,'cerrado');
insert into Horario(idUsuario,dia,horas) values ('color',7,'cerrado');

insert into Horario(idUsuario,dia,horas) values ('innove',1,'09:00-15:00 | 17:00-21:00');
insert into Horario(idUsuario,dia,horas) values ('innove',2,'09:00-15:00 | 17:00-21:00');
insert into Horario(idUsuario,dia,horas) values ('innove',3,'09:00-15:00 | 17:00-21:00');
insert into Horario(idUsuario,dia,horas) values ('innove',4,'09:00-15:00 | 17:00-21:00');
insert into Horario(idUsuario,dia,horas) values ('innove',5,'09:00-15:00 | 17:00-21:00');
insert into Horario(idUsuario,dia,horas) values ('innove',6,'08:00-16:00');
insert into Horario(idUsuario,dia,horas) values ('innove',7,'cerrado');

insert into Horario(idUsuario,dia,horas) values ('melenas',1,'09:00-14:00 | 17:00-20:00');
insert into Horario(idUsuario,dia,horas) values ('melenas',2,'09:00-14:00 | 17:00-20:00');
insert into Horario(idUsuario,dia,horas) values ('melenas',3,'09:00-14:00 | 17:00-20:00');
insert into Horario(idUsuario,dia,horas) values ('melenas',4,'09:00-14:00 | 17:00-20:00');
insert into Horario(idUsuario,dia,horas) values ('melenas',5,'09:00-14:00 | 17:00-20:00');
insert into Horario(idUsuario,dia,horas) values ('melenas',6,'cerrado');
insert into Horario(idUsuario,dia,horas) values ('melenas',7,'cerrado');

insert into Reserva(cliente,empresa,fechaReserva,horaReserva) values ('johana','cocinitas','2023-05-20','21:00:00');
insert into Comentario(idReserva,cliente,empresa,comentario,voto,fecha)
values (1,'johana','cocinitas','¡No hay otro igual en toda la ciudad! Volveré sin duda.',1,'2023-05-21 10:35:02');

insert into Reserva(cliente,empresa,fechaReserva,horaReserva) values ('johana','smile','2023-02-02','17:00:00');
insert into Comentario(idReserva,cliente,empresa,comentario,voto,fecha)
values (2,'johana','smile','Fui porque me lo recomendó una amiga y quedé sorprendida. Trato muy profesional y te ayudan con cualquier duda que tengas.',1,'2023-02-2 19:21:39');

insert into Reserva(cliente,empresa,fechaReserva,horaReserva) values ('kevin','cocinitas','2023-04-13','22:00:00');
insert into Comentario (idReserva,cliente,empresa,comentario,voto,fecha)
values (3,'kevin','cocinitas','Ñam ñam =D',1,'2023-04-14 12:05:52');

insert into Reserva(cliente,empresa,fechaReserva,horaReserva) values ('adrian','cocinitas','2022-12-19','15:45:00');
insert into Comentario(idReserva,cliente,empresa,comentario,voto,fecha)
values (4,'adrian','cocinitas','La comida estaba deliciosa y presentada de manera elegante. Definitivamente recomendaré este lugar a mis amigos y familiares.',1,'2022-12-19 20:12:36');

insert into Reserva(cliente,empresa,fechaReserva,horaReserva) values ('diego','cocinitas','2022-12-19','22:00:00');
insert into Comentario(idReserva,cliente,empresa,comentario,voto,fecha)
values (5,'diego','cocinitas','Mi visita a este restaurante fue decepcionante. El servicio fue lento y descuidado, tuve que esperar mucho tiempo para recibir mi comida. No creo que vuelva a visitar este lugar.',0,'2022-12-19 23:57:17');

insert into Reserva(cliente,empresa,fechaReserva,horaReserva) values ('kevin','color','2023-05-19','13:30:00');
insert into Comentario (idReserva,cliente,empresa,comentario,voto,fecha)
values (6,'kevin','color','Fui a esta peluquería buscando un cambio de imagen y me fui muy decepcionado. El estilista no tenía ideas creativas y me dio un corte de pelo poco favorecedor.',0,'2023-05-19 15:26:15');

insert into Reserva(cliente,empresa,fechaReserva,horaReserva) values ('adrian','color','2023-04-09','12:00:00');
insert into Comentario (idReserva,cliente,empresa,comentario,voto,fecha)
values (7,'adrian','color','El lugar estaba sucio y descuidado. Fue una experiencia decepcionante, no lo recomendaría a nadie que busque teñirse el pelo.',0,'2023-04-12 17:05:34');

insert into Reserva(cliente,empresa,fechaReserva,horaReserva) values ('diego','color','2023-03-28','10:15:00');
insert into Comentario (idReserva,cliente,empresa,comentario,voto,fecha)
values (8,'diego','color','Me dieron una piruleta',1,'2023-04-14 19:38:46');

insert into Reserva(cliente,empresa,fechaReserva,horaReserva) values ('diego','innove','2023-05-20','19:30:00');
insert into Comentario (idReserva,cliente,empresa,comentario,voto,fecha)
values (9,'diego','innove','He estado buscando una buena peluquería durante mucho tiempo y finalmente encontré esta joya.',1,'2023-05-21 14:16:37');

insert into Reserva(cliente,empresa,fechaReserva,horaReserva) values ('johana','innove','2023-02-17','20:30:00');
insert into Comentario (idReserva,cliente,empresa,comentario,voto,fecha)
values (10,'johana','innove','No puedo decir suficientes cosas buenas sobre esta peluquería. El personal es extremadamente profesional y talentoso.',1,'2023-02-17 21:12:41');


-- Inserción de imágenes con rutas absolutas
-- Para que funcione copiar la carpeta 'prueba' que está dentro del proyecto netbeans en el
-- directorio raíz de vuestro pc.
UPDATE Usuario SET icono = LOAD_FILE('/prueba/logo_pelu_1.jpg') WHERE idUsuario = 'innove';
UPDATE Usuario SET icono = LOAD_FILE('/prueba/logo_pelu_2.jpg') WHERE idUsuario = 'color';
UPDATE Usuario SET icono = LOAD_FILE('/prueba/logo_rest_1.jpg') WHERE idUsuario = 'cocinitas';
UPDATE Usuario SET icono = LOAD_FILE('/prueba/logo_dent_1.png') WHERE idUsuario = 'smile';
UPDATE Usuario SET icono = LOAD_FILE('/prueba/logo_pelu_3.jpg') WHERE idUsuario = 'melenas';

UPDATE Usuario SET icono = LOAD_FILE('/prueba/perfil_johana.jpg') WHERE idUsuario = 'johana';

UPDATE Empresa SET imagenFondo = LOAD_FILE('/prueba/fondo_cocinitas.jpg') WHERE idUsuario = 'cocinitas';
UPDATE Empresa SET imagenFondo = LOAD_FILE('/prueba/fondo_melenas.jpg') WHERE idUsuario = 'melenas';
UPDATE Empresa SET imagenFondo = LOAD_FILE('/prueba/fondo_innove.jpg') WHERE idUsuario = 'innove';
UPDATE Empresa SET imagenFondo = LOAD_FILE('/prueba/fondo_color.jpg') WHERE idUsuario = 'color';
UPDATE Empresa SET imagenFondo = LOAD_FILE('/prueba/fondo_smile.jpg') WHERE idUsuario = 'smile';

