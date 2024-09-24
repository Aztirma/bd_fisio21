
-- Ejercicios Básicos de SQL - Examen práctico de SQL caso “BD_FISIO21”

-- 1. Realiza una consulta que muestre los nombres de los pacientes que viven en el distrito "Miraflores".
SELECT nombres, apellido_paterno, apellido_materno, distrito 
FROM PACIENTES 
WHERE distrito = 'Miraflores';

-- 2. Encontrar fisioterapeutas cuyo apellido paterno comienza con 'Quil'.
SELECT nombres, apellido_paterno, apellido_materno, celular 
FROM FISIOTERAPEUTAS 
WHERE apellido_paterno LIKE 'Q%';

-- 3. Muestra el total de los montos pagados por todos los pacientes.
SELECT SUM(monto) AS total_pagado 
FROM PAGOS;

-- 4. Calcula el promedio de las edades de los pacientes.(NO)
SELECT AVG(DATEDIFF(YEAR, fecha_de_nacimiento, GETDATE())) AS edad_promedio 
FROM PACIENTES;

-- 5. Muestra los detalles de pago del paciente con número de documento '12345678'.
SELECT * 
FROM PAGOS 
WHERE id_paciente = (SELECT id_paciente FROM PACIENTES WHERE numero_documento = '001103695');

-- 6. Agrupa los pagos por tipo_doc y cuenta cuántos pagos se realizaron por cada tipo.
SELECT tipo_doc, COUNT(*) AS cantidad_pagos 
FROM PAGOS 
GROUP BY tipo_doc;

-- 7. Encontrar el número de fisioterapeutas que han trabajado en cada turno.
SELECT turno, COUNT(DISTINCT id_fisioteapeuta) AS cantidad_fisioterapeutas
FROM HORARIOS
GROUP BY turno;

-- 8. Muestra cuántas reservas en estado 'RESERVADO' tiene cada paciente.
SELECT id_paciente, COUNT(*) AS reservas_activas 
FROM RESERVAS 
WHERE estado = 'RESERVADO' 
GROUP BY id_paciente;

-- 9. Muestra los pacientes que tienen más de 2 hijos y que viven en los distritos "Miraflores" o "San Isidro".
SELECT nombres, apellido_paterno, apellido_materno, numero_hijos, distrito 
FROM PACIENTES 
WHERE numero_hijos > 2 
AND distrito IN ('Miraflores', 'San Isidro');

-- 10. Muestra el nombre del paciente y el monto mayor de los pagos con estado 'cancelado'.
SELECT TOP 1 P.nombres, P.apellido_paterno, P.apellido_materno, MAX(PA.monto) AS monto_mayor_pendiente
FROM PACIENTES P
JOIN PAGOS PA ON P.id_paciente = PA.id_paciente
WHERE PA.estado = 'cancelado'
GROUP BY P.nombres, P.apellido_paterno, P.apellido_materno
ORDER BY monto_mayor_pendiente DESC;

-- 11. Muestra el número de servicios realizados por cada fisioterapeuta.
SELECT F.nombres, F.apellido_paterno, F.apellido_materno, COUNT(R.id_servicio) AS total_servicios 
FROM FISIOTERAPEUTAS F 
JOIN RESERVAS R ON F.id_fisioteapeuta = R.id_fisioteapeuta 
GROUP BY F.nombres, F.apellido_paterno, F.apellido_materno;

-- 12. Muestra el nombre del programa y el promedio de la valorización para cada tipo de programa.
SELECT P.nombre_programa, AVG(V.valorizacion) AS promedio_valorizacion 
FROM PROGRAMAS P 
JOIN VALORIZACION V ON P.id_programa = V.id_programa 
GROUP BY P.nombre_programa;

-- 13. Muestra los pacientes que tienen más de una reserva el mismo día.
SELECT P.nombres, P.apellido_paterno, P.apellido_materno, R.fecha_reserva, COUNT(R.id_reserva) AS total_reservas
FROM PACIENTES P
JOIN RESERVAS R ON P.id_paciente = R.id_paciente
WHERE R.estado = 'RESERVADO'
GROUP BY P.nombres, P.apellido_paterno, P.apellido_materno, R.fecha_reserva;

-- 14. Muestra la suma de los pagos realizados agrupados por fecha.
SELECT fecha, SUM(monto) AS total_pagado 
FROM PAGOS 
GROUP BY fecha;

-- 15. Muestra los fisioterapeutas que trabajan en el turno 'Mañana'.
SELECT F.nombres, F.apellido_paterno, H.turno 
FROM FISIOTERAPEUTAS F 
JOIN HORARIOS H ON F.id_fisioteapeuta = H.id_fisioteapeuta 
WHERE H.turno = 'Mañana';

-- 16. Muestra los pacientes que tienen pagos pendientes (estado 'Pendiente') y el monto total de sus pagos pendientes.
SELECT P.nombres, P.apellido_paterno, SUM(PA.monto) AS total_pendiente 
FROM PACIENTES P 
JOIN PAGOS PA ON P.id_paciente = PA.id_paciente 
WHERE PA.estado = 'pendiente' 
GROUP BY P.nombres, P.apellido_paterno;

-- 17. Mostrar los pacientes y el monto total de pagos realizados por cada uno:
SELECT P.nombres, P.apellido_paterno, SUM(PA.monto) AS total_pagado 
FROM PACIENTES P 
JOIN PAGOS PA ON P.id_paciente = PA.id_paciente 
GROUP BY P.nombres, P.apellido_paterno;

-- 18. Muestra los pacientes que han reservado el servicio llamado "Paquete de terapias (2)".
SELECT P.nombres, P.apellido_paterno, P.apellido_materno 
FROM PACIENTES P 
JOIN RESERVAS R ON P.id_paciente = R.id_paciente 
JOIN SERVICIOS S ON R.id_servicio = S.id_servicio 
WHERE S.nombre_servicio = 'Paquete de terapias (2)';

-- 19. Muestra la suma de los pagos, agrupados por el estado del pago y el tipo de documento utilizado.
SELECT estado, tipo_doc, SUM(monto) AS total_pagado 
FROM PAGOS 
GROUP BY estado, tipo_doc;

-- 20. Consulta de Pacientes sin Registros de Pago
SELECT P.nombres, P.apellido_paterno 
FROM PACIENTES P 
LEFT JOIN PAGOS PA ON P.id_paciente = PA.id_paciente 
WHERE PA.id_pago IS NULL;
