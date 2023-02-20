-- Creación de tablas

create table aeropuerto
(
    id     bigint  not null primary key,
    ciudad varchar(255) null,
    codigo varchar(255) null,
    nombre varchar(255) null,
    pais   varchar(255) null
);

create table aeropuerto_seq
(
    next_val bigint null
);

create table avion
(
    id          bigint       not null primary key,
    fabricante  varchar(255) null,
    horas_vuelo bigint       not null,
    matricula   varchar(255) null,
    modelo      varchar(255) null
);

create table avion_seq
(
    next_val bigint null
);

create table mecanico
(
    id        bigint       not null primary key,
    apellidos varchar(255) null,
    codigo    varchar(255) null,
    nombre    varchar(255) null,
    anio      int          not null,
    empresa   varchar(255) null,
    formacion varchar(255) null
);

create table mecanico_seq
(
    next_val bigint null
);

create table revision
(
    id                    bigint       not null primary key,
    descripcion           varchar(255) null,
    fecha_fin             datetime(6)  null,
    fecha_inicio          datetime(6)  null,
    horas_mecanico        double       not null,
    tipo_revision         varchar(255) null,
    aeropuerto_id         bigint       null,
    avion_id              bigint       null,
    mecanico_encargado_id bigint       null,
    constraint FK5clx7t15sygeqxsqfxl57rpme
        foreign key (aeropuerto_id) references aeropuerto (id),
    constraint FKepufjqvypljnk6si1dhtdcn3r
        foreign key (avion_id) references avion (id),
    constraint FKnfdf2dp63kmvi73mvdd1tfa95
        foreign key (mecanico_encargado_id) references mecanico (id)
);

create table revision_seq
(
    next_val bigint null
);

create table tripulante
(
    id        bigint       not null primary key,
    apellidos varchar(255) null,
    codigo    varchar(255) null,
    nombre    varchar(255) null,
    compania  varchar(255) null,
    puesto    varchar(255) null
);

create table tripulante_seq
(
    next_val bigint null
);

create table vuelo
(
    id           bigint       not null primary key,
    codigo       varchar(255) null,
    compania     varchar(255) null,
    duracion     double       null,
    fecha_salida datetime(6)  null,
    avion_id     bigint       not null,
    destino_id   bigint       not null,
    origen_id    bigint       not null,
    constraint FK8j5widj67y5mcf830eqkvth2p
        foreign key (avion_id) references avion (id),
    constraint FKkbrspynyr16o6kreury553afl
        foreign key (origen_id) references aeropuerto (id),
    constraint FKnvtlv125kssq8a3dt0bdrm1lm
        foreign key (destino_id) references aeropuerto (id)
);

create table tripulante_vuelo
(
    vuelo_id      bigint not null,
    tripulante_id bigint not null,
    primary key (tripulante_id, vuelo_id),
    constraint FK72ul3w9a15i2swg4kea9ku1jc
        foreign key (tripulante_id) references tripulante (id),
    constraint FKdw8cu1wvtrl2kqslg4ey1pph5
        foreign key (vuelo_id) references vuelo (id)
);

create table vuelo_seq
(
    next_val bigint null
);




-- Insertar datos iniciales
insert into aeropuerto (id, ciudad, codigo, nombre, pais) values (1, 'Madrid', 'MAD', 'Adolfo Suárez Madrid Barajas', 'España');
insert into aeropuerto (id, ciudad, codigo, nombre, pais) values (3, 'Dublin', 'DUB', 'Aeropuerto Dublin', 'Irlanda');
insert into aeropuerto (id, ciudad, codigo, nombre, pais) values (5, 'Lavacolla', 'SCQ', 'Aeropuerto Santiago', 'España');
insert into aeropuerto (id, ciudad, codigo, nombre, pais) values (4, 'Sevilla', 'SVQ', 'Aeropuerto Sevilla', 'España');
insert into aeropuerto (id, ciudad, codigo, nombre, pais) values (2, 'Barcelona', 'BCN', 'El Plat', 'España');

INSERT INTO aeropuerto_seq (next_val) VALUES (101);

INSERT INTO avion (id, fabricante, horas_vuelo, matricula, modelo) VALUES (1, 'Airbus', 5000, '1111', 'A320');
INSERT INTO avion (id, fabricante, horas_vuelo, matricula, modelo) VALUES (2, 'Airbus', 10000, '2222', 'A330');
INSERT INTO avion (id, fabricante, horas_vuelo, matricula, modelo) VALUES (3, 'Airbus', 15000, '3333', 'A380');
INSERT INTO avion (id, fabricante, horas_vuelo, matricula, modelo) VALUES (4, 'Boeing', 20000, '4444', '737');
INSERT INTO avion (id, fabricante, horas_vuelo, matricula, modelo) VALUES (5, 'Boeing', 50000, '5555', '747');


INSERT INTO avion_seq (next_val) VALUES (101);

