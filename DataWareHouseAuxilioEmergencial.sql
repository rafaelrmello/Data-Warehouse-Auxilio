--Criação do Banco de Dados--
CREATE DATABASE DW_AuxilioEmergencial;

--Criação das tabelas dimensão--
CREATE TABLE dim_beneficiario (
    id INT PRIMARY KEY,
    cpf VARCHAR(14),
    nome VARCHAR(255),
    data_nascimento DATE,
);

CREATE TABLE dim_pagamento (
    id INT PRIMARY KEY,
    data_pagamento DATE,
    banco VARCHAR(255),
    agencia VARCHAR(20),
);

CREATE TABLE dim_municipio (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    estado VARCHAR(2),
    codigo_ibge INT,
);

CREATE TABLE dim_tipo_beneficio (
    id INT PRIMARY KEY,
    tipo VARCHAR(255),
);

CREATE TABLE dim_situacao_beneficio (
    id INT PRIMARY KEY,
    situacao VARCHAR(255),
);

--Criação da tabela fato--
CREATE TABLE fato_auxilio_emergencial (
    id INT PRIMARY KEY,
    id_beneficiario INT,
    id_pagamento INT,
    id_municipio INT,
    id_tipo_beneficio INT,
    id_situacao_beneficio INT,
    valor_beneficio DECIMAL(10, 2),
    FOREIGN KEY (id_beneficiario) REFERENCES dim_beneficiario(id),
    FOREIGN KEY (id_pagamento) REFERENCES dim_pagamento(id),
    FOREIGN KEY (id_municipio) REFERENCES dim_municipio(id),
    FOREIGN KEY (id_tipo_beneficio) REFERENCES dim_tipo_beneficio(id),
    FOREIGN KEY (id_situacao_beneficio) REFERENCES dim_situacao_beneficio(id)
);


--Inserção dos dados nas tabelas dimensão--
INSERT INTO dim_beneficiario (id, cpf, nome, data_nascimento) VALUES
(1, '111.111.111-11', 'João da Silva', '1990-01-15'),
(2, '222.222.222-22', 'Maria Oliveira', '1985-05-20'),
(3, '333.333.333-33', 'José Santos', '2000-12-10'),
(4, '444.444.444-44', 'Ana Costa', '1993-03-25'),
(5, '555.555.555-55', 'Pedro Almeida', '1978-08-05'),
(6, '666.666.666-66', 'Sandra Machado', '1982-11-12'),
(7, '777.777.777-77', 'Carlos Cardoso', '1995-09-30'),
(8, '888.888.888-88', 'Fernanda Nunes', '1972-06-18'),
(9, '999.999.999-99', 'Ricardo Rocha', '1987-04-07'),
(10, '101.101.101-10', 'Amanda Souza', '1998-02-14'),
(11, '111.111.111-11', 'Marcos Lima', '1980-07-23'),
(12, '121.121.121-12', 'Tatiana Santos', '1991-10-29'),
(13, '131.131.131-13', 'Roberto Alves', '1983-12-04'),
(14, '141.141.141-14', 'Luciana Costa', '1976-01-08'),
(15, '151.151.151-15', 'Gustavo Oliveira', '1989-04-17'),
(16, '161.161.161-16', 'Carolina Silva', '1975-08-21'),
(17, '171.171.171-17', 'Hugo Pereira', '1994-11-27'),
(18, '181.181.181-18', 'Vanessa Rodrigues', '1986-03-13'),
(19, '191.191.191-19', 'Felipe Gonçalves', '1979-05-02'),
(20, '201.201.201-20', 'Mariana Vieira', '1996-09-09'),
(21, '211.211.211-21', 'Leonardo Moraes', '1981-02-18'),
(22, '221.221.221-22', 'Isabela Fernandes', '1992-06-26'),
(23, '231.231.231-23', 'Eduardo Carvalho', '1977-10-05'),
(24, '241.241.241-24', 'Juliana Martins', '1984-12-12'),
(25, '251.251.251-25', 'Alexandre Barbosa', '1997-01-21'),
(26, '261.261.261-26', 'Patrícia Lima', '1988-03-30'),
(27, '271.271.271-27', 'Daniel Costa', '1974-07-07'),
(28, '281.281.281-28', 'Larissa Almeida', '1990-09-15'),
(29, '291.291.291-29', 'Guilherme Nunes', '1985-11-24'),
(30, '301.301.301-30', 'Camila Rocha', '1973-04-03'),
(31, '311.311.311-31', 'Rodrigo Souza', '1982-06-11'),
(32, '321.321.321-32', 'Cristina Santos', '1993-10-19'),
(33, '331.331.331-33', 'Marcelo Alves', '1978-12-28'),
(34, '341.341.341-34', 'Teresa Costa', '1991-02-06'),
(35, '351.351.351-35', 'Raul Oliveira', '1984-05-15'),
(36, '361.361.361-36', 'Carla Silva', '1976-07-24'),
(37, '371.371.371-37', 'Henrique Pereira', '1989-09-01'),
(38, '381.381.381-38', 'Vitória Rodrigues', '1980-11-10'),
(39, '391.391.391-39', 'Paulo Gonçalves', '1995-01-18'),
(40, '401.401.401-40', 'Ana Carolina Vieira', '1971-03-28');

