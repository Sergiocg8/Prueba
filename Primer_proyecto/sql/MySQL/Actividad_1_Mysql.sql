CREATE TABLE provincia
( id_provincia INT
, nombre       VARCHAR(20) DEFAULT "NUEVA"
, CONSTRAINT pk_provincia PRIMARY KEY (id_provincia)
, CONSTRAINT uq_nombre UNIQUE (nombre)
);

CREATE TABLE departamento
( id_departamento INT
, nombre          VARCHAR(20) DEFAULT "NUEVA"
, presupuesto     INT CHECK (presupuesto BETWEEN 1000 AND 5000)
, id_provincia    INT
, CONSTRAINT pk_departamento PRIMARY KEY (id_departamento)
, CONSTRAINT fk_dep_prov FOREIGN KEY(id_provincia) REFERENCES provincia(id_provincia)
, CONSTRAINT uq_nombre UNIQUE (nombre)
);

CREATE TABLE trabajador
( id_trabajador   INT
, nombre          VARCHAR(30) DEFAULT "NUEVA"
, salario         INT CHECK (salario>=0)
, comision        INT CHECK (comision<salario*0.5)
, id_provincia    INT
, id_departamento INT
, CONSTRAINT pk_trabajador PRIMARY KEY (id_trabajador)
, CONSTRAINT fk_trab_prov FOREIGN KEY(id_provincia) REFERENCES provincia(id_provincia)
, CONSTRAINT fk_trab_dep FOREIGN KEY(id_departamento) REFERENCES departamento(id_departamento)
, CONSTRAINT uq_nombre UNIQUE (nombre)
);