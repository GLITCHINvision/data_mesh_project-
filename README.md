 Data Mesh Architecture with dbt, Airflow & Docker

This project demonstrates a simplified Data Mesh architecture where multiple data domains independently own, transform, and publish their own data products using dbt, while Apache Airflow automates pipelines and PostgreSQL stores the data. The entire stack is containerized using Docker.

This project is designed to showcase modern data engineering architecture used in real-world enterprises.

 Key Features

 Domain-driven data ownership (Sales & Inventory)

 Independent dbt projects per domain

 Automated pipelines using Apache Airflow

 Raw → Staging → Analytics transformation layers

 Containerized deployment with Docker Compose

 Production-style folder structure

 Ready for metadata tools like DataHub / Amundsen

 Architecture Overview

Domains:

Sales Domain

Inventory Domain

Flow:

Raw Data (Postgres)
        ↓
Domain-Level dbt Transformations
        ↓
Analytics Data Products
        ↓
Airflow Orchestration
        ↓
BI / Business Consumption


Each domain owns:

Its raw data

Its dbt transformations

Its analytics schema

Its Airflow pipeline

🛠️ Tech Stack
Technology	Purpose
PostgreSQL	Raw + Analytics Data Storage
dbt	Data Transformation, Testing & Documentation
Apache Airflow	Pipeline Scheduling & Orchestration
Docker & Docker Compose	Containerized Deployment
SQL	Data Modeling
Python	Airflow DAGs
 Project Structure
data-mesh-project/
│
├── airflow_dags/
│   ├── sales_pipeline_dag.py
│   └── inventory_pipeline_dag.py
│
├── dbt_sales_domain/
│   ├── models/
│   │   ├── staging/
│   │   └── sales_data_product/
│
├── dbt_inventory_domain/
│   ├── models/
│   │   ├── staging/
│   │   └── inventory_data_product/
│
├── postgres_setup/
│   ├── 01_setup_schemas.sql
│   └── 02_seed_raw_data.sql
│
├── docker-compose.yml
├── Dockerfile
└── README.md

 How the Project Works
1️ Raw Data Layer (Postgres)

Sales data → sales_raw.orders

Inventory data → inventory_raw.products

2️ Transformation Layer (dbt)

Sales creates:

fact_daily_sales

Inventory creates:

dim_product_inventory

Each domain owns its own:

dbt project

tests

documentation

deployment lifecycle

3️ Orchestration Layer (Airflow)

sales_pipeline_dag runs dbt for Sales

inventory_pipeline_dag runs dbt for Inventory

Pipelines can be triggered manually or scheduled

4️ Consumption Layer

Data is consumed by:

BI tools

Analysts

Business stakeholders

 Running the Project with Docker
1️ Start Docker Desktop

Make sure Docker Desktop is installed and running.

2️ Build & Start the Stack

Run this in the project root:

docker-compose up -d --build

3️ Verify Running Containers
docker ps


You should see:

data-mesh-postgres

data-mesh-airflow-webserver

data-mesh-airflow-scheduler

4️ Access Airflow UI

Open in browser:

http://localhost:8080


Login:

Username: airflow

Password: airflow

5️ Run Pipelines

Enable sales_pipeline_dag

Enable inventory_pipeline_dag

Trigger both DAGs ▶

Once successful, analytics tables will be created in Postgres.

 Sample Output Tables

analytics_sales.fact_daily_sales

analytics_inventory.dim_product_inventory

These tables can be used directly in:

Power BI

Tableau

Python analytics

Business reports

 Why Data Mesh?

Traditional centralized data teams create engineering bottlenecks.
This project solves that by:

Decentralizing ownership

Enabling self-service analytics

Scaling transformations independently

Improving data quality & accountability

 Use Cases

Daily sales reporting

Low inventory alerts

Product performance analysis

Business intelligence dashboards

 Future Enhancements

🔹 Add DataHub / Amundsen for metadata discovery

🔹 Add CI/CD for dbt

🔹 Add real-time streaming

🔹 Add Power BI / Tableau dashboards

🔹 Add Data Quality monitoring

 Author

Raman Sharma
GitHub: https://github.com/GLITCHINvision

LeetCode: https://leetcode.com/u/hard_code7/
