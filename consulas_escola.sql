--> A) Produza um relatório que contenha os dados dos alunos matriculados em todos os cursos oferecidos pela escola

SELECT a.nome, a.cpf,m.data_matricula, c.nome
FROM matricula as m
JOIN aluno as a ON a.cpf = m.cpf_aluno
JOIN curso as c ON c.codigo = m.codigo_curso
ORDER BY a.nome;

--> B) Produza um relatório com os dados de todos os cursos, com suas respectivas disciplinas, oferecida pela escola

SELECT c.nome, c.descricao, d.nome
FROM curso as c
LEFT JOIN compoe as co ON c.codigo = co.codigo_curso
LEFT JOIN disciplina as d ON d.codigo = co.codigo_disc
ORDER BY c.nome;

--> C) Produza um relatório que contenha o nome dos alunos e as disciplinas em que estão matriculados

SELECT a.nome, d.nome
FROM cursa as c
JOIN aluno as a ON c.cpf_aluno = a.cpf
JOIN disciplina as d ON c.codigo_disc = d.codigo
ORDER BY a.nome;

--> D) Produza um relatório com os dados dos professores e as disciplinas que misistram
SELECT p.nome, p.matricula, p.data_contratacao, 
p.codigo_dep, d.nome
FROM professor as p
LEFT JOIN disciplina as d ON p.matricula = d.matricula_professor
ORDER BY p.nome;

--> E) Produza um relatório com os nomes das disciplinas e seus pré-requisitos
  SELECT d.nome, codigo_disc_dependendencia, d1.nome
FROM disciplina as d
JOIN pre_req as p ON p.codigo_disc = d.codigo
JOIN disciplina as d1 ON p.codigo_disc_dependendencia = d1.codigo
ORDER BY d.nome;

--> F) Produza um relatório com a média de idade dos alunos matriculados em cada curso

 SELECT
	  AVG(extract(year from age(a.data_nasc))),
	  c.nome
  FROM aluno as a
  JOIN matricula as m ON m.cpf_aluno = a.cpf
  JOIN curso as c ON m.codigo_curso = c.codigo
  GROUP BY c.nome;

--> G) Produza um relatório com os cursos oferecidos por cada departamento

SELECT  codigo_dep , d.nome, c.nome
FROM departamento as d
JOIN curso as c ON c.codigo_dep = d.codigo
ORDER BY codigo_dep;
