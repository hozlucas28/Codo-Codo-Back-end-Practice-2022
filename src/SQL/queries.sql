/* ------------------------------ Base De Datos ----------------------------- */

CREATE DATABASE webapp_practice CHARACTER SET latin1 COLLATE latin1_spanish_ci;
USE webapp_practice;


/* --------------------------------- Tablas --------------------------------- */

CREATE TABLE Employees (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	firstName VARCHAR(31) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
	lastName VARCHAR(31) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
	telephone VARCHAR(31) NOT NULL,
	workstation VARCHAR(127) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
	salary DECIMAL(11, 2) NOT NULL,
	startDate DATE DEFAULT(CURRENT_DATE) NOT NULL,
	endDate DATE,
	isActive BOOL NOT NULL
);

CREATE TABLE Products (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(31) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
	brand VARCHAR(31) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
	price DECIMAL(11, 2) NOT NULL,
	stock INT NOT NULL,
	entryDate DATE DEFAULT(CURRENT_DATE) NOT NULL,
	expireDate DATE
);


/* -------------------------------- Registros ------------------------------- */

INSERT INTO Employees(firstName, lastName, telephone, workstation, salary, startDate, endDate, isActive)
	VALUES ('Marcos', 'Gonzalez', '1122436123', 'Reponedor', 52000, '2021-08-21', '2022-02-26', 0);

INSERT INTO Employees(firstName, lastName, telephone, workstation, salary, startDate, isActive)
	VALUES
		('Lucas', 'Hoz', '1133476826', 'Gerente', 120000, '2018-03-17', 1),
		('Juana', 'Hernandez', '1124356122', 'Cajera', 64000, '2022-03-14', 1);

INSERT INTO Products(name, brand, price, stock, entryDate, expireDate)
	VALUES 
		('Oreos', 'Mondelez International, Inc.', 149.99, 180, '2022-11-27', '2023-05-27'),
		('Coca Cola', 'The Coca-Cola Company', 224.99, 560, '2022-12-05', '2023-03-05');

INSERT INTO Products(name, brand, price, stock, entryDate)
	VALUES ('Fernet', 'Fratelli Branca', 314.99, 237, '2022-12-14');


/* --------------------------- Comprobar Registros -------------------------- */

SELECT * FROM Employees;

SELECT * FROM Products;