USE exercicio_SQL_projeto

--Fazer:
/*
a) Adicionar User 
(6; Joao; Ti_joao; 123mudar; joao@empresa.com)
*/
--Inserção de Dados user
INSERT INTO users ( id, name, username, password, email)
VALUES            (6,'Joao', 'Ti_joao', '123mudar', 'joao@empresa.com')

/*
b) Adicionar Project
(10004; Atualização de Sistemas; Modificação de Sistemas Operacionais nos PC's; 12/09/2014)
*/
--Inserção de Dados projects
INSERT INTO projects(id, name, description, date)
VALUES              (10004, 'Atualização de Sistemas', 'Modificação de Sistemas Operacionais nos PCs', '12/09/2014')

--Consultar:
/*
1) Id, Name e Email de Users, Id, Name, Description e Data de Projects, dos usuários que
participaram do projeto Name Re-folha
*/
--SQL 3(99)
SELECT DISTINCT u.id, u.name, u.email, p.id, 
       p.name AS project_name, 
	   p.description, p.date
FROM users u, users_has_projects uhp, projects p
WHERE u.id = uhp.users_id
      AND p.name LIKE 'Re-folha%'

--2) Name dos Projects que não tem Users
--OUTER JOIN
SELECT DISTINCT p.name
FROM projects p LEFT OUTER JOIN users_has_projects uhp
ON p.id = uhp.projects_id
WHERE uhp.users_id IS NULL

--3) Name dos Users que não tem Projects
--OUTER JOIN
SELECT u.name
FROM users u LEFT OUTER JOIN users_has_projects uhp
ON u.id = uhp.users_id
WHERE uhp.projects_id IS NULL

--Consulta todas as linhas e todas as coluna projects, users, users_has_projects
SELECT * FROM projects
SELECT * FROM users
SELECT * FROM users_has_projects