INSERT INTO mecanico (id, apellidos, codigo, nombre, anio, empresa, formacion) VALUES (1, 'Ramos', '1000', 'Alexis', 2005, 'Empresa 1', 'FP');
INSERT INTO mecanico (id, apellidos, codigo, nombre, anio, empresa, formacion) VALUES (2, 'Marquez', '2000', 'Rafa', 2015, 'Empresa 2', 'Ninguna');
INSERT INTO mecanico (id, apellidos, codigo, nombre, anio, empresa, formacion) VALUES (3, 'Pérez', '3000', 'María', 2010, 'Empresa 3', 'Ingeniería');
INSERT INTO mecanico (id, apellidos, codigo, nombre, anio, empresa, formacion) VALUES (4, 'López', '4000', 'Adela', 2019, 'Empresa 1', 'FP');
INSERT INTO mecanico (id, apellidos, codigo, nombre, anio, empresa, formacion) VALUES (5, 'Ronda', '5000', 'Ramón', 2005, 'Empresa 2', 'FP');


INSERT INTO mecanico_seq (next_val) VALUES (101);


INSERT INTO revision (id, descripcion, fecha_fin, fecha_inicio, horas_mecanico, tipo_revision, aeropuerto_id, avion_id, mecanico_encargado_id) VALUES (1, 'Descripción 1', '2019-04-30 00:00:00', '2019-04-29 00:00:00', 150, 'Revisión', 1, 1, 1);
INSERT INTO revision (id, descripcion, fecha_fin, fecha_inicio, horas_mecanico, tipo_revision, aeropuerto_id, avion_id, mecanico_encargado_id) VALUES (2, 'Descripción 2', '2020-11-15 00:00:00', '2020-10-12 00:00:00', 500, 'Avería', 1, 2, 1);
INSERT INTO revision (id, descripcion, fecha_fin, fecha_inicio, horas_mecanico, tipo_revision, aeropuerto_id, avion_id, mecanico_encargado_id) VALUES (3, 'Descripción 3', '2015-03-01 00:00:00', '2015-02-01 00:00:00', 200, 'Revisión', 2, 5, 2);
INSERT INTO revision (id, descripcion, fecha_fin, fecha_inicio, horas_mecanico, tipo_revision, aeropuerto_id, avion_id, mecanico_encargado_id) VALUES (4, 'Descripción 4', '2019-05-01 00:00:00', '2019-04-01 00:00:00', 600, 'Revisión', 2, 5, 3);


INSERT INTO revision_seq (next_val) VALUES (101);


INSERT INTO tripulante (id, apellidos, codigo, nombre, compania, puesto) VALUES (1, 'García', '00001', 'Pedro', 'Iberia', 'Auxiliar');
INSERT INTO tripulante (id, apellidos, codigo, nombre, compania, puesto) VALUES (2, 'Pérez', '00002', 'María', 'Iberia', 'Piloto');
INSERT INTO tripulante (id, apellidos, codigo, nombre, compania, puesto) VALUES (3, 'López', '00003', 'Ana', 'Iberia', 'Comandante');
INSERT INTO tripulante (id, apellidos, codigo, nombre, compania, puesto) VALUES (4, 'Blas', '00004', 'Juan', 'Vueling', 'Piloto');
INSERT INTO tripulante (id, apellidos, codigo, nombre, compania, puesto) VALUES (5, 'Martínez', '00005', 'Andrés', 'Vueling', 'Auxiliar');


INSERT INTO tripulante_seq (next_val) VALUES (101);

INSERT INTO vuelo (id, codigo, compania, duracion, fecha_salida, avion_id, destino_id, origen_id) VALUES (1, 'IB111', 'Iberia', 0.5, '2020-04-29 00:00:00', 1, 2, 1);
INSERT INTO vuelo (id, codigo, compania, duracion, fecha_salida, avion_id, destino_id, origen_id) VALUES (2, 'IB222', 'Iberia', 2.5, '2020-12-05 00:00:00', 2, 4, 3);
INSERT INTO vuelo (id, codigo, compania, duracion, fecha_salida, avion_id, destino_id, origen_id) VALUES (3, 'VU111', 'Vueling', 1.5, '2021-02-05 00:00:00', 5, 5, 4);


INSERT INTO tripulante_vuelo (vuelo_id, tripulante_id) VALUES (1, 1);
INSERT INTO tripulante_vuelo (vuelo_id, tripulante_id) VALUES (1, 2);
INSERT INTO tripulante_vuelo (vuelo_id, tripulante_id) VALUES (2, 2);
INSERT INTO tripulante_vuelo (vuelo_id, tripulante_id) VALUES (2, 3);
INSERT INTO tripulante_vuelo (vuelo_id, tripulante_id) VALUES (3, 4);
INSERT INTO tripulante_vuelo (vuelo_id, tripulante_id) VALUES (3, 5);




INSERT INTO vuelo_seq (next_val) VALUES (101);





