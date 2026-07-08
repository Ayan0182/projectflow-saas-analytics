-- ==================================================
-- ProjectFlow SaaS Analytics
-- Purpose: Revenue and Subscription Analysis
-- ==================================================

use projectflow_analytics;
select * from subscription_history;


-- 1. Total Monthly Recurring Revenue (MRR)
select sum(monthly_price) as total_mrr
from subscription_history
where subscription_status = 'active';



-- 2. Annual Recurring Revenue (ARR)
select sum(monthly_price) * 12 as total_arr
from subscription_history
where subscription_status = 'active';



-- 3. Revenue by Subscription Plan
select plan_name, count(company_id) as total_companies, sum(monthly_price) as revenue
from subscription_history
where subscription_status = 'active'
group by plan_name
order by revenue desc;



-- 4. Free vs Paid Companies
select
    case
        when monthly_price = 0
        then 'free'
        else 'paid'
    end as customer_type,
count(company_id) as total_companies
from subscription_history
where subscription_status = 'active'
group by customer_type;



-- 5. Average Revenue Per Customer (ARPU)
select
    round(
        avg(monthly_price),
       2
    ) as arpu
from subscription_history
where subscription_status = 'active';




-- 6. Companies Who Upgraded Their Plan
select
    c.company_name,
    count(s.subscription_id) as total_plans_used
from companies c
join subscription_history s
on c.company_id = s.company_id
group by c.company_name
having total_plans_used > 1;



-- 7. Subscription Plan Distribution
select
    plan_name,
    count(*) as total_subscriptions
from subscription_history
group by plan_name
order by total_subscriptions desc;


-- 8. Churned Companies
select
    c.company_name,
    s.plan_name,
    s.end_date
from subscription_history s
join companies c
on s.company_id = c.company_id
where subscription_status = 'expired';