use projectflow_analytics;

show tables;

-- ==================================================
-- ProjectFlow SaaS Analytics
-- Purpose: User Growth and Engagement Analysis
-- ==================================================


-- 1. Total Users
select count(*) as total_users from users;

-- 2. Active vs Inactive Users
select user_status, count(*) as total_users from users 
group by user_status
having user_status = "Inactive";

-- 3. Companies with Highest Users
select c.company_name, count(u.user_id) as total_users from companies c
join users u
on c.company_id = u.company_id
group by c.company_name
order by total_users desc;

-- 4. Daily Active Users (DAU)
select date(activity_time) as activity_date, count(distinct user_id) as dau
from activity_logs
where activity_type = 'login'
group by date(activity_time)
order by activity_date;

-- 5. Monthly Active Users (MAU)
select month(activity_time) as Monthly_Active_Users, count(distinct user_id) as MAU
from activity_logs 
where activity_type = "Login"
group by month(activity_time)
order by monthly_active_users ;

select * from activity_logs;