INSERT INTO dim_pagamento (id, data_pagamento, banco, agencia) VALUES
(1, '2024-01-05', 'Banco A', '1234'),
(2, '2024-02-10', 'Banco B', '5678'),
(3, '2024-03-15', 'Banco C', '9101')
(4, '2024-04-20', 'Caixa Econômica Federal', '1122'),
(5, '2024-05-25', 'Banco Itaú', '3344'),
(6, '2024-06-30', 'Banco Bradesco', '5566'),
(7, '2024-07-05', 'Banco do Brasil', '7788'),
(8, '2024-08-10', 'Banco Santander', '9900'),
(9, '2024-09-15', 'NuBank', '1122'),
(10, '2024-10-20', 'Caixa Econômica Federal', '3344'),
(11, '2024-11-25', 'Banco Itaú', '5566'),
(12, '2024-12-30', 'Banco Bradesco', '7788'),
(13, '2025-01-05', 'Banco do Brasil', '9900'),
(14, '2025-02-10', 'Banco Santander', '1122'),
(15, '2025-03-15', 'NuBank', '3344'),
(16, '2025-04-20', 'Caixa Econômica Federal', '5566'),
(17, '2025-05-25', 'Banco Itaú', '7788'),
(18, '2025-06-30', 'Banco Bradesco', '9900'),
(19, '2025-07-05', 'Banco do Brasil', '1122'),
(20, '2025-08-10', 'Banco Santander', '3344'),
(21, '2025-09-15', 'NuBank', '5566'),
(22, '2025-10-20', 'Caixa Econômica Federal', '7788'),
(23, '2025-11-25', 'Banco Itaú', '9900'),
(24, '2025-12-30', 'Banco Bradesco', '1122'),
(25, '2026-01-05', 'Banco do Brasil', '3344'),
(26, '2026-02-10', 'Banco Santander', '5566'),
(27, '2026-03-15', 'NuBank', '7788'),
(28, '2026-04-20', 'Caixa Econômica Federal', '9900'),
(29, '2026-05-25', 'Banco Itaú', '1122'),
(30, '2026-06-30', 'Banco Bradesco', '3344'),
(31, '2026-07-05', 'Banco do Brasil', '5566'),
(32, '2026-08-10', 'Banco Santander', '7788'),
(33, '2026-09-15', 'NuBank', '9900'),
(34, '2026-10-20', 'Caixa Econômica Federal', '1122'),
(35, '2026-11-25', 'Banco Itaú', '3344'),
(36, '2026-12-30', 'Banco Bradesco', '5566'),
(37, '2027-01-05', 'Banco do Brasil', '7788'),
(38, '2027-02-10', 'Banco Santander', '9900'),
(39, '2027-03-15', 'NuBank', '1122'),
(40, '2027-04-20', 'Caixa Econômica Federal', '3344');

INSERT INTO dim_municipio (id, nome, estado, codigo_ibge) VALUES
(1, 'São Paulo', 'SP', 3550308),
(2, 'Rio de Janeiro', 'RJ', 3304557),
(3, 'Belo Horizonte', 'MG', 3106200)
(4, 'Porto Alegre', 'RS', 4314902),
(5, 'Salvador', 'BA', 2927408),
(6, 'Recife', 'PE', 2611606),
(7, 'Fortaleza', 'CE', 2304400),
(8, 'Brasília', 'DF', 5300108),
(9, 'Curitiba', 'PR', 4106902),
(10, 'Florianópolis', 'SC', 4205407),
(11, 'Goiânia', 'GO', 5208707),
(12, 'Manaus', 'AM', 1302603),
(13, 'Belém', 'PA', 1501402);

