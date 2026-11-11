ega · SQL
-- =====================================================================
-- setup_preentrega.sql
-- Base de datos de práctica para la preentrega de análisis avanzado
-- Crea y carga las tablas: categorias, productos y ventas (año 2025)
-- Motor: PostgreSQL
-- =====================================================================
-- ANTES de ejecutar este script, crear la base y conectarse a ella:
--   CREATE DATABASE preentrega_ventas;
-- (CREATE DATABASE debe ejecutarse sola, no junto con el resto)
-- =====================================================================
 
-- Limpiar si ya existen (orden inverso a las claves foráneas)
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS categorias;
 
-- ---------------------------------------------------------------------
-- Tabla: categorias
-- ---------------------------------------------------------------------
CREATE TABLE categorias (
    id_categoria  SERIAL PRIMARY KEY,
    nombre        VARCHAR(50) NOT NULL UNIQUE
);
 
-- ---------------------------------------------------------------------
-- Tabla: productos (cada producto pertenece a una categoría)
-- ---------------------------------------------------------------------
CREATE TABLE productos (
    id_producto      SERIAL PRIMARY KEY,
    nombre           VARCHAR(100)  NOT NULL,
    id_categoria     INT           NOT NULL REFERENCES categorias(id_categoria),
    precio_unitario  NUMERIC(10,2) NOT NULL CHECK (precio_unitario > 0)
);
 
-- ---------------------------------------------------------------------
-- Tabla: ventas (monto = cantidad * precio_unitario)
-- ---------------------------------------------------------------------
CREATE TABLE ventas (
    id_venta     SERIAL PRIMARY KEY,
    fecha        DATE          NOT NULL,
    id_producto  INT           NOT NULL REFERENCES productos(id_producto),
    cantidad     INT           NOT NULL CHECK (cantidad > 0),
    monto        NUMERIC(12,2) NOT NULL CHECK (monto >= 0)
);
 
-- ---------------------------------------------------------------------
-- Datos: categorias
-- ---------------------------------------------------------------------
INSERT INTO categorias (nombre) VALUES
    ('Tecnología'),
    ('Accesorios'),
    ('Mobiliario'),
    ('Electrodomésticos');
 
-- ---------------------------------------------------------------------
-- Datos: productos (id_categoria: 1 Tecnología, 2 Accesorios,
--                   3 Mobiliario, 4 Electrodomésticos)
-- ---------------------------------------------------------------------
INSERT INTO productos (nombre, id_categoria, precio_unitario) VALUES
    ('Notebook 14"', 1, 850000.00),
    ('Monitor 24"', 1, 210000.00),
    ('Impresora láser', 1, 390000.00),
    ('Mouse inalámbrico', 2, 18000.00),
    ('Teclado mecánico', 2, 65000.00),
    ('Auriculares', 2, 45000.00),
    ('Silla ergonómica', 3, 320000.00),
    ('Escritorio', 3, 280000.00),
    ('Heladera', 4, 950000.00),
    ('Microondas', 4, 180000.00);
 
