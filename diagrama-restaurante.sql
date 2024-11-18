-- CRIAÇÃO DAS TABELAS DO BANCO DE DADOS
--
-- Criando a tabela cliente
create table cliente (
	id serial primary key not null,
	primeiro_nome varchar(255) not null,
	ultimo_nome varchar(255) not null,
	data_nascimento date not null,
	cpf varchar(20) not null,
	email varchar(50) not null,
	logradouro varchar (255) not null,
	numero integer not null,
	complemento varchar(255) not null,
	cep integer not null,
	bairro varchar(255) not null,
	cidade varchar(255) not null,
	estado varchar(50) not null
);

-- Criando a tabela telefone_cliente
create table telefone_cliente (
	id serial primary key not null,
	id_cliente integer not null,
	telefone varchar(50) not null,
	foreign key(id_cliente) references cliente(id)
);

-- criando a tabela mesa
create table mesa (
	id serial primary key not null,
	quantidade_assentos integer not null
);

-- criando a tabela reserva
create table reserva (
	id serial primary key not null,
	id_cliente integer not null,
	id_mesa integer not null,
	data date not null,
	hora time not null,
	foreign key(id_cliente) references cliente(id),
	foreign key(id_mesa) references mesa(id)
);


-- criando a tabela pedido
create table pedido (
	id serial primary key not null,
	id_cliente integer not null,
	data date not null,
	hora time not null,
	preco_total decimal not null,
	foreign key(id_cliente) references cliente(id)
);

-- criando a tabela cargo
create table cargo (
	id serial primary key not null,
	cargo varchar (255) not null
);

-- criando tabela funcionário
create table funcionario (
	id serial primary key not null,
	primeiro_nome varchar(255) not null,
	ultimo_nome varchar(255) not null,
	cpf varchar(20) not null,
	id_cargo integer not null,
	foreign key(id_cargo) references cargo(id)
);

-- criando tabela telefone_funcionário
create table telefone_funcionario (
	id serial primary key not null,
	id_funcionario integer not null,
	telefone varchar(50) not null,
	foreign key(id_funcionario) references funcionario(id)
);

-- criando tabela funcionario_pedido
create table funcionario_pedido (
	id serial primary key not null,
	id_pedido integer not null,
	id_funcionario integer not null,
	foreign key(id_pedido) references pedido(id),
	foreign key(id_funcionario) references funcionario(id)
);

-- criando tabela cardapio
create table cardapio (
	id serial primary key not null,
	prato varchar(50) not null,
	descricao varchar(255) not null,
	preco decimal not null
);

-- criando tabela pedido_cardapio
create table pedido_cardapio (
	id serial primary key not null,
	id_pedido integer not null,
	id_cardapio integer not null,
	quantidade integer not null,
	foreign key(id_pedido) references pedido(id),
	foreign key(id_cardapio) references cardapio(id)
);


-- INSERINDO VALORES NAS TABELAS
--
-- Inserindo Clientes para o Restaurante

insert into cliente (primeiro_nome, ultimo_nome, data_nascimento, cpf, email, logradouro, numero, complemento, cep, bairro, cidade, estado) 
VALUES ('Wesley', 'Sousa', '2005/02/21', '000.000.000-00', 'wesiley98802@gmail.com', 'avenida dos tropeiros', 007, 'A', 00000-000, 'areia branca', 'Petrolina', 'Pernambuco');

insert into cliente (primeiro_nome, ultimo_nome, data_nascimento, cpf, email, logradouro, numero, complemento, cep, bairro, cidade, estado) 
VALUES ('Rudá', 'Aranha', '1990/03/15', '000.000.000-00', 'rudaaranha123@gmail.com', 'Rua joão Quirino', 001, 'A', 42599500, 'Catolé', 'Campina Grande', 'Paraíba');

insert into cliente (primeiro_nome, ultimo_nome, data_nascimento, cpf, email, logradouro, numero, complemento, cep, bairro, cidade, estado) 
VALUES ('Priscila', 'Petroni', '1986/06/06', '000.000.000-00', 'priscilaPetroni123@gmail.com', ' Mimoso do Sul', 001, 'A', 42599500, 'Jardim Paraiso', 'Campina Grande', 'Guarulhos');

insert into cliente (primeiro_nome, ultimo_nome, data_nascimento, cpf, email, logradouro, numero, complemento, cep, bairro, cidade, estado) 
VALUES ('Vinicius ', 'Paccola', '1980/09/20', '000.000.000-00', 'viniciuspaccola123@gmail.com', 'Cunha Gago', 001, 'A', 42599500, 'Pinheiros', 'São Paulo', 'São Paulo');

insert into cliente (primeiro_nome, ultimo_nome, data_nascimento, cpf, email, logradouro, numero, complemento, cep, bairro, cidade, estado) 
VALUES ('Carla ', 'Aline', '1985/09/20', '000.000.000-00', 'CarlaAline123@gmail.com', 'Germano Mehl', 001, 'A', 42599500, 'Uberaba', 'Curitiba', 'Paraná');

