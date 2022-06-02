
--> script para rodar no sql
DROP DATABASE IF EXISTS escola;
CREATE DATABASE escola;
\c escola;

--> criação das tabelas

CREATE TABLE aluno(
  cpf VARCHAR(11) PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  endereco TEXT,
  data_nasc DATE NOT NULL,
  telefone TEXT
);

CREATE TABLE departamento(
  codigo INT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL UNIQUE
  
);

CREATE TABLE professor(
  matricula INT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  endereco TEXT,
  telefone TEXT NOT NULL,
  data_nasc DATE NOT NULL,
  data_contratacao DATE NOT NULL,
  codigo_dep INT REFERENCES departamento(codigo)

);
CREATE TABLE curso(
  codigo INT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  descricao TEXT NOT NULL,
  codigo_dep INT REFERENCES departamento(codigo)
);

CREATE TABLE disciplina(
  codigo INT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  quant_creditos NUMERIC,
  matricula_professor INT REFERENCES professor(matricula)
);

CREATE TABLE matricula(
  id_matricula SERIAL,
  data_matricula DATE NOT NULL,
  codigo_curso INT REFERENCES curso(codigo) ON DELETE CASCADE,
  cpf_aluno VARCHAR(11) REFERENCES aluno(cpf) ON DELETE CASCADE,
  PRIMARY KEY (codigo_curso, cpf_aluno)
);

CREATE TABLE cursa(
  id_cursa SERIAL,
  cpf_aluno VARCHAR(11) REFERENCES aluno(cpf) ON DELETE CASCADE,
  codigo_disc INT REFERENCES disciplina(codigo) ON DELETE CASCADE,
  PRIMARY KEY (cpf_aluno, codigo_disc)
 
);

CREATE TABLE compoe(
  id_compoe SERIAL,
  codigo_curso INT REFERENCES curso(codigo) ON DELETE CASCADE,
  codigo_disc INT REFERENCES disciplina(codigo) ON DELETE CASCADE,
  PRIMARY KEY (codigo_curso, codigo_disc)
);

CREATE TABLE pre_req(
  id_pre_req SERIAL,
  codigo_disc INT REFERENCES disciplina(codigo) ON DELETE CASCADE,
  codigo_disc_dependendencia INT REFERENCES disciplina(codigo) ON DELETE CASCADE,
  PRIMARY KEY (codigo_disc, codigo_disc_dependendencia)
);

--> inserindo os dados

