CREATE DATABASE [BD_FISIO21];
GO

USE [BD_FISIO21];
GO

-- Tabla PACIENTES
CREATE TABLE PACIENTES (
    id_paciente INT IDENTITY(1,1) PRIMARY KEY,
    numero_documento VARCHAR(15) UNIQUE NOT NULL,
    nombres VARCHAR(255) NOT NULL,
    apellido_paterno VARCHAR(255) NOT NULL,
    apellido_materno VARCHAR(255) NOT NULL,
    celular VARCHAR(15) NOT NULL,
    email VARCHAR(255) NOT NULL,
    fecha_de_nacimiento DATE NOT NULL,
    distrito VARCHAR(255) NOT NULL,
    estado_civil VARCHAR(15) NOT NULL,
    ocupacion VARCHAR(255) NOT NULL,
    numero_hijos INT NOT NULL
);
GO

-- Tabla FISIOTERAPEUTAS
CREATE TABLE FISIOTERAPEUTAS (
    id_fisioteapeuta INT IDENTITY(1,1) PRIMARY KEY,
    numero_documento VARCHAR(15) UNIQUE NOT NULL,
    nombres VARCHAR(255) NOT NULL,
    apellido_paterno VARCHAR(255) NOT NULL,
    apellido_materno VARCHAR(255) NOT NULL,
    celular VARCHAR(15) NOT NULL,
    estado VARCHAR(15) NOT NULL,
    fecha_ingreso DATE NOT NULL,
    fecha_cese DATE NULL,
    grado_academico VARCHAR(255) NOT NULL
);
GO

-- Tabla HORARIOS
CREATE TABLE HORARIOS (
    id_horario INT IDENTITY(1,1) PRIMARY KEY,
    id_fisioteapeuta INT NOT NULL,
    fecha DATE NOT NULL,
    turno VARCHAR(15) NOT NULL,
    FOREIGN KEY (id_fisioteapeuta) REFERENCES FISIOTERAPEUTAS(id_fisioteapeuta)
);
GO

-- Tabla SERVICIOS
CREATE TABLE SERVICIOS (
    id_servicio INT IDENTITY(1,1) PRIMARY KEY,
    nombre_servicio VARCHAR(255) NOT NULL,
    descripcion_servicio VARCHAR(255) NOT NULL
);
GO

-- Tabla PROGRAMAS
CREATE TABLE PROGRAMAS (
    id_programa INT IDENTITY(1,1) PRIMARY KEY,
    nombre_programa VARCHAR(255) NOT NULL,
    descripcion_programa VARCHAR(255) NOT NULL
);
GO

-- Tabla VALORIZACION
CREATE TABLE VALORIZACION (
    id_valorizacion INT IDENTITY(1,1) PRIMARY KEY,
    id_servicio INT NOT NULL,
    id_programa INT NOT NULL,
    valorizacion MONEY NOT NULL,
    FOREIGN KEY (id_servicio) REFERENCES SERVICIOS(id_servicio),
    FOREIGN KEY (id_programa) REFERENCES PROGRAMAS(id_programa)
);
GO

-- Tabla PAGOS
CREATE TABLE PAGOS (
    id_pago INT IDENTITY(1,1) PRIMARY KEY,
    fecha DATETIME NOT NULL,
    id_paciente INT NOT NULL,
    id_valorizacion INT NOT NULL,
    numero_cuotas INT NOT NULL,
    monto MONEY NOT NULL,
    tipo_doc VARCHAR(15) NOT NULL,
    numero_doc VARCHAR(15) NOT NULL,
    estado VARCHAR(15) NOT NULL,
    FOREIGN KEY (id_paciente) REFERENCES PACIENTES(id_paciente),
    FOREIGN KEY (id_valorizacion) REFERENCES VALORIZACION(id_valorizacion)
);
GO

-- Tabla RESERVAS
CREATE TABLE RESERVAS (
    id_reserva INT IDENTITY(1,1) PRIMARY KEY,
    id_paciente INT NOT NULL,
    id_servicio INT NOT NULL,
    id_programa INT NOT NULL,
    id_fisioteapeuta INT NOT NULL,
    id_valorizacion INT NOT NULL,
    fecha_reserva DATE NOT NULL,
    hora_reserva TIME NOT NULL,
    estado VARCHAR(15) NOT NULL,
    FOREIGN KEY (id_paciente) REFERENCES PACIENTES(id_paciente),
    FOREIGN KEY (id_servicio) REFERENCES SERVICIOS(id_servicio),
    FOREIGN KEY (id_programa) REFERENCES PROGRAMAS(id_programa),
    FOREIGN KEY (id_fisioteapeuta) REFERENCES FISIOTERAPEUTAS(id_fisioteapeuta),
    FOREIGN KEY (id_valorizacion) REFERENCES VALORIZACION(id_valorizacion)
);
GO
