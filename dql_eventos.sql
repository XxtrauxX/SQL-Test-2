-- las inserciones me fallaron pero esta es la idea para que tenia de como hacer cada uno

--InformeAlquileresMensual: Genera un informe mensual de alquileres y lo almacena automáticamente.





-- 4. Evento mensual para generar un reporte y almacenar datos en reportes_mensuales




CREATE EVENT reporte_mensual 
ON SCHEDULE EVERY 1 MONTH
DO
BEGIN
    INSERT INTO reportes_mensuales (mes, total_presupuestos, total_gastos)
    SELECT DATE_FORMAT(CURDATE(), '%Y-%m'), COUNT(*), (SELECT SUM(monto) FROM gastos)
    FROM presupuestos;
END$$