# PostgreSQL Superstore Analytics & Business Intelligence Suite

An exploratory data analysis and executive query suite built on a normalized relational star-schema, engineered in PostgreSQL to evaluate customer lifetime value, geographic revenue concentration, product category performance, and discount efficiency.

## 📊 Executive Summary & Key Findings
This repository contains a production-grade analytical SQL suite designed to surface actionable business intelligence from raw retail transactions. Key analytical findings include:
* **Geographic Revenue Concentration:** New York City ($257.8K) and Los Angeles ($174.0K) lead total market performance, driving over 15% of aggregate domestic revenue.
* **Top Customer Value:** Top-tier accounts are led by Sean Miller, generating $25,031 across 5 distinct orders, followed closely by Tamara Chand ($19,132).
* **Category Dominance:** **Technology** represents the highest-grossing category led by Phones ($328.9K) and the *Canon imageCLASS 2200 Advanced Copier* ($61.6K single-product revenue).
* **Discount Strategy Insight:** High-tier discounting strategies generated $1.12M in gross volume, while strict non-discounted transactions captured $1.09M, proving that indiscriminate heavy discounting erodes margins without capturing proportional net revenue.

---

## 🗂️ Project Structure & Query Suite
The repository houses the following analytical scripts answering core business questions:

* **`top_cities_revenue.sql`** — Isolates high-yield urban markets to guide regional expansion strategies.
* **`top_customers_revenue.sql`** — Ranks VIP buyers utilizing distinct order tracking (`COUNT(DISTINCT)`) to safeguard customer retention.
* **`monthly_revenue_trend.sql`** — Analyzes time-series growth trajectories from 2014 to 2017 with chronological formatting (`YYYY-Mon`).
* **`top_products_revenue.sql`** — Identifies flagship inventory drivers maximizing gross revenue.
* **`category_performance.sql`** — Granular breakdown of sales volume and revenue across product categories and sub-categories.
* **`discount_impact_analysis.sql`** — Evaluates discounting effectiveness utilizing multi-branched `CASE WHEN` logic.

---

## 🏗️ Relational Database Architecture (Star-Schema)
The database is structured following a normalized star-schema configuration to eliminate data redundancy and optimize relational join performance:
* **`customers`** (Primary Key: `customer_id`)
* **`products`** (Primary Key: `product_id`)
* **`orders`** (Primary Keys: composite key consisting of `order_id` and `product_id`; Foreign Keys: referencing `customer_id` and `product_id`).

    [ customers ] (1) ------< [ orders ] >------ (1) [ products ]
      customer_id               order_id                product_id
                                product_id (Comp. PK)

---

## 🛠️ Technical Skills Demonstrated
* **Relational Database Design:** Normalization, star-schema architecture, and enforced composite primary/foreign key constraints.
* **Defensive Querying:** Writing robust `WHERE` clauses to handle nulls and safeguard runtime execution.
* **Advanced Aggregations:** Leveraging `SUM`, `COUNT(DISTINCT)`, and explicit type-casting (`::NUMERIC`).
* **Temporal Intelligence:** Using `EXTRACT` and `TO_CHAR` for clean time-series aggregation.
* **Conditional Logic:** Multi-branched `CASE WHEN` segmentation for pricing and discount evaluation.
