# ProjectFlow SaaS Analytics Dashboard

## Project Overview

ProjectFlow SaaS Analytics is an end-to-end data analytics project designed to analyze a SaaS based project management platform.
The project focuses on user engagement, subscription revenue, feature usage, and project performance analysis using Python, SQL, and Tableau.

---

## Tools & Technologies

- Python
- Pandas
- Matplotlib
- MySQL
- Tableau
- Jupyter Notebook

---

## Dataset Overview

The dataset was generated using Python and contains simulated SaaS business data.

Tables:

- Companies
- Users
- Projects
- Tasks
- Comments
- Subscription History
- Activity Logs

Dataset Size:

- Companies: 10
- Users: 444
- Projects: 99
- Tasks: 2,520
- Comments: 6,346
- Activity Logs: 52,822+

---

## Database Design

A relational database was created in MySQL with proper primary keys and foreign key relationships.

Key relationships:

Companies → Users
Companies → Projects
Projects → Tasks
Users → Activity Logs
Tasks → Comments

---

## SQL Analysis

Performed SQL analysis including:

- User activity analysis
- Revenue analysis
- Project performance tracking
- Feature usage analysis
- Customer engagement analysis

---

## Python Analysis

Performed Exploratory Data Analysis:

- User growth analysis
- Active user trends
- Revenue KPIs
- Subscription analysis
- Feature adoption
- Project productivity

---

## Tableau Dashboard

Created an interactive executive dashboard.

Dashboard Sections:

- User Growth
- Revenue Analytics
- Product Engagement
- Project Performance


Dashboard Preview:

![Dashboard](tableau/dashboard_preview.png)

---

## Key Business Insights

- Tracked Monthly Recurring Revenue (MRR)
- Analyzed user engagement patterns
- Identified most used product features
- Measured project completion performance
- Compared subscription plans

---

## Project Workflow


Python Data Generation
        ↓
CSV Dataset
        ↓
MySQL Database
        ↓
SQL Analysis
        ↓
Python EDA
        ↓
Tableau Dashboard


---

## Author

Created as an end-to-end Data Analytics portfolio project.