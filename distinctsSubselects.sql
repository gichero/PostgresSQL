-- Write queries to find the answers below:

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

-- Perform a left outer join from the tech table to the project_uses_tech table which techs has no associated project?
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

-- Based on the previous query, get the count of the number of projects that use each tech.

select
    project.*,
    count(project_uses_tech)
from
    project
left outer join
    project_uses_tech
on
    project_uses_tech.project_id = project.id
-- where
--     tech.id = project_uses_tech.project_id;
group by
    project.id


-- Perform a left outer join from the project table to the project_users_tech table - which projects has no associated tech?
select
    project.name, tech.name
from
    project
left join
    project_uses_tech
on
    project_uses_tech.project_id = project.id
left join
    tech
on
    project_uses_tech.project_id = tech.id;

-- Based on the previous query, get the count of the number of techs used by each project.

select
    name,
    count(tech_id)
from
    tech
left join
    project_uses_tech
on
    project_uses_tech.tech_id = tech.id

group by
    tech.id;
-- List all projects along with each technology used by it. You will need to do a three-way join.
select
    project.name, tech.name
from
    project, project_uses_tech, tech
where
    project_uses_tech.tech_id = tech.id
and
    project_uses_tech.project_id = project.id;

--OR
select
    *
from
    project
left join
    project_uses_tech
on
    project_uses_tech.project_id = project.id
left join
    tech
on
    project_uses_tech.tech_id = tech.id;

-- List all the distinct techs that are used by at least one project.
select distinct
on(tech.name)
    tech.name
from
    project, project_uses_tech, tech
where
    project_uses_tech.tech_id = tech.id
and
    project_uses_tech.project_id = project.id;

-- List all the distinct techs that are not used by any projects.
select distinct
(tech.name)
from
    tech
left outer join
    project_uses_tech
on
    project_uses_tech.tech_id = tech.id
left outer join
    project
on
    project_uses_tech.project_id = project.id
where
    project.name
is null;

-- List all the distinct projects that use at least one tech.
select distinct
on
    (project.name) project.name
from
    project, project_uses_tech, tech
where
    project_uses_tech.tech_id = tech.id
and
    project_uses_tech.project_id = project.id;

-- List all the distinct projects that use no tech.
select distinct
on(project.name)
    project.name
from
    project
left outer join
    project_uses_tech
on
    project_uses_tech.project_id = project.id
left outer join
    tech
on
    project_uses_tech.tech_id = tech.id
where
    tech.name
is null;

-- Order the projects by how many tech it uses.
select
    project.*,
count(project_uses_tech.tech_id)
from
    tech
left join
    project_uses_tech
on
    tech.id = project_uses_tech.tech_id
inner join
    project
on
    project.id = project_uses_tech.project_id
group by
    project.name
order by count(project_uses_tech.tech_id);

-- Order the tech by how many projects use it.
select
    tech.name,
count(project_uses_tech.project_id)
from
    project
left outer join
    project_uses_tech
on
    project.id = project_uses_tech.project_id
inner join
    tech
on
    tech.id = project_uses_tech.tech_id
group by
    tech.name
order by
count(project_uses_tech.project_id);

-- What is the average number of techs used by a project?
**********difficult***********
