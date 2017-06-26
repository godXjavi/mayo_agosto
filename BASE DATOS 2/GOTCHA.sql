/***************************************************************************************************************
   CREACION DE LA BASE DE DATOS BLOODY GOTCHA STORE
***************************************************************************************************************/
create database GOTCHA_STORE
go 
-- Se solicita el acceso a la BD 
use GOTCHA_STORE;
go 

/***************************************************************************************************************
	Se crean las tablas de la BD GOTCHA_STORE
***************************************************************************************************************/
create table EMPRESA
(
	ID_EMPRESA VARCHAR (50) PRIMARY KEY NOT NULL ,
	UBICACION VARCHAR (50) NOT NULL,
	MISION VARCHAR (50) NOT NULL,
	VISION VARCHAR (50) NOT NULL,
	ESLOGAN VARCHAR (50) NOT NULL,
);
go
/***************************************************************************************************************/
create table PACK_GOTCHA
(
     ID_PACK_GOTCHA INT PRIMARY KEY NOT NULL,
	 PAQUETE VARCHAR (50) NOT NULL,
	 COSTO FLOAT NOT NULL,
	 EMPRESA_NOMBRE VARCHAR(50) NOT NULL
);
go
/***************************************************************************************************************/
create table VENTA
(
     ID_VENTA INT PRIMARY KEY NOT NULL,
	 CLIENTE VARCHAR (50) NOT NULL,
	 PAGO_TOTAL FLOAT NOT NULL,
	 PRODUCTOS_COMPRADOS INT NOT NULL,
	 EMPRESA_NOMBRE VARCHAR(50) NOT NULL
);
go
/***************************************************************************************************************/
create table CLIENTE
(
     ID_CLIENTE INT PRIMARY KEY NOT NULL,
	 NOMBRE VARCHAR (50) NOT NULL,
	 DIRECCION VARCHAR(50) NOT NULL,
	 TELEFONO INT NOT NULL,
	 CORREO VARCHAR (50) NOT NULL,
	 ENTREGA_IDENTREGA INT NOT NULL,
	 VENTA_IDVENTA INT NOT NULL,
	 EMPRESA_NOMBRE VARCHAR(50) NOT NULL
);
go
/***************************************************************************************************************/
create table ENTREGA
(
     ID_ENTREGA INT PRIMARY KEY NOT NULL,
	 FECHA_ENTREGA VARCHAR (50) NOT NULL,
	 VENTA_IDVENTA INT NOT NULL,

);
go
/***************************************************************************************************************/
create table ACCESORIO
(
     ID_ACCEORIO INT PRIMARY KEY NOT NULL,
	 NOMBRE VARCHAR (50) NOT NULL,
	 COSTO FLOAT  NOT NULL,
	  EMPRESA_NOMBRE VARCHAR(50) NOT NULL
);
go
/***************************************************************************************************************/
create table TIPO_PROTECCION
(
     ID_PROTECCION INT PRIMARY KEY NOT NULL,
	 NOMBRE VARCHAR (50) NOT NULL,
	 COSTO FLOAT  NOT NULL,
	 COLOR VARCHAR (50) NOT NULL,
	  EMPRESA_NOMBRE VARCHAR(50) NOT NULL
);
go
/***************************************************************************************************************/
create table INFORMACION
(
     ID_INFORMACION INT PRIMARY KEY NOT NULL,
	 INFORMACION VARCHAR (500) NOT NULL,
	TIPO_MUNICION_IDMUNICION INT NOT NULL,
	TIPO_PROTECION_IDPROTECION INT NOT NULL,
	ACCESORIO_IDACCESORIO INT NOT NULL,
	TIPO_ARMA_IDARMA INT NOT NULL,
);
go
/***************************************************************************************************************/
create table TIPO_ARMA
(
     ID_TIPO_ARMA INT PRIMARY KEY NOT NULL,
	 NOMBRE VARCHAR (50) NOT NULL,
	 COLOR VARCHAR (50) NOT NULL,
	 COSTO FLOAT NOT NULL,
	 DAÑO  INT NOT NULL,
	 CALIBRE FLOAT NOT NULL,
	  EMPRESA_NOMBRE VARCHAR(50) NOT NULL
	
);
go
/***************************************************************************************************************/
create table TIPO_MUNICION
(
     ID_TIPO_MUNICION INT PRIMARY KEY NOT NULL,
	 NOMBRE VARCHAR (50) NOT NULL,
	 COSTO FLOAT NOT NULL,
	 TIPO_ARMA_IDARMA INT NOT NULL,
);
go
/***************************************************************************************************************/
create table POPULARIDAD
(
     ID_POPULARIDAD INT PRIMARY KEY NOT NULL,
	INDICE INT NOT NULL,
	 TIPO_ARMA_IDARMA INT NOT NULL,
	 TIPO_PROTECION_IDPROTECION INT NOT NULL,

);
go
/***************************************************************************************************************/
create table EDICCION_LIMITADA
(
     ID_EDICCION_LIMITADA INT PRIMARY KEY NOT NULL,
	NOMBRE VARCHAR (100)NOT NULL,
	COSTO FLOAT NOT NULL,
	 TIPO_ARMA_IDARMA INT NOT NULL,
	 TIPO_PROTECION_IDPROTECION INT NOT NULL,
);
go
/***************************************************************************************************************/

