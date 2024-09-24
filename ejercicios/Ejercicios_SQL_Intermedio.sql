-- Ejercicios Intermedios de SQL - Examen práctico de SQL caso “BD_FISIO21”

-- 1. Pacientes que han realizado el mayor número de pagos en un mes:
SELECT TOP 5 P.nombres, P.apellido_paterno, COUNT(PA.id_pago) AS total_pagos, MONTH(PA.fecha) AS mes
FROM PACIENTES P
JOIN PAGOS PA ON P.id_paciente = PA.id_paciente
GROUP BY P.nombres, P.apellido_paterno, MONTH(PA.fecha)
ORDER BY total_pagos DESC, mes DESC;

-- 2. Fisioterapeutas con el mayor número de reservas en el mes actual:
SELECT TOP 5 F.nombres, F.apellido_paterno, COUNT(R.id_reserva) AS total_reservas
FROM FISIOTERAPEUTAS F
JOIN RESERVAS R ON F.id_fisioteapeuta = R.id_fisioteapeuta
WHERE MONTH(R.fecha_reserva) = MONTH(GETDATE()) -- Cambiado al mes actual
GROUP BY F.nombres, F.apellido_paterno
ORDER BY total_reservas DESC;

-- 3. Monto total pagado por cada paciente agrupado por tipo de documento:
SELECT P.nombres, P.apellido_paterno, PA.tipo_doc, SUM(PA.monto) AS total_pagado
FROM PACIENTES P
JOIN PAGOS PA ON P.id_paciente = PA.id_paciente
GROUP BY P.nombres, P.apellido_paterno, PA.tipo_doc
ORDER BY total_pagado DESC;

-- 4. Pacientes que han realizado pagos, agrupados por día (sin el filtro de HAVING):
SELECT P.nombres, P.apellido_paterno, COUNT(PA.id_pago) AS total_pagos, PA.fecha
FROM PACIENTES P
JOIN PAGOS PA ON P.id_paciente = PA.id_paciente
GROUP BY P.nombres, P.apellido_paterno, PA.fecha
ORDER BY total_pagos DESC;

-- 5. Promedio de valorizaciones por fisioterapeuta, sin el filtro de más de 3 reservas:
SELECT F.nombres, F.apellido_paterno, AVG(V.valorizacion) AS promedio_valorizacion
FROM FISIOTERAPEUTAS F
JOIN RESERVAS R ON F.id_fisioteapeuta = R.id_fisioteapeuta
JOIN VALORIZACION V ON R.id_valorizacion = V.id_valorizacion
WHERE R.estado = 'COMPLETADO'
GROUP BY F.nombres, F.apellido_paterno
ORDER BY promedio_valorizacion DESC;

-- 6. Servicios más frecuentemente reservados por cada fisioterapeuta:
SELECT F.nombres, F.apellido_paterno, S.nombre_servicio, COUNT(R.id_reserva) AS total_reservas
FROM FISIOTERAPEUTAS F
JOIN RESERVAS R ON F.id_fisioteapeuta = R.id_fisioteapeuta
JOIN SERVICIOS S ON R.id_servicio = S.id_servicio
GROUP BY F.nombres, F.apellido_paterno, S.nombre_servicio
ORDER BY total_reservas DESC;