-- ---------------------------------------------------------------------
-- Datos: ventas de enero a diciembre de 2025
-- Con variaciones por temporada para que haya meses por encima y por
-- debajo del promedio de cada categoría.
-- ---------------------------------------------------------------------
INSERT INTO ventas (fecha, id_producto, cantidad, monto) VALUES
    ('2025-01-02',  8,   5,   1400000.00),
    ('2025-01-04',  2,   5,   1050000.00),
    ('2025-01-10', 10,   4,    720000.00),
    ('2025-01-14',  4,   6,    108000.00),
    ('2025-01-14',  5,   6,    390000.00),
    ('2025-01-17',  3,   2,    780000.00),
    ('2025-01-21',  1,   3,   2550000.00),
    ('2025-01-31',  6,  10,    450000.00),
    ('2025-01-31',  7,   5,   1600000.00),
    ('2025-02-03',  4,  14,    252000.00),
    ('2025-02-06',  2,   3,    630000.00),
    ('2025-02-06',  9,   2,   1900000.00),
    ('2025-02-07',  3,   2,    780000.00),
    ('2025-02-15',  8,   4,   1120000.00),
    ('2025-02-19',  1,   2,   1700000.00),
    ('2025-02-25',  7,   4,   1280000.00),
    ('2025-03-02',  5,  12,    780000.00),
    ('2025-03-03', 10,   2,    360000.00),
    ('2025-03-04',  3,   5,   1950000.00),
    ('2025-03-11',  4,   9,    162000.00),
    ('2025-03-15',  2,   3,    630000.00),
    ('2025-03-17',  1,   4,   3400000.00),
    ('2025-03-20',  9,   2,   1900000.00),
    ('2025-03-26',  7,   3,    960000.00),
    ('2025-04-02',  3,   3,   1170000.00),
    ('2025-04-02',  9,   1,    950000.00),
    ('2025-04-12',  8,   3,    840000.00),
    ('2025-04-22',  5,  11,    715000.00),
    ('2025-04-22',  7,   2,    640000.00),
    ('2025-04-24', 10,   1,    180000.00),
    ('2025-05-03',  6,  11,    495000.00),
    ('2025-05-06',  8,   3,    840000.00),
    ('2025-05-08',  7,   2,    640000.00),
    ('2025-05-11', 10,   1,    180000.00),
    ('2025-05-13',  2,   2,    420000.00),
    ('2025-05-14',  9,   1,    950000.00),
    ('2025-05-23',  4,  15,    270000.00),
    ('2025-05-27',  3,   4,   1560000.00),
    ('2025-05-28',  1,   2,   1700000.00),
    ('2025-05-29',  5,  13,    845000.00),
    ('2025-06-07', 10,   1,    180000.00),
    ('2025-06-16',  8,   2,    560000.00),
    ('2025-06-22',  3,   3,   1170000.00),
    ('2025-06-28',  5,  16,   1040000.00),
    ('2025-07-04',  6,   9,    405000.00),
    ('2025-07-05',  2,   3,    630000.00),
    ('2025-07-05',  8,   3,    840000.00),
    ('2025-07-09',  9,   2,   1900000.00),
    ('2025-07-15',  7,   3,    960000.00),
    ('2025-07-17', 10,   2,    360000.00),
    ('2025-07-20',  1,   3,   2550000.00),
    ('2025-07-20',  3,   6,   2340000.00),
    ('2025-07-20',  4,  12,    216000.00),
    ('2025-07-31',  5,  11,    715000.00),
    ('2025-08-06',  6,  14,    630000.00),
    ('2025-08-17',  1,   4,   3400000.00),
    ('2025-08-18',  7,   3,    960000.00),
    ('2025-08-21',  3,   3,   1170000.00),
    ('2025-08-26',  9,   2,   1900000.00),
    ('2025-08-30',  2,   3,    630000.00),
    ('2025-09-12',  4,  13,    234000.00),
    ('2025-09-12', 10,   3,    540000.00),
    ('2025-09-13',  2,   2,    420000.00),
    ('2025-09-20',  8,   2,    560000.00),
    ('2025-10-08',  2,   3,    630000.00),
    ('2025-10-16',  3,   3,   1170000.00),
    ('2025-10-23', 10,   2,    360000.00),
    ('2025-10-26',  7,   3,    960000.00),
    ('2025-11-03',  5,  15,    975000.00),
    ('2025-11-05',  7,   2,    640000.00),
    ('2025-11-20',  9,   3,   2850000.00),
    ('2025-11-24',  4,  23,    414000.00),
    ('2025-11-26',  2,   3,    630000.00),
    ('2025-12-01',  8,   4,   1120000.00),
    ('2025-12-05',  3,   5,   1950000.00),
    ('2025-12-08',  9,   3,   2850000.00),
    ('2025-12-14',  6,  27,   1215000.00),
    ('2025-12-24',  4,  25,    450000.00);
 
-- ---------------------------------------------------------------------
-- Verificación rápida
-- ---------------------------------------------------------------------
SELECT 'categorias' AS tabla, COUNT(*) AS filas FROM categorias
UNION ALL
SELECT 'productos',  COUNT(*) FROM productos
UNION ALL
SELECT 'ventas',     COUNT(*) FROM ventas;



-- =====================================================================
-- preentrega_analisis_avanzado.sql
-- Análisis avanzado de ventas mensuales por categoría
-- Técnicas: CTEs encadenadas, funciones de ventana y CASE WHEN
-- Motor: PostgreSQL
-- Tablas: ventas, productos, categorias
-- =====================================================================
-- Ejecutar la sentencia completa (desde WITH hasta el ; final).
-- Las CTEs solo existen dentro de esta sentencia.
-- =====================================================================



WITH ventas_mensuales AS (
    SELECT
        EXTRACT(YEAR  FROM v.fecha)   AS anio,
        EXTRACT(MONTH FROM v.fecha)   AS mes,
        c.nombre                      AS categoria,
        SUM(v.monto)                  AS total_ventas
    FROM ventas AS v
    INNER JOIN productos AS p
        ON v.id_producto = p.id_producto
    INNER JOIN categorias AS c
        ON p.id_categoria = c.id_categoria
    GROUP BY
        EXTRACT(YEAR  FROM v.fecha),
        EXTRACT(MONTH FROM v.fecha),
        c.nombre
),
metricas_ventana AS (
    SELECT
        anio,
        mes,
        categoria,
        total_ventas,
        RANK() OVER (
            PARTITION BY anio, mes
            ORDER BY total_ventas DESC
        )                                         AS ranking_mes,
        SUM(total_ventas) OVER (
            PARTITION BY categoria
            ORDER BY anio, mes
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        )                                         AS total_acumulado,
        AVG(total_ventas) OVER (
            PARTITION BY categoria
        )                                         AS promedio_categoria
    FROM ventas_mensuales
)
SELECT
    anio,
    mes,
    categoria,
    total_ventas,
    ranking_mes,
    total_acumulado,
    ROUND(promedio_categoria, 2)                  AS promedio_categoria,
    CASE
        WHEN total_ventas >= promedio_categoria THEN 'Exitoso'
        ELSE                                         'Bajo el promedio'
    END                                           AS desempenio_mes
FROM metricas_ventana
ORDER BY
    anio,
    mes,
    ranking_mes;