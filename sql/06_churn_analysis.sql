-- ==================================================
-- ProjectFlow SaaS Analytics
-- Purpose: Customer Churn and Retention Analysis
-- ==================================================

use projectflow_analytics;
show tables;


-- 1. Active vs Churned Subscriptions
select subscription_status, count(*) as total_customers from subscription_history
group by subscription_status;



-- 2. Churn Rate Percentage
select round((sum(case when subscription_status = 'cancelled'
then 1 else 0 end) / count(*)) * 100, 2) as churn_rate_percentage
from subscription_history;



-- 3. Lost Revenue From Churned Customers
select sum(monthly_price) as lost_mrr from subscription_history
where subscription_status = 'cancelled';



-- 4. Current Active Customers
select count(distinct company_id) as active_customers from subscription_history
where subscription_status = 'active';



-- 5. Customer Retention Rate
select round((count(case when subscription_status = 'active' then company_id end) 
/ count(company_id)) * 100, 2) as retention_rate
from subscription_history;



-- 6. Churn by Plan
select plan_name, count(*) as churn_count from subscription_history
where subscription_status = 'cancelled'
group by plan_name
order by churn_count desc;



-- 7. Inactive Users by Company (Churn Risk)
select c.company_name, count(u.user_id) as inactive_users from companies c
join users u
on c.company_id = u.company_id
where u.user_status = 'Inactive'
group by c.company_name
order by inactive_users desc;



-- 8. Companies With Low Product Usage
select c.company_name, count(a.activity_id) as total_activity from companies c
join users u
on c.company_id = u.company_id
left join activity_logs a
on u.user_id = a.user_id
group by c.company_name
order by total_activity asc limit 5;