-- ==================================================
-- ProjectFlow SaaS Analytics
-- Purpose: Validate Data Quality and Relationships
-- ==================================================

use projectflow_analytics;
show tables;

-- ==================================================
-- 1. Check Total Records
-- ==================================================


-- Companies Count
select count(*) as total_companies from companies;



-- Users Count
select count(*) as total_users from users;



-- Projects Count
select count(*) as total_projects from projects;



-- Tasks Count
select count(*) as total_tasks from tasks;



-- Comments Count
select count(*) as total_comments from comments;



-- Subscription Count
select count(*) as total_subscriptions from subscription_history;



-- Activity Logs Count
select count(*) as total_activities from activity_logs;





-- ==================================================
-- 2. Primary Key Duplicate Check
-- ==================================================


-- Duplicate Companies
select company_id, count(*) as duplicate_count from companies
group by company_id
having count(*) > 1;




-- Duplicate Users
select user_id, count(*) as duplicate_count from users
group by user_id
having count(*) > 1;




-- Duplicate Projects
select project_id, count(*) as duplicate_count
from projects
group by project_id
having count(*) > 1;





-- ==================================================
-- 3. Missing Value Check
-- ==================================================


-- Companies Missing Values
select * from companies
where company_name is null
or industry is null
or registration_date is null;




-- Users Missing Values
select * from users
where full_name is null or email is null
or company_id is null;




-- Tasks Missing Values
select * from tasks
where task_name is null
or project_id is null;





-- ==================================================
-- 4. Relationship Validation
-- ==================================================


-- Users without valid company
select u.* from users u
left join companies c
on u.company_id = c.company_id
where c.company_id is null;





-- Projects without valid company
select p.* from projects p
left join companies c
on p.company_id = c.company_id
where c.company_id is null;





-- Tasks without valid project
select t.* from tasks t 
left join projects p 
on t.project_id = p.project_id 
where p.project_id is null;





-- Activity logs without valid users
select a.* from activity_logs a
left join users u
on a.user_id = u.user_id
where u.user_id is null;