/***************************************************************************************************************/

/***************************************************************************************************************
	 Se crean las restricciones de llave foránea
***************************************************************************************************************/
--LA TABLA EMPRESA NO APLICA
/***************************************************************************************************************/
Alter Table PACK_GOTCHA add constraint FK_PACK_GOTCHA_EMPRESA   Foreign Key(EMPRESA_NOMBRE)
	References EMPRESA(ID_EMPRESA)
	on Update Cascade
	on Delete Cascade;

	Alter Table VENTA add constraint FK_VENTA  Foreign Key(EMPRESA_NOMBRE)
	References EMPRESA(ID_EMPRESA)
	on Update Cascade
	on Delete Cascade;

	Alter Table ENTREGA add constraint FK_ENTREGA Foreign Key(VENTA_IDVENTA)
	References VENTA(ID_VENTA)
	on Update Cascade
	on Delete Cascade;

	Alter Table ACCESORIO add constraint FK_ACCESORIO  Foreign Key(EMPRESA_NOMBRE)
	References EMPRESA(ID_EMPRESA)
	on Update Cascade
	on Delete Cascade;

	Alter Table CLIENTE add constraint FK_CLIENTE  Foreign Key(EMPRESA_NOMBRE)
	References EMPRESA(ID_EMPRESA)
	on Update Cascade
	on Delete Cascade;

	Alter Table TIPO_ARMA add constraint FK_TIPO_ARMA  Foreign Key(EMPRESA_NOMBRE)
	References EMPRESA(ID_EMPRESA)
	on Update Cascade
	on Delete Cascade;

	Alter Table TIPO_PROTECCION add constraint FK_TIPO_PROTECCION  Foreign Key(EMPRESA_NOMBRE)
	References EMPRESA(ID_EMPRESA)
	on Update Cascade
	on Delete Cascade;


	Alter Table TIPO_MUNICION add constraint FK_TIPO_MUNICION Foreign Key(TIPO_ARMA_IDARMA)
	References TIPO_ARMA(ID_TIPO_ARMA)
	on Update Cascade
	on Delete Cascade;



	Alter Table POPULARIDAD add constraint FK_POPULARIDAD  Foreign Key(TIPO_ARMA_IDARMA)
	References TIPO_ARMA(ID_TIPO_ARMA)
	on Update Cascade
	on Delete Cascade;


	Alter Table POPULARIDAD add constraint FK_POPULARIDAD_PROTECION  Foreign Key(TIPO_PROTECION_IDPROTECION)
	References TIPO_PROTECCION(ID_PROTECCION)
	


	Alter Table CLIENTE add constraint FK_CLIENTE_VENTA  Foreign Key(VENTA_IDVENTA)
	References VENTA(ID_VENTA)
	

	Alter Table CLIENTE add constraint FK_CLIENTE_ENTREGA  Foreign Key(ENTREGA_IDENTREGA)
	References ENTREGA(ID_ENTREGA)
	
	Alter Table EDICCION_LIMITADA add constraint FK_EDICCION_LIMITADA  Foreign Key(TIPO_PROTECION_IDPROTECION)
	References TIPO_PROTECCION(ID_PROTECCION)
	on Update Cascade
	on Delete Cascade;


	Alter Table EDICCION_LIMITADA add constraint FK_EDICCION_LIMITADA_ARMA  Foreign Key(TIPO_ARMA_IDARMA)
	References TIPO_ARMA(ID_TIPO_ARMA)
	

	Alter Table INFORMACION add constraint FK_INFORMACION  Foreign Key(TIPO_ARMA_IDARMA)
	References TIPO_ARMA(ID_TIPO_ARMA)
	on Update Cascade
	on Delete Cascade;

	Alter Table INFORMACION add constraint FK_INFORMACION_PROTECION  Foreign Key(TIPO_PROTECION_IDPROTECION)
	References TIPO_PROTECCION(ID_PROTECCION)


	Alter Table INFORMACION add constraint FK_INFORMACION_MUNICION  Foreign Key(TIPO_MUNICION_IDMUNICION)
	References TIPO_MUNICION(ID_TIPO_MUNICION)


	Alter Table INFORMACION add constraint FK_INFORMACION_ACCESORIO  Foreign Key(ACCESORIO_IDACCESORIO)
	References ACCESORIO(ID_ACCEORIO)


	-- Se crean las restricciones Check 

 

