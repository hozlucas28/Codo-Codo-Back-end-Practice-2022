/* --------------------------------------------------------------------------
 * APUNTES:
 * 		   Estas instrucciones son ejecutadas directamente desde el gestor de
 *		   bases de datos, en el apartado de consultas.
 *		   Tener en cuenta que la variable seguida de la instrucción <TABLE>
 *		   indica la tabla a apuntar donde harán efecto las instrucciones consecuentes.
 *
 *
 * IMPORTANTE:
 *  			  - <Ctrl + f9> = ejecuta la/s instrucción/es seleccionada/s.
 * 				  - <ALTER> = indica la alteración de la tabla consecuente.
-------------------------------------------------------------------------- */

/* -------------------------- Instrucciones Básicas ------------------------- */

-- Crear una tabla llamada 'Music' y sus filas.
CREATE TABLE Music (
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY, -- Fila única e irrepetible por la función 'AUTO_INCREMENT'
	articleID INT NOT NULL,
	label VARCHAR(50) NOT NULL,
	theCode BIGINT NOT NULL,
	theFormat VARCHAR(50) NOT NULL,
	classification VARCHAR(100) NOT NULL	
)

ALTER TABLE Article ADD COLUMN pages INT NOT NULL; -- Agrega una fila de tipo entero no nulo.
ALTER TABLE Article ADD COLUMN editorial VARCHAR(100); -- Agrega una fila de tipo string de 100 caracteres.

DROP TABLE ArticleTwo; -- Elimina la tabla 'ArticleTwo'.
ALTER TABLE Article DROP COLUMN ISBN; -- Elimina la fila 'ISBN'.

ALTER TABLE Book ADD CONSTRAINT CHECK(numberPages > 0) -- Agrega una condición a la fila 'numberPages'.



/* ------------------------- LLaves y Vinculaciones ------------------------- */

ALTER TABLE Book ADD CONSTRAINT Book__articleID__unique UNIQUE(articleID) -- Define una llave 'UNIQUE' a la fila 'articleId' de la tabla 'Book'.

-- Vincular la fila 'musicID' (tabla 'MusicThemes') al 'ID' (tabla 'Music') - Llave 'FOREIGN'.
ALTER TABLE	MusicThemes ADD CONSTRAINT MusicThemes__articleID__Article__foreignKey FOREIGN KEY(musicID) REFERENCES Music(ID);



/* --------------------------- Consultas Avanzadas -------------------------- */

DESCRIBE Article; -- Muestra la estructura de la tabla 'Article'.

SELECT * FROM Article; -- Obtiene todos los registros de la tabla 'Article'.
SELECT * FROM Article WHERE ID = 2; -- Obtiene el registro que tiene el 'ID' = 2 de la tabla 'Article'.
SELECT * FROM Music JOIN Article ON Music.articleID = Article.ID; -- Obtiene los registros compartidos entre la tabla 'Music' y 'Article', en base a los IDs.

-- Obtener registros compartidos en base a filtros
SELECT
	Article.ID,
	Article.author,
	Music.theCode
FROM Music JOIN Article ON
	Music.articleID = Article.ID
JOIN MusicThemes ON
	MusicThemes.musicID = Music.ID;