INSERT INTO aluno(cpf, nome, endereco, data_nasc, telefone)
VALUES (25789630158, 'Maria dos Santos', '65 rua dos peixes', '2001-01-12', '+55-18-96033-2233'), 
(63254712500, 'Jose Martins', '62 rua dos passaros', '2001-04-03', '+55-18-99524-6254'),
(85274165265,'Maria Luiza Rocha', '23 rua dos pomares','2002-01-08', '+55-18-99874-2501'),
(45211478596, 'Leticia dos Santos', '52 rua do macaco', '2003-03-02', '+55-18-99852-5641'),
(52178423185, 'Manuela da Silva', '25 rua deputado', ' 2008-06-04', '+55-18-99521-2353'),
(12385274456, 'Miguel Figueredo', '26 rua dos palmares', '2002-02-06', '+55-18-99564-8502'),
(52156321325, 'Ana Luiza Sanches', '41 rua capitao', '2002-01-02', '+55-18-99876-2503'),
(52145677180, 'João Luiz Rodrigues', '52 rua moqueca', '2002-02-07', '+55-18+99520-2102'),
(85274123698, 'João Otávio Palmeiras', '74 rua fiorentina', '2003-09-08', '+55-18-99603-8723 (18)'),
(52344125378, 'Luiza dos Santos Paiva', '65 rua dos filhos', '2001-09-02', '+55-18-99623-8503'),
(41352945123, 'Rosa Maria de Paiva', '51 rua das marias', '2007-02-05', '+55-18-96532-6521'),
(23412585463, 'Bianca Maria dos Santos', '52 rua ford', '1993-03-04', '+55-18-99741-5214'),
(85241374568, 'Valeria Natalia Soares', '45 rua das flores', '1994-03-05', '+55-18-99762-8521'),
(86374125854, 'Poliana Yasmim Neves', '74 rua dos famosos', '1994-02-06', '+55-18-96412-6512'),
(12345687941, 'Elano de Souza Terceiro', '72 rua das acacias', '1995-04-05', '+55-18-94142-7456'),
(74154682541, 'Daniele Durirna', '85 rua dos relogios', '1993-03-09', '+55-18-94156-7423'),
(45623978591, 'Manuel Charles de Trindade', '63 rua do café', '1994-07-05', '+55-18-98741-1245'),
(78952145674, 'Alfredo Anderson de Barros', '14 rua afrodite', '1999-05-05', '+55-18-97412-7412'),
(74123674589, 'Roberto de Nogueira', '56 rua do macaco', '1999-02-05', '+55-18-98752-7489'),
(79852145331, 'Leandro Augusto Palmares', '45 rua capitao', '1998-05-07', '+55-18-97123-5213'),
(52163245612, 'Meire Amanda de Osório', '78 rua dos livros', '1998-10-21', '+55-18-94563-4521'),
(78215463298, 'Joyce Aparecida da Silva', '102 rua moqueca', '1993-12-12', '+55-18-99875-6522'),
(85246374165, 'Moises Fontes Machado', '46 rua das flores', '1992-11-05', '+55-18-94213-7896'),
(74123687945, 'Ana de Morais', '74 rua brasil', '1995-10-10', '+55-18-98563-4152'),
(45213625152, 'Matheus Rodrigues Santos', '103 rua dos parques', '1998-09-12', '+55-18-94563-7456'),
(56312441385, 'Gisele do Amaral', '96 rua catedral', '2000-11-06', '+55-18-92312-7456'),
(74125894563, 'Yasmim Banhos', '23 rua carmem', '2000-02-09', '+55-18-97452-4196'),
(23674152687, 'Ana Moreno', '456 rua landre', '1999-06-06', '+55-18-96521-6523'),
(74124398265, 'Ivete Mirela dos Santos', '12 rua augusta', '1998-10-07', '+55-18-94521-7456'),
(45217698521, 'Helena Gois', '74 rua machado', '2000-08-07', '+55-18-96546-7421'),
(74264352185, 'Marcio Frederico', '85 rua do banho', '1995-12-02', '+55-18-98512-4521'),
(46521382591, 'Karina dos Santos', '105 rua manuela', '1998-11-07', '+55-18-98741-5632'),
(52361241856, 'Joelma de Brandão', '63 rua do palhaço', '2003-09-02', '+55-18-96541-7632'),
(63214589642, 'Otaviano Marcelo Sanches', '79 rua da olivia', '2002-07-05', '+55-18-96162-6575'),
(52136945621, 'Mariele de Serra', '73 rua deputado cunha', '2002-10-14', '+55-18-97496-5632'),
(78562174985, 'Selena Maria de Souza', '109 rua surie', '2005-08-21', '+55-18-97896-4521'),
(74565212984, 'Reinaldo Murilo Silva', '112 rua das acacias', '1998-09-14', '+55-18-97494-6411');

INSERT INTO departamento(codigo, nome)
VALUES (1, 'exatas'), (2, 'humanas'), (3, 'idiomas'), (4, 'diretoria'), (5, 'administração'), (6, 'secretaria'),
 (7, 'financeiro'), (8, 'rh'), (9, 'ti');

