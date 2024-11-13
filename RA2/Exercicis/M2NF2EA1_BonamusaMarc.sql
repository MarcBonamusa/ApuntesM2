CREATE TABLE Region (
	CodRegion NUMERIC(3),
	Nombre VARCHAR(40),
	CONSTRAINT PK_Region PRIMARY KEY (CodRegion)
);

CREATE TABLE Provincia (
	CodProvincia NUMERIC(3),
	Nombre VARCHAR(40),
    CodRegion NUMERIC(3),
	CONSTRAINT PK_CodProvincia PRIMARY KEY (CodProvincia),
    CONSTRAINT FK_CodRegion FOREIGN KEY (CodRegion) REFERENCES Region(CodRegion)
);

CREATE TABLE Localidad (
	CodLocalidad NUMERIC(3),
	Nombre VARCHAR(40),
    CodProvincia NUMERIC(3),
	CONSTRAINT PK_CodLocalidad PRIMARY KEY (CodLocalidad),
    CONSTRAINT FK_CodProvincia FOREIGN KEY (CodProvincia) REFERENCES Provincia(CodProvincia)
);

CREATE TABLE Empleado (
	ID NUMERIC(3),
	DNI VARCHAR(9),
    Nombre VARCHAR(50),
    FechaNac DATE,
    Telefon NUMERIC(9),
    Salario NUMERIC(10),
    CodLocalidad NUMERIC(3),
	CONSTRAINT PK_ID PRIMARY KEY (ID),
    CONSTRAINT UQ_DNI UNIQUE (DNI),
    CONSTRAINT FK_CodLocalidad FOREIGN KEY (CodLocalidad) REFERENCES Localidad(CodLocalidad)
);