-- Telefone dos cliente

insert into telefone_cliente (id_cliente, telefone) values (1,'(00)00000-0000');

insert into telefone_cliente (id_cliente, telefone) values (2,'(00)00000-0000');

insert into telefone_cliente (id_cliente, telefone) values (3,'(00)00000-0000');

insert into telefone_cliente (id_cliente, telefone) values (4,'(00)00000-0000');

insert into telefone_cliente (id_cliente, telefone) values (5,'(00)00000-0000');

-- Cadastrando mesas disponíveis

insert into mesa (quantidade_assentos) values(4);

insert into mesa (quantidade_assentos) values(2);

insert into mesa (quantidade_assentos) values(8);

insert into mesa (quantidade_assentos) values(2);

-- Cadastrando reservas dos clientes

insert into reserva (id_cliente, id_mesa, data, hora) values (1, 2, '23/11/2024', '19:00:00');

insert into reserva (id_cliente, id_mesa, data, hora) values (2, 3, '24/12/2024', '20:30:00');

insert into reserva (id_cliente, id_mesa, data, hora) values (3, 2, '29/09/2024', '14:00:00');

insert into reserva (id_cliente, id_mesa, data, hora) values (4, 4, '05/10/2024', '21:00:00');

insert into reserva (id_cliente, id_mesa, data, hora) values (5, 1, '15/11/2024', '18:00:00');

-- Cadastrando pedidos

insert into pedido (id_cliente, data, hora, preco_total) values (1,'23/11/2024', '19:15:00', 0);

insert into pedido (id_cliente, data, hora, preco_total) values (2,'24/12/2024', '20:45:00', 0);

insert into pedido (id_cliente, data, hora, preco_total) values (3,'29/09/2024', '15:00:00', 0);

insert into pedido (id_cliente, data, hora, preco_total) values (4,'05/10/2024', '21:15:00', 0);

insert into pedido (id_cliente, data, hora, preco_total) values (5,'15/11/2024', '19:50:00', 0);

-- Cadastrando Cardapio

insert into cardapio (prato, descricao, preco) values ('Feijoada', 'Guisado de feijão preto com carne de porco', 29.99);

insert into cardapio (prato, descricao, preco) values ('Baião de dois', 'Preparado de arroz e feijão verde, adiciona-se queijo coalho e nata e charque e calabresa ', 20.00);

insert into cardapio (prato, descricao, preco) values ('Galinha Guizada', 'Guisado de galinha servido com uma porção de arroz branco e salada', 15.50);

insert into cardapio (prato, descricao, preco) values ('Frango a parmegiana', 'Peito de frango empanado, coberto com molho de tomate caseiro, queijo derretido e servido com uma porção de arroz branco e salada', 30.99);

insert into cardapio (prato, descricao, preco) values ('Arroz Carreteiro', 'Arroz e carne seca (charque) picada, refogados juntos com alho, cebola, pimentão', 25.00);

-- Cadastrando pedido Cardápio

insert into pedido_cardapio (id_pedido, id_cardapio, quantidade) values (2, 4, 2);

insert into pedido_cardapio (id_pedido, id_cardapio, quantidade) values (3, 5, 1);

--cadastrando cargo

insert into cargo (cargo) values ('Chef de cozinha');

insert into cargo (cargo) values ('Cozinheiro');

insert into cargo (cargo) values ('Garçom');

insert into cargo (cargo) values ('Recepcionista');

insert into cargo (cargo) values ('Bartender');

insert into cargo (cargo) values ('Assistente de Cozinha');


-- Cadastrando Funcionários

insert into funcionario (primeiro_nome, ultimo_nome, cpf, id_cargo) values ('Marcio', 'Diniz', '000.000.000-00', 1);

insert into funcionario (primeiro_nome, ultimo_nome, cpf, id_cargo) values ('Diego', 'Alves', '000.000.000-00', 2);

insert into funcionario (primeiro_nome, ultimo_nome, cpf, id_cargo) values ('Gabriela', 'pereira', '000.000.000-00', 3);

insert into funcionario (primeiro_nome, ultimo_nome, cpf, id_cargo) values ('Marcia', 'Leal', '000.000.000-00', 4);

insert into funcionario (primeiro_nome, ultimo_nome, cpf, id_cargo) values ('Marcos', 'Silva', '000.000.000-00', 5);

insert into funcionario (primeiro_nome, ultimo_nome, cpf, id_cargo) values ('Inara', 'Bittencourt', '000.000.000-00', 6);

insert into funcionario (primeiro_nome, ultimo_nome, cpf, id_cargo) values ('Vinicius', 'Alves', '000.000.000-00', 3);

insert into funcionario (primeiro_nome, ultimo_nome, cpf, id_cargo) values ('Débora', 'Almeida', '000.000.000-00', 3);


-- Cadastrando telefone dos funcionarios

insert into telefone_funcionario (id_funcionario, telefone) values (1,'(00)00000-0000');

insert into telefone_funcionario (id_funcionario, telefone) values (2,'(00)00000-0000');

