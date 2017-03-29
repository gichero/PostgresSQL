-- Write queries to find the answers below:







-- List all projects along with each technology used by it. You will need to do a three-way join.
-- List all the distinct techs that are used by at least one project.
-- List all the distinct techs that are not used by any projects.
-- List all the distinct projects that use at least one tech.
-- List all the distinct projects that use no tech.
-- Order the projects by how many tech it uses.
-- Order the tech by how many projects use it.
-- What is the average number of techs used by a project?

-- What are all projects that use CSS?
select
    project.name, tech.name
from
    project_uses_tech
join
    tech
on
    tech.id = project_uses_tech.tech_id
join
    project
on
    project_uses_tech.project_id = project.id
where
    tech.name = 'CSS' ;

-- What are all technologies used by the Personal Website?
select
    project.name, tech.name
from
    project_uses_tech
join
    tech
on
    tech.id = project_uses_tech.tech_id
join
    project
on
    project_uses_tech.project_id = project.id
where
    project.name = 'Personal Website';

-- Perform a left outer join from the tech table to the project_uses_tech table - which techs has no associated project?
select
    *
from
    tech
left outer join
    project_uses_tech
on
    tech.id = project_uses_tech.tech_id
where
    project_id
is
    null;

-- Based on the previous query, get the count of the number of techs used by each project.
*************difficult*************
select count(distinct tech.id) from tech left outer join project_uses_tech on tech.id = project_uses_tech.project_id where tech.id = project_uses_tech.project_id;

-- Perform a left outer join from the project table to the project_users_tech table - which projects has no associated tech?
select
    project.name, tech.name
from
    project
left outer join
    project_uses_tech
on
    project_uses_tech.project_id = project.id
left outer join
    tech
on
    project_uses_tech.project_id = tech.id;

-- Based on the previous query, get the count of the number of projects that use each tech.
*************difficult*************
-- List all projects along with each technology used by it. You will need to do a three-way join.
