-- ==================================================
-- ProjectFlow SaaS Analytics
-- Purpose: Project and Task Performance Analysis
-- ==================================================

use projectflow_analytics;
select * from projects;

-- 1. Total Projects
select count(*) as total_projects from projects;


-- 2. Projects by Status
select project_status, count(*) as total_projects from projects
group by project_status
order by total_projects desc;


-- 3. Projects by Priority
select priority, count(*) as total_projects from projects
group by priority;



-- 4. Company wise Total Projects
select c.company_name, count(p.project_id ) as total_projects from companies c 
join projects p 
on c.company_id = p.company_id 
group by c.company_name
order by total_projects desc;



-- 5. Total Tasks Status Distribution
select task_status, count(task_name) as total_tasks from tasks 
group by task_status;


-- 6. Project Completion Percentage
select p.project_name,
    count(t.task_id) as total_tasks,
    sum(
        case
            when t.task_status = 'completed'
            then 1
            else 0
        end
    ) as completed_tasks,
    round(
        (
            sum(
                case
                    when t.task_status = 'completed'
                    then 1
                    else 0
                end
            )
            /
            count(t.task_id)
        ) * 100
    ,2) as completion_percentage
from projects p
join tasks t
on p.project_id = t.project_id
group by p.project_name
order by completion_percentage desc;



-- 7. Overdue Tasks
select task_name, task_status, due_date from tasks
where due_date < current_date()
and task_status != 'completed';



-- 8. Employee Workload Analysis
select u.full_name, count(t.task_id) as assigned_tasks from users u
join tasks t
on u.user_id = t.assigned_user_id
group by u.full_name
order by assigned_tasks desc;



-- 9. High Priority Pending Tasks
select task_name, priority, task_status from tasks
where priority in ('high','critical')
and task_status != 'completed';