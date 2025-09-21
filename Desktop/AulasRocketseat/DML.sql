CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE clientes (
  id SERIAL PRIMARY KEY,
  codigo_uuid UUID DEFAULT uuid_generate_v4(),
  idade SMALLINT,
  quantidade_compras INTEGER,
  pontos_acumulados BIGINT,
  ticket_medio NUMERIC(10, 2),
  desconto_medio DECIMAL(5, 2),
  estado CHAR(2),
  nome VARCHAR(100),
  observacoes TEXT,
  ativo BOOLEAN,
  data_nascimento DATE,
  hora_cadastro TIME,
  criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  notas INTEGER[],
  tags TEXT[],
  informacoes_extras JSONB
);

INSERT INTO clientes (
  idade,
  quantidade_compras,
  pontos_acumulados,
  ticket_medio,
  desconto_medio,
  estado,
  nome,
  observacoes,
  ativo,
  data_nascimento,
  hora_cadastro,
  notas,
  tags,
  informacoes_extras
)
VALUES(
  30, 123, 1500, 250.75, 10.00, 'SP', 'Carlos Silva', 'Cliente frequente com histórico de boas compras.',
  TRUE, '1994-05-21', '14:30:00', ARRAY[8, 9, 10], ARRAY['vip', 'newsletter'], '{"preferencias": "email", "idioma": "pt-BR", "aceita_promocoes": true}'
);


SELECT codigo_uuid, nome, idade, estado, informacoes_extras FROM clientes;

UPDATE clientes
SET estado = 'RJ'
WHERE nome = 'Felipe';

DELETE FROM clientes
WHERE nome = 'Felipe';