INSERT INTO professor(matricula, nome, endereco, telefone, data_nasc, data_contratacao, codigo_dep)
VALUES (121, 'Gabriela Genir Marinho', '85 rua dos passaros', '+55-18-56321-5621', '1980-01-03', '2016-12-13', 1),
(122, 'Marli de Holanda', '54 rua dos macacos', '+55-18-4562-5462', '1982-03-02', '2015-05-06', 2),
(123, 'Walter Mario de Muniz', '21 rua moçambique', '+55-18-5421-5423', '1981-04-01', '2016-02-04', 3),
(124, 'Cléber Vasconcelos', '52 rua capitão', '+55-18-21324-8502', '1979-06-09', '2015-04-08', 3),
(125, 'Selena Cavalcante', '412 rua nascimento', '+55-18-54128-2101', '1982-06-01', '2014-08-09', 1),
(126, 'Gabriela da Silva Macedo', '236 rua dos alpinistas', '+55-18-21469-4562', '1985-06-04', '2016-04-05', 2),
(127, 'Heitor Raul de Meireles', '546 rua do tereré', '+55-18-63254-7895', '1978-08-07', '2015-09-07', 9),
(128, 'Giovana Maria Valente', '213 rua do teclado', '+55-18-98521-5741', '1989-09-03', '2014-03-04',8),
(129, 'Lucio do Nascimento', '745 rua da holanda', '+55-18-85241-5632', '1977-06-08', '2015-05-01', 9),
(130, 'Marcos Neto', '412 rua dos cachorros', '+55-18-23146-8521', '1978-05-03', '2015-03-02', 1),
(131, 'Aurélio de Palmares', '632 rua caramelo', '+55-18-21546-4213', '1983-04-09', '2014-03-05', 2);

INSERT INTO curso (codigo, nome, descricao, codigo_dep)
VALUES (1, 'estatistica', 'calculos e conceitos matemáticos', 1), (2, 'finanças', 'fundamentos e noções básicas de finanças', 1),
(3, 'ciência da computação', 'lógica de programação', 9), (4, 'engenharia elétrica', 'técnicas aplicadas a engenharia elétrica', 1),
(5, 'marketing', 'conceitos e técnicas para marketing', 2), (6, 'gestão de rh', 'psicologia e prática para trabalhar com recursos humanos', 8),
(7, 'gestão comercial', 'administração e gestão de propagandas', 2), (8, 'letras', 'conhecimento profundo na lingua portuguesa', 3),
(9, 'inglês', 'gramática, leitura, conversação do idioma, teoria e prática', 3), (10, 'espanhol', 'gramática, leitura, conversação do idioma, teoria e prática', 3),
(11, 'alemão', 'gramática, leitura, conversação do idioma, teoria e prática', 3), (12, 'francês', 'gramática, leitura, conversação do idioma, teoria e prática', 3);


