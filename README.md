 # Data Mesh Architecture with dbt, Airflow and Docker

This project implements a simplified Data Mesh architecture where multiple data domains independently own, transform, and publish their own data products using dbt. Apache Airflow is used for orchestration, PostgreSQL for storage, and the entire system is containerized using Docker.

## Project Overview

The project simulates two independent business domains:
- Sales Domain
- Inventory Domain

Each domain manages its own raw data, transformation logic, and final analytics tables without relying on a centralized data engineering team.

## Tech Stack

- PostgreSQL: Raw and analytics data storage  
- dbt (Data Build Tool): Data transformation, testing, documentation  
- Apache Airflow: Pipeline orchestration and scheduling  
- Docker and Docker Compose: Containerized deployment  
- SQL: Data modeling and transformations  
- Python: Airflow DAGs  

## Architecture Flow

Raw Data in PostgreSQL  
→ Domain-level dbt transformations  
→ Analytics data products  
→ Airflow orchestration  
→ Consumption by BI tools and analysts  

## Data Products

Sales Domain:
- fact_daily_sales: Daily product-level sales revenue and quantities

Inventory Domain:
- dim_product_inventory: Current stock, reorder levels, and low-stock flag

## Folder Structure

data-mesh-project/
- airflow_dags/
- dbt_sales_domain/
- dbt_inventory_domain/
- postgres_setup/
- docker-compose.yml
- Dockerfile

## How It Works

1. Raw sales and inventory data are stored in PostgreSQL schemas.
2. Each domain uses its own dbt project to transform raw data into analytics-ready tables.
3. Apache Airflow runs and schedules dbt pipelines using domain-specific DAGs.
4. Final data products are stored in analytics schemas and are ready for reporting and analysis.

## How to Run

1. Install Docker Desktop.
2. From the project root, run:
   docker-compose up -d --build
3. Open Airflow at:
   http://localhost:8080
4. Login with:
   Username: airflow  
   Password: airflow  
5. Enable and trigger:
   - sales_pipeline_dag  
   - inventory_pipeline_dag  

## Output Tables

- analytics_sales.fact_daily_sales  
- analytics_inventory.dim_product_inventory  

These tables can be used directly for dashboards, reporting, and business analysis.

## Purpose of the Project

This project demonstrates domain-driven data ownership, decentralized transformations, automated orchestration, and production-style data engineering architecture aligned with modern Data Mesh principles.

## Author

Raman Sharma  
GitHub: https://github.com/GLITCHINvision  
LeetCode: https://leetcode.com/u/hard_code7/