insert into telefone_funcionario (id_funcionario, telefone) values (3,'(00)00000-0000');

insert into telefone_funcionario (id_funcionario, telefone) values (4,'(00)00000-0000');

insert into telefone_funcionario (id_funcionario, telefone) values (5,'(00)00000-0000');

insert into telefone_funcionario (id_funcionario, telefone) values (6,'(00)00000-0000');


-- Cadastrando funcionario pedido

insert into funcionario_pedido (id_pedido, id_funcionario) values (2, 3);
insert into funcionario_pedido (id_pedido, id_funcionario) values (3, 7);
insert into funcionario_pedido (id_pedido, id_funcionario) values (5, 7);
insert into funcionario_pedido (id_pedido, id_funcionario) values (1, 3);
insert into funcionario_pedido (id_pedido, id_funcionario) values (4, 3);

insert into funcionario_pedido (id_pedido, id_funcionario) values (2, 1);
insert into funcionario_pedido (id_pedido, id_funcionario) values (3, 1);
insert into funcionario_pedido (id_pedido, id_funcionario) values (5, 1);
insert into funcionario_pedido (id_pedido, id_funcionario) values (1, 1);
insert into funcionario_pedido (id_pedido, id_funcionario) values (4, 1);

insert into funcionario_pedido (id_pedido, id_funcionario) values (2, 2);
insert into funcionario_pedido (id_pedido, id_funcionario) values (3, 2);
insert into funcionario_pedido (id_pedido, id_funcionario) values (5, 2);
insert into funcionario_pedido (id_pedido, id_funcionario) values (1, 2);
insert into funcionario_pedido (id_pedido, id_funcionario) values (4, 2);


-- Consulta para verificar se todas as tabelas foram populadas

DO $$ 
DECLARE
    rec RECORD;
    row_count INT;
BEGIN
    FOR rec IN 
        SELECT table_name 
        FROM information_schema.tables 
        WHERE table_schema = 'public' -- Alterar se estiver usando outro schema
    LOOP
        EXECUTE 'SELECT COUNT(*) FROM ' || rec.table_name INTO row_count;
        RAISE NOTICE 'Tabela: %, Contagem: %', rec.table_name, row_count;
    END LOOP;
END $$;


-- Atualizar e deletar ao menos 2 registros (DML)

-- Atualizando registros

UPDATE cliente
SET ultimo_nome = 'Gallinari Petroni', 
    cpf = '123.456.789-00'
WHERE id = 3;

UPDATE cliente
SET primeiro_nome = 'Carla Aline', 
    ultimo_nome = 'Farias da Rocha', 
    cpf = '987.654.321-00'
WHERE id = 5;

UPDATE cliente
SET cpf = '125.789.324-11'
WHERE id = 1;

UPDATE cliente
SET cpf = '852.654.951-12'
WHERE id = 2;

UPDATE cliente
SET cpf = '753.159.654-13'
WHERE id = 4;


-- Deletando registros

DELETE FROM funcionario_pedido
WHERE id_pedido = 4 AND id_funcionario = 2;

DELETE FROM funcionario_pedido
WHERE id_pedido = 2 AND id_funcionario = 1;


-- Atualizando o "preço_total" da tabela pedidos

UPDATE pedido p
SET preco_total = (
    SELECT SUM(c.preco * pc.quantidade)
    FROM pedido_cardapio pc
    JOIN cardapio c ON pc.id_cardapio = c.id
    WHERE pc.id_pedido = p.id
)
WHERE p.id IN (SELECT DISTINCT id_pedido FROM pedido_cardapio);



-- Realizar 4 consultas (1 com agrupamento, 3 com joins) (DQL)

-- qual a quantidade de pedidos de cada cliente (nome completo)?
SELECT 
    p.id_cliente, 
    CONCAT(c.primeiro_nome, ' ', c.ultimo_nome) AS nome_completo,
    COUNT(*) AS total_pedidos
FROM 
    pedido p
JOIN 
    cliente c ON p.id_cliente = c.id
GROUP BY 
    p.id_cliente, c.primeiro_nome, c.ultimo_nome;

   
-- qual a data e o valor total do pedido dos clientes?
SELECT 
	p.id AS id_pedido, 
	c.primeiro_nome, 
	c.ultimo_nome,
	p.data, 
	p.preco_total
FROM 
	pedido p
JOIN 
	cliente c ON p.id_cliente = c.id;


-- Quais os funcionários e seus cargos?
SELECT 
	f.id AS id_funcionario, 
	f.primeiro_nome, 
	f.ultimo_nome, 
	c.cargo
FROM 
	funcionario f
JOIN 
	cargo c ON f.id_cargo = c.id;


-- quais os pratos dos pedidos e as quantidades?
SELECT 
	p.id AS id_pedido, 
	c.prato, pc.quantidade
FROM 
	pedido p
JOIN 
	pedido_cardapio pc ON p.id = pc.id_pedido
JOIN 
	cardapio c ON pc.id_cardapio = c.id;

