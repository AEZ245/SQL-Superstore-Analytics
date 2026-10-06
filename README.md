# Superstore SQL Analytics & Business Intelligence

An exploratory data analysis and business intelligence query suite built on a relational star-schema, extracting key insights on customer value, regional performance, and discount strategies using PostgreSQL.

## 📊 Overview
This project showcases intermediate-to-advanced SQL querying capabilities applied to a retail superstore dataset. The database is structured using a clean relational star-schema (`customers`, `products`, `orders`) to ensure data integrity and optimize analytical performance.

## 🗂️ Project Structure & Query Suite
The repository contains the following analytical scripts answering core business questions:

* **`top_cities_revenue.sql`** — Identifies the highest-revenue geographic markets to guide regional expansion strategies.
* **`top_customers_revenue.sql`** — Ranks top-tier buyers utilizing distinct order tracking (`COUNT(DISTINCT)`) to support customer retention.
* **`monthly_revenue_trend.sql`** — Analyzes time-series revenue growth using clean, chronologically-sorted formatting (`YYYY-Mon`).
* **`top_products_revenue.sql`** — Extracts the highest-earning individual products driving gross revenue.
* **`category_performance.sql`** — Breaks down sales volume (`items_quantity_sold`) and revenue across product categories and sub-categories.
* **`discount_impact_analysis.sql`** — Evaluates discounting effectiveness using multi-branched `CASE WHEN` logic and cross-platform portable grouping.

## 🛠️ Technical Skills Demonstrated
* **Relational Database Design:** Utilizing foreign key constraints and star-schema principles.
* **Defensive Filtering:** Writing robust `WHERE` clauses to handle missing data, nulls, and anomalies safely.
* **Advanced Aggregations:** Leveraging `SUM`, `COUNT(DISTINCT)`, and explicit type casting (`::NUMERIC`).
* **Temporal Functions:** Using `EXTRACT` and `TO_CHAR` for time-series analysis and clean reporting.
* **Conditional Logic:** Implementing multi-branched `CASE WHEN` statements for segmentation.
* **Code Portability:** Structuring queries for maximum compatibility across SQL dialects.

## 🚀 How to Run
All queries are written in standard **PostgreSQL** syntax and can be executed directly against a relational database containing the `orders`, `products`, and `customers` schema tables.
