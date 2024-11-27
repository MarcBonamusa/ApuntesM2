# Apuntes de SQL

## 1. Tipos de Datos en SQL

En SQL, los tipos de datos se dividen en varias categorías. Aquí algunos de los más comunes:

### Tipos Numéricos
- `INT`: Número entero.
- `FLOAT` y `REAL`: Números con decimales, de precisión variable.
- `DECIMAL(p, s)`: Números decimales de precisión fija. `p` representa la precisión total, y `s` la cantidad de decimales.

### Tipos de Texto
- `CHAR(n)`: Cadena de texto de longitud fija.
- `VARCHAR(n)`: Cadena de texto de longitud variable (hasta un máximo de `n` caracteres).
- `TEXT`: Cadena de longitud variable, sin límite específico.

### Tipos de Fecha y Hora
- `DATE`: Almacena fechas (año, mes, día).
- `TIME`: Almacena horas (horas, minutos, segundos).
- `DATETIME`: Almacena tanto fecha como hora.
- `TIMESTAMP`: Similar a `DATETIME`, pero ajustado a zonas horarias.

### Tipo Booleano
- `BOOLEAN`: Tipo de dato lógico (verdadero/falso).

## 2. Creación de Tablas

Para crear una tabla en SQL, usamos la sentencia `CREATE TABLE`. A continuación, un ejemplo básico:

```sql
CREATE TABLE Region (
	CodRegion NUMERIC(3),
	Nombre VARCHAR(40),
);
```
## 3. Constraints (Restricciones)
Las restricciones o constraints ayudan a definir reglas en las columnas de una tabla. A continuación se muestran algunas de las más comunes:

3.1 PRIMARY KEY
Define una columna o conjunto de columnas como clave primaria, garantizando que cada valor es único y no nulo.

```sql
CREATE TABLE Region (
	CodRegion NUMERIC(3),
	Nombre VARCHAR(40),
	CONSTRAINT PK_Region PRIMARY KEY (CodRegion)
);
```
3.2 FOREIGN KEY
Enlaza una columna con la clave primaria de otra tabla, creando una relación entre ellas.

```sql
CREATE TABLE Provincia (
	CodProvincia NUMERIC(3),
	Nombre VARCHAR(40),
    CodRegion NUMERIC(3),
	CONSTRAINT PK_CodProvincia PRIMARY KEY (CodProvincia),
    CONSTRAINT FK_CodRegion FOREIGN KEY (CodRegion) REFERENCES Region(CodRegion)
);
```
3.3 NOT NULL
Impide que una columna acepte valores nulos.

```sql
CREATE TABLE empleado (
    id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);
```
3.4 UNIQUE
Garantiza que todos los valores en una columna sean únicos.

```sql
CREATE TABLE Empleado (
	ID NUMERIC(3),
	DNI VARCHAR(9),
    Nombre VARCHAR(50),
    FechaNac DATE,
    Telefon NUMERIC(9),
    Salario NUMERIC(10),
    CodLocalidad NUMERIC(3),
    CONSTRAINT UQ_DNI UNIQUE (DNI)
);
```
3.5 CHECK
Define una condición que los valores deben cumplir.

```sql
CREATE TABLE FABRICANT (
	COD_FABRICANT NUMERIC(3),
	NOM VARCHAR(15),
    PAIS VARCHAR(15),
    CONSTRAINT CK_NOM CHECK (NOM = UPPER(NOM)),
    CONSTRAINT CK_PAIS CHECK (PAIS = UPPER(PAIS))
);
```
## 4. Manipulación de Tablas
4.1 Insertar Datos
Para añadir datos a una tabla, usamos INSERT INTO:

```sql
INSERT INTO nombre_tabla (columna1, columna2) VALUES (valor1, valor2);
```
4.2 Actualizar Datos
Para modificar datos ya existentes:

```sql
UPDATE nombre_tabla
SET columna1 = nuevo_valor
WHERE condicion;
```
4.3 Eliminar Datos
Para eliminar registros:

```sql
DELETE FROM nombre_tabla
WHERE condicion;
Nota: Usar DELETE sin WHERE eliminará todos los registros de la tabla.
```

## 5. Borrar Tablas
Para eliminar una tabla completa, usamos DROP TABLE:

```sql
DROP TABLE nombre_tabla;
```
## 6. Modificar Tablas
Para hacer cambios en la estructura de una tabla existente, como añadir o eliminar columnas, utilizamos ALTER TABLE.

6.1 Añadir una columna
```sql
ALTER TABLE nombre_tabla
ADD nueva_columna INT;
```
6.2 Eliminar una columna
```sql
ALTER TABLE nombre_tabla
DROP COLUMN columna_existente;
```
6.3 Modificar el tipo de dato de una columna
```sql
ALTER TABLE nombre_tabla
MODIFY columna_existente VARCHAR(100);
```
6.4 Afegir comentaris a les taules
```sql
COMMENT ON { TABLE NomTaula | COLUMN taula.nomColumna } IS ‘Comentari’
```

## 7. Transaccions
7.1 Commit
- La instrucció  COMMIT fa que els canvis realitzats per la transacció siguin definitius, irrevocables.  
