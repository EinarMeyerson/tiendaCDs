CREATE TABLE CD (
  Code INTEGER AUTO_INCREMENT,
  Price DECIMAL NOT NULL,
  NombreCD VARCHAR(255) NOT NULL,
  NombreGrupo VARCHAR(255) NOT NULL,
  Pais VARCHAR(255) NOT NULL,
  PRIMARY KEY (Code)   
);

INSERT INTO CD(Code, NombreCD, NombreGrupo, Pais,Price) VALUES(NULL,'Yuan','The Guo Brothers','China',4.95);
INSERT INTO CD(Code, NombreCD, NombreGrupo, Pais,Price) VALUES(NULL,'Drums of Passion','Babatunde Olatunji','Nigeria',6.95);
INSERT INTO CD(Code, NombreCD, NombreGrupo, Pais,Price) VALUES(NULL,'Kaira','Tounami Diabate','Mali',6.95);
INSERT INTO CD(Code, NombreCD, NombreGrupo, Pais,Price) VALUES(NULL,'The Lion is Loose','Eliades Ochoa','Cuba',3.95);

CREATE TABLE COMPRAS (
  Code INTEGER AUTO_INCREMENT,
  TotalPrice DECIMAL NOT NULL,
  PRIMARY KEY (Code)   
);

CREATE TABLE INFOCOMPRAS (
  Code INTEGER AUTO_INCREMENT,
  Price DECIMAL NOT NULL,
  NombreCD VARCHAR(255) NOT NULL,
  NombreGrupo VARCHAR(255) NOT NULL,
  Pais VARCHAR(255) NOT NULL,
  Cantidad INTEGER NOT NULL,
  Compra INTEGER NOT NULL,
  PRIMARY KEY (Code),
  FOREIGN KEY (Compra) REFERENCES Compras(Code)
);