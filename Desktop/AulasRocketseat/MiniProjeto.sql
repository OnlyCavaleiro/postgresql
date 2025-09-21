CREATE TABLE IF NOT EXISTS escola  (
  cnpj VARCHAR(20) PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  telefone_com VARCHAR(20) NOT NULL,
  rua VARCHAR(50),
  cep VARCHAR(10),
  cidade VARCHAR(50),
  estado VARCHAR(2)
);

CREATE TABLE IF NOT EXISTS professor  (
  matricula SERIAL PRIMARY KEY,
  telefone_cel VARCHAR(20),
  cpf VARCHAR(15),
  rua  VARCHAR(50),
  cep VARCHAR(10),
  cidade VARCHAR(50),
  estado VARCHAR(2),
  cnpj_escola VARCHAR(20) NOT NULL,
  CONSTRAINT fk_professor_escola 
  FOREIGN KEY (cnpj_escola) REFERENCES escola(cnpj)
);


CREATE TABLE IF NOT EXISTS turma (
  codigo SERIAL PRIMARY KEY,
  sala VARCHAR(20) NOT NULL,
  turno VARCHAR(10) NOT NULL,
  cnpj_escola VARCHAR(20) NOT NULL,
  CONSTRAINT fk_turma_escola
  FOREIGN KEY (cnpj_escola) REFERENCES escola(cnpj)
);

CREATE TABLE IF NOT EXISTS aluno (
  matricula SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  cnpj_escola VARCHAR(20) NOT NULL,
  codigo_turma INT NOT NULL,
  CONSTRAINT fk_aluno_escola
  FOREIGN KEY (cnpj_escola) REFERENCES escola(cnpj),
  CONSTRAINT fk_aluno_turma
  FOREIGN KEY (codigo_turma) REFERENCES turma(codigo)
);

CREATE TABLE IF NOT EXISTS disciplina (
  codigo SERIAL PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  ementa TEXT NOT NULL,
  carga_horaria INT NOT NULL,
  matricula_professor INT NOT NULL,
  CONSTRAINT fk_disciplina_professor
  FOREIGN KEY (matricula_professor) REFERENCES professor(matricula)
);

CREATE TABLE IF NOT EXISTS turma_disciplina (
  codigo SERIAL PRIMARY KEY,
  codigo_turma INT NOT NULL,
  codigo_disciplina INT NOT NULL,
  dt_inicio DATE,
  dt_termino DATE,
  CONSTRAINT fk_td_turma
  FOREIGN KEY (codigo_turma) REFERENCES turma(codigo),
  CONSTRAINT fk_td_disciplina
  FOREIGN KEY (codigo_disciplina) REFERENCES disciplina(codigo)
);

CREATE TABLE IF NOT EXISTS endereco (
  codigo SERIAL PRIMARY KEY,
  rua VARCHAR(50),
  cep VARCHAR(10),
  cidade VARCHAR(50),
  estado VARCHAR(2),
  matricula INT NOT NULL,
  CONSTRAINT fk_endereco_aluno
  FOREIGN KEY (matricula) REFERENCES aluno(matricula)
);

CREATE TABLE IF NOT EXISTS telefone (
  codigo SERIAL PRIMARY KEY,
  tel_cel VARCHAR(20),
  tel_res VARCHAR(20),
  matricula INT NOT NULL,
  CONSTRAINT fk_telefone_aluno
  FOREIGN KEY (matricula) REFERENCES aluno(matricula)
);


-- Inserts tabela escola

INSERT INTO escola (
    cnpj, 
    nome, 
    telefone_com, 
    rua, 
    cep, 
    cidade, 
    estado
) VALUES (
    '12.345.678/0001-90',
    'Escola Estadual Dom Pedro II',
    '(21) 3456-7890',
    'Rua das Flores, 123',
    '25070-100',
    'Duque de Caxias',
    'RJ'
),
(
    '98.765.432/0001-10',
    'Colégio Municipal Santos Dumont',
    '(21) 2987-6543',
    'Av. Brasil, 456',
    '25040-020',
    'Duque de Caxias',
    'RJ'
);

SELECT * FROM escola;

-- Insert 2

INSERT INTO professor (
    telefone_cel,
    cpf,
    rua,
    cep,
    cidade,
    estado,
    cnpj_escola
) VALUES (
    '(21) 99876-5432',
    '123.456.789-00',
    'Rua São José, 789',
    '25060-150',
    'Duque de Caxias',
    'RJ',
    '12.345.678/0001-90'
),
(
    '(21) 98765-4321',
    '987.654.321-11',
    'Rua das Palmeiras, 321',
    '25050-080',
    'Duque de Caxias',
    'RJ',
    '98.765.432/0001-10'
);

SELECT * FROM professor;

-- Insert 3

  INSERT INTO turma (
      sala,
      turno,
      cnpj_escola
  ) VALUES 
      ('101', 'Manhã', '12.345.678/0001-90'),
      ('202', 'Tarde', '98.765.432/0001-10');

SELECT * FROM turma;

-- Insert 4

INSERT INTO aluno (
    nome,
    cnpj_escola,
    codigo_turma
) VALUES 
    ('Maria Silva Santos', '12.345.678/0001-90', 1),
    ('João Pedro Oliveira', '98.765.432/0001-10', 2);

SELECT * FROM aluno;

--Insert 5

INSERT INTO disciplina (
    nome,
    ementa,
    carga_horaria,
    matricula_professor
) VALUES 
    ('Matemática', 'Estudo de números, álgebra, geometria e trigonometria básica para o ensino médio.', 80, 1),
    ('História do Brasil', 'Análise dos principais períodos históricos brasileiros, desde a colonização até os dias atuais.', 60, 2);

SELECT * FROM disciplina;

--Insert 6

INSERT INTO turma_disciplina (
    codigo_turma,
    codigo_disciplina,
    dt_inicio,
    dt_termino
) VALUES 
    (1, 1, '2024-02-05', '2024-12-15'),
    (2, 2, '2024-02-05', '2024-12-15');

SELECT * FROM turma_disciplina;

























































