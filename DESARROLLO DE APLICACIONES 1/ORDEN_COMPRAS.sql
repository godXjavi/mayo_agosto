create database ORDEN_COMPRAS
create table CLIENTES(ID_CLIENTE INT PRIMARY KEY,NOMBRE VARCHAR(50), DIRECCION VARCHAR (50),CODIGO_POSTAL VARCHAR (50))
create table ORDEN_COMPRAS(ID_ORDEN INT PRIMARY KEY,FECHA_EMICION DATE,FECHA_ENTREGA DATE, ID_CLIENTE INT FOREIGN KEY REFERENCES CLIENTES(ID_CLIENTE))
create table PRODUCTO (ID_PRODUCTO INT PRIMARY KEY,DESCRIPCION VARCHAR (50),PRECIO_UNITARIO FLOAT)
create table CONTIENE (CANTIDAD INT ,TOTAL FLOAT,ID_ORDEN INT FOREIGN KEY (ID_ORDEN  ) REFERENCES ORDEN_COMPRAS (ID_ORDEN),ID_PRODUCTO INT FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTO(ID_PRODUCTO))