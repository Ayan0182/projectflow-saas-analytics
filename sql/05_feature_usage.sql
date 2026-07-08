-- ==================================================
-- ProjectFlow SaaS Analytics
-- Purpose: Feature Usage and User Engagement Analysis
-- ==================================================

use projectflow_analytics;
show tables;


-- 1. Overall Feature Usage Count

select activity_type, count(*) as total_usage from activity_logs
group by activity_type
order by total_usage desc;



-- 2. Feature Usage Percentage
select activity_type, count(*) as total_usage, 
(count(*) * 100 / (select count(*) from activity_logs)) as total_usage_percentage 
from activity_logs
group by activity_type
order by total_usage_percentage desc;



-- 3. Daily Feature Usage Trend
select date(activity_time) as usage_date, activity_type, count(*) as total_usage
from activity_logs
group by date(activity_time), activity_type
order by usage_date;



-- 4. AI Feature Adoption
select count(distinct user_id) as ai_users, count(*) as total_ai_usage from activity_logs
where activity_type = 'ai_used';



-- 5. Top 10 Most Active Users
select u.full_name, u.role, count(a.activity_id) as total_activities from users u
join activity_logs a
on u.user_id = a.user_id
group by u.full_name, u.role
order by total_activities desc limit 10;



-- 6. Company wise Product Engagement
select c.company_name, count(a.activity_id) as total_activity from companies c
join users u
on c.company_id = u.company_id
join activity_logs a
on u.user_id = a.user_id
group by c.company_name
order by total_activity desc;



-- 7. Monthly Feature Usage
select month(activity_time) as month, activity_type, count(*) as usage_count
from activity_logs
group by month(activity_time), activity_type
order by month;



-- 8. User Engagement Level
select u.full_name, count(a.activity_id) as activities,
    case
        when count(a.activity_id) >= 150
        then 'high engagement'
        when count(a.activity_id) >= 50
        then 'medium engagement'
        else 'low engagement'
    end as engagement_level
from users u join activity_logs a
on u.user_id = a.user_id
group by u.full_name
order by activities desc;