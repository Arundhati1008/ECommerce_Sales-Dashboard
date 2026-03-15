📊 E-Commerce Sales Performance Analysis
Overview

This project analyzes an e-commerce transaction dataset to understand sales performance, product contribution, customer behavior, and geographic revenue distribution.
The workflow demonstrates an end-to-end data analytics pipeline using Python (Pandas) for data preparation, SQL for analysis, and Power BI for interactive visualization.

Project Workflow
Raw Dataset
   ↓
Data Cleaning & Preparation (Python – Pandas)
   ↓
Data Analysis (SQL Queries)
   ↓
Interactive Dashboard (Power BI)
Key Business Questions

What is the total revenue generated from the dataset?

Which products contribute the most revenue?

How does revenue change over time?

What is the ratio of new vs returning customers?

Which countries generate the highest revenue?

Tools & Technologies

Python (Pandas) – Data cleaning and preprocessing

SQL (MySQL) – Data analysis and aggregation

Power BI – Data visualization and dashboard creation

DAX – KPI and analytical calculations

Data Preparation (Python – Pandas)

Example cleaning steps performed:

import pandas as pd

df = pd.read_csv("ecommerce_data.csv")

# remove missing customer IDs
df = df.dropna(subset=['Customer ID'])

# create revenue column
df['Revenue'] = df['Quantity'] * df['Price']

# convert invoice date to datetime
df['InvoiceDate'] = pd.to_datetime(df['InvoiceDate'])

# remove duplicates
df = df.drop_duplicates()

df.to_csv("cleaned_ecommerce_data.csv", index=False)
SQL Analysis Examples
Total Revenue
SELECT SUM(Revenue) AS total_revenue
FROM ecommerce_project_transactions;
Top Selling Products
SELECT Description,
       SUM(Revenue) AS total_revenue
FROM ecommerce_project_transactions
GROUP BY Description
ORDER BY total_revenue DESC
LIMIT 10;
Revenue by Country
SELECT Country,
       SUM(Revenue) AS total_revenue
FROM ecommerce_project_transactions
GROUP BY Country
ORDER BY total_revenue DESC;
Monthly Revenue Trend
SELECT
    YEAR(InvoiceDate) AS year,
    MONTH(InvoiceDate) AS month,
    SUM(Revenue) AS monthly_revenue
FROM ecommerce_project_transactions
GROUP BY YEAR(InvoiceDate), MONTH(InvoiceDate)
ORDER BY year, month;
Power BI Dashboard Features

The interactive dashboard provides insights such as:

Total Revenue KPI

Average Order Value

Revenue per Customer

Revenue Growth Percentage

Monthly Revenue Trend

Top 10 Revenue-Generating Products

Customer Retention Analysis (New vs Returning Customers)

Global Revenue Distribution by Country


Key Insights

Total revenue generated: 18.97M

A small number of products contribute the majority of revenue (Pareto effect).

Returning customers dominate purchases, indicating strong customer retention.

Revenue is concentrated primarily in European markets.


future improvements
Add customer segmentation analysis

Implement dynamic Top N product analysis

Add predictive sales forecasting
