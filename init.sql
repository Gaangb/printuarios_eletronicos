CREATE TABLE Pacientes (
    id SERIAL PRIMARY KEY,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    nome VARCHAR(255) NOT NULL,
    dt_nascimento DATE NOT NULL,
    endereco VARCHAR(255),
    email VARCHAR(255),
    plano_saude VARCHAR(255),
    carteirinha_plano VARCHAR(20)
);

CREATE TABLE Atendimentos (
    id SERIAL PRIMARY KEY,
    paciente_id INT REFERENCES Pacientes(id),
    descricao TEXT NOT NULL,
    data_atendimento DATE NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    usuario VARCHAR(255) NOT NULL,
    tipo_atendimento VARCHAR(20) CHECK (tipo_atendimento IN ('consulta', 'exame')),
    numero_atendimento VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE Usuarios (
    id SERIAL PRIMARY KEY,
    cpf_usuario VARCHAR(14) UNIQUE NOT NULL,
    login VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL
);

INSERT INTO
    Pacientes (
        cpf,
        nome,
        dt_nascimento,
        endereco,
        email,
        plano_saude,
        carteirinha_plano
    )
VALUES
    (
        '123.456.789-00',
        'João da Silva',
        '1990-01-15',
        'Rua A, 123',
        'joao@email.com',
        'Plano A',
        '12345'
    ),
    (
        '987.654.321-00',
        'Maria Souza',
        '1985-05-20',
        'Rua B, 456',
        'maria@email.com',
        'Plano B',
        '54321'
    ),
    (
        '111.222.333-00',
        'Pedro Santos',
        '2000-10-10',
        'Rua C, 789',
        'pedro@email.com',
        'Plano C',
        '67890'
    );

INSERT INTO
    Atendimentos (
        paciente_id,
        descricao,
        data_atendimento,
        valor,
        usuario,
        tipo_atendimento,
        numero_atendimento
    )
VALUES
    (
        1,
        'Consulta de rotina',
        '2023-09-28',
        100.00,
        'Dr. Silva',
        'consulta',
        'A001'
    ),
    (
        1,
        'Exame de sangue',
        '2023-09-29',
        50.00,
        'Lab A',
        'exame',
        'E001'
    ),
    (
        2,
        'Consulta de acompanhamento',
        '2023-09-30',
        120.00,
        'Dr. Souza',
        'consulta',
        'A002'
    ),
    (
        3,
        'Consulta pediátrica',
        '2023-10-01',
        80.00,
        'Dr. Santos',
        'consulta',
        'A003'
    );

INSERT INTO
    Usuarios (cpf_usuario, login, senha)
VALUES
    ('555.555.555-00', 'usuario1', 'senha123'),
    ('666.666.666-00', 'usuario2', 'senha456');