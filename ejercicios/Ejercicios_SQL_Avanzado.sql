-- 1. Total de pagos pendientes por paciente, ordenados de mayor a menor:
SELECT P.nombres, P.apellido_paterno, P.apellido_materno, SUM(PA.monto) AS total_pendiente
FROM PACIENTES P
JOIN PAGOS PA ON P.id_paciente = PA.id_paciente
WHERE PA.estado = 'pendiente'
GROUP BY P.nombres, P.apellido_paterno, P.apellido_materno
ORDER BY total_pendiente DESC;

-- 2. Fisioterapeutas que han atendido el mayor número de pacientes en un mismo mes:
SELECT TOP 1 
    F.nombres, 
    F.apellido_paterno, 
    COUNT(DISTINCT R.id_paciente) AS total_pacientes, 
    MONTH(R.fecha_reserva) AS mes
FROM FISIOTERAPEUTAS F
JOIN RESERVAS R ON F.id_fisioteapeuta = R.id_fisioteapeuta
GROUP BY F.nombres, F.apellido_paterno, MONTH(R.fecha_reserva)
ORDER BY total_pacientes DESC;

-- 3. Fisioterapeutas que han atendido pacientes con el mayor valor de servicios
SELECT F.nombres, F.apellido_paterno, SUM(V.valorizacion) AS total_valorizacion
FROM FISIOTERAPEUTAS F
JOIN RESERVAS R ON F.id_fisioteapeuta = R.id_fisioteapeuta
JOIN VALORIZACION V ON R.id_valorizacion = V.id_valorizacion
GROUP BY F.nombres, F.apellido_paterno
HAVING SUM(V.valorizacion) > (
    SELECT AVG(total_valorizacion) 
    FROM (SELECT SUM(V2.valorizacion) AS total_valorizacion
          FROM FISIOTERAPEUTAS F2
          JOIN RESERVAS R2 ON F2.id_fisioteapeuta = R2.id_fisioteapeuta
          JOIN VALORIZACION V2 ON R2.id_valorizacion = V2.id_valorizacion
          GROUP BY F2.id_fisioteapeuta) AS subquery_avg
)
ORDER BY total_valorizacion DESC;


-- 4. Pacientes con el mayor número de reservas completadas:
SELECT P.nombres, P.apellido_paterno, P.apellido_materno, COUNT(R.id_reserva) AS total_reservas
FROM PACIENTES P
JOIN RESERVAS R ON P.id_paciente = R.id_paciente
WHERE R.estado = 'COMPLETADO'
GROUP BY P.nombres, P.apellido_paterno, P.apellido_materno
ORDER BY total_reservas DESC;

-- 5. Comparar promedio de valorizaciones de pacientes con pagos completados y pendientes
SELECT estado, AVG(total_valorizacion) AS promedio_valorizacion
FROM (
    SELECT P.nombres, P.apellido_paterno, PA.estado, SUM(V.valorizacion) AS total_valorizacion
    FROM PACIENTES P
    JOIN RESERVAS R ON P.id_paciente = R.id_paciente
    JOIN VALORIZACION V ON R.id_valorizacion = V.id_valorizacion
    JOIN PAGOS PA ON P.id_paciente = PA.id_paciente
    GROUP BY P.nombres, P.apellido_paterno, PA.estado
) AS subquery
GROUP BY estado
ORDER BY promedio_valorizacion DESC;





-- 6. Pacientes con pagos pendientes superiores al promedio de pagos pendientes:
SELECT P.nombres, P.apellido_paterno, P.apellido_materno, SUM(PA.monto) AS total_pendiente
FROM PACIENTES P
JOIN PAGOS PA ON P.id_paciente = PA.id_paciente
WHERE PA.estado = 'pendiente'
GROUP BY P.nombres, P.apellido_paterno, P.apellido_materno
HAVING SUM(PA.monto) > (
    SELECT AVG(total_pendiente)
    FROM (
        SELECT SUM(PA2.monto) AS total_pendiente
        FROM PAGOS PA2
        WHERE PA2.estado = 'pendiente'
        GROUP BY PA2.id_paciente
    ) AS subquery
)
ORDER BY total_pendiente DESC;
