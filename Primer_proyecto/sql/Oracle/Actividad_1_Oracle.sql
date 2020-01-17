CREATE TABLE provincia
( id_provincia NUMBER
, nombre       VARCHAR2(20)
, CONSTRAINT pk_provincia PRIMARY KEY (id_provincia)
, CONSTRAINT uq_nombre    UNIQUE (nombre)
);

CREATE TABLE departamento
( id_departamento NUMBER
, nombre          VARCHAR2(20) DEFAULT 'NUEVA'
, presupuesto     NUMBER 
, id_provincia    NUMBER
, CONSTRAINT pk_departamento PRIMARY KEY (id_departamento)
, CONSTRAINT fk_dep_prov     FOREIGN KEY(id_provincia) REFERENCES provincia(id_provincia)
, CONSTRAINT ck_presupuesto  CHECK (presupuesto BETWEEN 1000 AND 5000)
);

CREATE TABLE trabajador
( id_trabajador   NUMBER
, nombre          VARCHAR2(30)
, salario         NUMBER 
, comision        NUMBER
, id_provincia    NUMBER
, id_departamento NUMBER
, CONSTRAINT pk_trabajador PRIMARY KEY (id_trabajador)
, CONSTRAINT ck_salario    CHECK (salario>=0)
, CONSTRAINT ck_comision   CHECK (comision<salario*0.5)
, CONSTRAINT fk_trab_prov  FOREIGN KEY(id_provincia) REFERENCES provincia(id_provincia)
, CONSTRAINT fk_trab_dep   FOREIGN KEY(id_departamento) REFERENCES departamento(id_departamento)
);