INSERT INTO disciplina (codigo, nome, quant_creditos, matricula_professor)
VALUES( 1, 'cálculo 1', 2, 121), (2, 'calculo 2', 3, 125), (3, 'probabilidade', 4, 130), (4, 'equações lineares', 5, 121),
 (5, 'matemática financeira', 3, 125), (6, 'adm e contabilidade', 2, 130), (7, 'python', 5, 127), (8, 'banco de dados', 4, 129),
 (9, 'comportamento ao consumidor', 2, 122), (10, 'mapeamento do publico', 5, 126), (11, 'comercio exterior', 2, 131),
 (12,'gestão de rh', 3, 128), (13, 'inglês', 2, 123), (14, 'letras', 2, 123), (15, 'espanhol', 4, 124), 
 (16, 'alemão', 2, 124), (17, 'francês', 4, 124);

 INSERT INTO matricula(data_matricula, codigo_curso, cpf_aluno)
 VALUES('2008-01-15', 1, 63254712500), ('2008-01-18', 1, 85274165265), ('2008-01-06', 1 , 45211478596),
 ('2008-01-05', 1, 52178423185), ('2008-01-16', 2,12385274456), ('2008-01-18', 2, 52156321325), ('2008-01-16', 2,52145677180),
 ('2009-01-05', 2, 85274123698), ('2009-01-06', 3, 52344125378), ('2009-01-13', 3, 41352945123),
 ('2009-01-15', 3, 23412585463), ('2009-01-14', 3, 85241374568), ('2009-01-04', 4, 86374125854),
 ('2010-01-07', 4, 12345687941), ('2010-01-16', 4, 74154682541),('2010-01-17', 5, 45623978591),
 ('2010-01-13', 5, 78952145674), ('2007-01-06', 5, 74123674589), ('2007-01-06', 6, 79852145331),
 ('2006-01-17', 6, 52163245612), ('2006-01-03', 7,78215463298), ('2005-01-09', 7, 85246374165),
 ('2005-01-18', 7, 74123687945), ('2005-01-13', 7, 45213625152), ('2005-01-06', 8, 56312441385),
 ('2008-01-15', 8, 74125894563), ('2005-01-19', 9,23674152687), ('2005-01-08', 9,74124398265), 
 ('2009-01-08',10, 45217698521), ('2008-02-03', 10, 74264352185), ('2005-06-01', 9, 46521382591),
 ('2010-02-03', 11, 52361241856), ('2008-02-01', 11,63214589642), ('2005-02-03', 12, 52136945621),
 ('2008-01-17', 12, 78562174985), ('2006-01-19', 11, 74565212984), ('2006-01-19', 12, 74565212984),
 ('2010-01-07', 1, 12345687941),('2008-01-05', 10, 52178423185),('2008-01-16', 8,52145677180),
 ('2010-01-13', 6, 78952145674),('2006-01-03', 9,78215463298),('2005-01-09', 11, 85246374165),
 ('2008-01-18', 3, 52156321325), ('2009-01-08',12, 45217698521),('2007-01-06', 11, 79852145331),
 ('2007-01-06', 7, 74123674589), ('2009-01-05', 5, 85274123698);

 INSERT INTO cursa(codigo_disc, cpf_aluno)
 VALUES( 1, 63254712500), ( 1, 85274165265), ( 1 , 45211478596),
 ( 1, 52178423185), ( 2,12385274456), ( 2, 52156321325), ( 2,52145677180),
 ( 2, 85274123698), ( 3, 52344125378), ( 3, 41352945123),
 ( 3, 23412585463), ( 3, 85241374568), ( 4, 86374125854),
 ( 4, 12345687941), ( 4, 74154682541),( 5, 45623978591),
 ( 5, 78952145674), ( 5, 74123674589), ( 6, 79852145331),
 ( 6, 52163245612), ( 7,78215463298), (7, 85246374165),
 ( 7, 74123687945), ( 7, 45213625152), ( 8, 56312441385),
 ( 8, 74125894563), ( 9,23674152687), ( 9,74124398265), 
 (10, 45217698521), ( 10, 74264352185), ( 9, 46521382591),
 ( 11, 52361241856), ( 11,63214589642), ( 12, 52136945621),
 ( 12, 78562174985), ( 11, 74565212984), ( 12, 74565212984),
 ( 1, 12345687941),( 10, 52178423185),( 8,52145677180),
 ( 6, 78952145674),( 9,78215463298),( 11, 85246374165),
 ( 3, 52156321325), (12, 45217698521),( 11, 79852145331),
 ( 7, 74123674589), (5, 85274123698), ( 13, 79852145331), (14, 85274123698),
 ( 15, 52163245612), (16, 45217698521), (17, 85246374165), ( 13, 85241374568),
  ( 14, 85241374568), ( 15,23674152687), ( 16, 12345687941), (17,52145677180);

  INSERT INTO compoe(codigo_curso, codigo_disc)
  VALUES (1,1), (1,2), (1,3), (1,4), (1,5), (2,3), (2,4), (2,5), (2,6),
  (3,3), (3,4), (3,7), (3,8), (3,13), (4,1), (4,2), (4,3), (4,4), (5,10),
  (5,9), (5,13), (5,11), (6,6), (6,12), (6,13), (7,6), (8,13), (8,14),
  (9,13), (10,15), (11,16), (12,17);

  INSERT INTO pre_req(codigo_disc, codigo_disc_dependendencia)
  VALUES(2,1), (8,7);