INSERT INTO dim_tipo_beneficio (id, tipo) VALUES
(1, 'Auxílio Emergencial Regular'),
(2, 'Auxílio para Trabalhadores Informais'),
(3, 'Outro Tipo de Auxílio')

INSERT INTO dim_situacao_beneficio (id, situacao) VALUES
(1, 'Aprovado'),
(2, 'Em Análise'),
(3, 'Cancelado')


--Inserção dos dados na tabela fato--
INSERT INTO fato_auxilio_emergencial (id, id_beneficiario, id_pagamento, id_municipio, id_tipo_beneficio, id_situacao_beneficio, valor_beneficio) VALUES
(1, 1, 1, 1, 1, 1, 600.00),
(2, 2, 2, 2, 2, 1, 800.00),
(3, 3, 3, 3, 3, 2, 700.00),
(4, 4, 4, 4, 2, 2, 600.00),
(5, 5, 5, 5, 3, 1, 900.00),
(6, 6, 6, 6, 1, 2, 700.00),
(7, 7, 7, 7, 2, 1, 800.00),
(8, 8, 8, 8, 1, 2, 750.00),
(9, 9, 9, 9, 3, 1, 700.00),
(10, 10, 10, 5, 2, 2, 650.00),
(11, 11, 11, 11, 3, 1, 750.00),
(12, 12, 12, 12, 1, 2, 700.00),
(13, 13, 13, 13, 1, 1, 800.00),
(14, 14, 14, 1, 2, 2, 700.00),
(15, 15, 15, 7, 3, 1, 900.00),
(16, 16, 16, 5, 2, 2, 750.00),
(17, 17, 17, 2, 1, 1, 700.00),
(18, 18, 18, 13, 3, 2, 650.00),
(19, 19, 19, 12, 3, 1, 750.00),
(20, 20, 20, 11, 2, 2, 700.00),
(21, 21, 21, 5, 1, 1, 800.00),
(22, 22, 22, 3, 2, 2, 700.00),
(23, 23, 23, 4, 2, 1, 900.00),
(24, 24, 24, 7, 3, 2, 750.00),
(25, 25, 25, 8, 3, 1, 700.00),
(26, 26, 26, 6, 3, 2, 650.00),
(27, 27, 27, 11, 2, 1, 750.00),
(28, 28, 28, 9, 2, 2, 700.00),
(29, 29, 29, 4, 1, 1, 800.00),
(30, 30, 30, 3, 3, 2, 700.00),
(31, 31, 31, 2, 1, 1, 900.00),
(32, 32, 32, 4, 1, 2, 750.00),
(33, 33, 33, 6, 1, 1, 900.00),
(34, 34, 34, 5, 2, 1, 900.00),
(35, 35, 35, 8, 1, 1, 900.00),
(36, 36, 36, 7, 3, 1, 900.00),
(37, 37, 37, 11, 2, 1, 900.00),
(38, 38, 38, 12, 3, 1, 900.00),
(39, 39, 39, 13, 1, 1, 900.00),
(40, 40, 40, 10, 2, 1, 900.00);

SELECT * FROM dim_beneficiario;
SELECT * FROM dim_pagamento;
SELECT * FROM dim_municipio;
SELECT * FROM dim_situacao_beneficio;
SELECT * FROM dim_tipo_beneficio;
SELECT * FROM dbo.fato_auxilio_emergencial;

--Análises

--Valor pago por estado

SELECT
    m.estado AS estado,
    SUM(f.valor_beneficio) AS total_pago
FROM
    fato_auxilio_emergencial f
    JOIN dim_municipio m ON f.id_municipio = m.id
GROUP BY
    m.estado;

--Número de beneficiários por situação do benefício 

SELECT
    s.situacao AS situacao_beneficio,
    COUNT(*) AS total_beneficiarios
FROM
    fato_auxilio_emergencial f
    JOIN dim_situacao_beneficio s ON f.id_situacao_beneficio = s.id
