--- Objetivo del Proyecto del Día 
--- • Identificar las series más exitosas en la base de datos NetflixDB 
--- • Las series más exitosas se definen por cantidad de episodios y rating promedio de IMDB 7

--- • El resultado es una tabla con tres columnas: 
--- Titulo de la serie,
--- cantidad de episodios
--- rating promedio de imdb.´ -- 

WITH EstadisticasSerie AS (SELECT serie_id, 
COUNT(*) AS cantidad_episodios, AVG(rating_imdb) AS rating_promedio 
FROM episodios GROUP BY serie_id)
SELECT 
    Series.titulo,
    EstadisticasSerie.cantidad_episodios,
    EstadisticasSerie.rating_promedio
    FROM Series
INNER JOIN EstadisticasSerie
    ON Series.serie_id = EstadisticasSerie.serie_id
    ORDER BY rating_promedio DESC;