GROUP BY
    s.situacao;


--Valor total pago por município:
SELECT
    m.nome AS municipio,
    SUM(f.valor_beneficio) AS total_pago
FROM
    fato_auxilio_emergencial f
    JOIN dim_municipio m ON f.id_municipio = m.id
GROUP BY
    m.nome;


--Valor total pago por tipo de benefício e mês
SELECT
    t.tipo AS tipo_beneficio,
    MONTH(p.data_pagamento) AS mes,
    SUM(f.valor_beneficio) AS total_pago
FROM
    fato_auxilio_emergencial f
    JOIN dim_tipo_beneficio t ON f.id_tipo_beneficio = t.id
    JOIN dim_pagamento p ON f.id_pagamento = p.id
GROUP BY
    t.tipo, MONTH(p.data_pagamento);

--Número de beneficiários por faixa etária (considerando faixas de 10 anos)
	SELECT
    CASE
		WHEN YEAR(GETDATE()) - YEAR(data_nascimento) BETWEEN 18 AND 29 THEN '18-29'
        WHEN YEAR(GETDATE()) - YEAR(data_nascimento) BETWEEN 30 AND 39 THEN '30-39'
        WHEN YEAR(GETDATE()) - YEAR(data_nascimento) BETWEEN 40 AND 49 THEN '40-49'
		WHEN YEAR(GETDATE()) - YEAR(data_nascimento) BETWEEN 50 AND 59 THEN '50-59'
		WHEN YEAR(GETDATE()) - YEAR(data_nascimento) BETWEEN 60 AND 69 THEN '60-69'
		WHEN YEAR(GETDATE()) - YEAR(data_nascimento) BETWEEN 70 AND 79 THEN '70-79'
		WHEN YEAR(GETDATE()) - YEAR(data_nascimento) BETWEEN 80 AND 89 THEN '80-89'
		WHEN YEAR(GETDATE()) - YEAR(data_nascimento) BETWEEN 90 AND 99 THEN '90-99'
		WHEN YEAR(GETDATE()) - YEAR(data_nascimento) BETWEEN 100 AND 150 THEN '100 +'
        
        ELSE 'Outros'
    END AS faixa_etaria,
    COUNT(*) AS total_beneficiarios
FROM
    dim_beneficiario
GROUP BY
    CASE
	    WHEN YEAR(GETDATE()) - YEAR(data_nascimento) BETWEEN 18 AND 29 THEN '18-29'
        WHEN YEAR(GETDATE()) - YEAR(data_nascimento) BETWEEN 30 AND 39 THEN '30-39'
        WHEN YEAR(GETDATE()) - YEAR(data_nascimento) BETWEEN 40 AND 49 THEN '40-49'
		WHEN YEAR(GETDATE()) - YEAR(data_nascimento) BETWEEN 50 AND 59 THEN '50-59'
		WHEN YEAR(GETDATE()) - YEAR(data_nascimento) BETWEEN 60 AND 69 THEN '60-69'
		WHEN YEAR(GETDATE()) - YEAR(data_nascimento) BETWEEN 70 AND 79 THEN '70-79'
		WHEN YEAR(GETDATE()) - YEAR(data_nascimento) BETWEEN 80 AND 89 THEN '80-89'
		WHEN YEAR(GETDATE()) - YEAR(data_nascimento) BETWEEN 90 AND 99 THEN '90-99'
		WHEN YEAR(GETDATE()) - YEAR(data_nascimento) BETWEEN 100 AND 150 THEN '100 +'
       
        ELSE 'Outros'
    END;


--Valor médio do benefício por município
	SELECT
    m.nome AS municipio,
    AVG(f.valor_beneficio) AS valor_medio_beneficio
FROM
    fato_auxilio_emergencial f
    JOIN dim_municipio m ON f.id_municipio = m.id
GROUP BY
    m.nome;


--Percentual de benefícios aprovados, em análise e cancelados
SELECT
    s.situacao AS situacao_beneficio,
    COUNT(*) AS total_beneficios,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM fato_auxilio_emergencial), 2) AS percentual
FROM
    fato_auxilio_emergencial f
    JOIN dim_situacao_beneficio s ON f.id_situacao_beneficio = s.id
GROUP BY
    s.situacao;
