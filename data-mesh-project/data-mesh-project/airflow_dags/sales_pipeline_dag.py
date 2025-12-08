from datetime import datetime, timedelta

from airflow import DAG
from airflow.operators.bash import BashOperator

# Simple example DAG to:
# 1. run raw SQL setup / load (optional)
# 2. trigger dbt run for the sales domain
# 3. trigger dbt test for the sales domain

default_args = {
    "owner": "data-mesh-sales",
    "depends_on_past": False,
    "retries": 1,
    "retry_delay": timedelta(minutes=5),
}

with DAG(
    dag_id="sales_pipeline_dag",
    default_args=default_args,
    description="Sales domain pipeline: load raw data + dbt models",
    schedule_interval="@daily",
    start_date=datetime(2025, 1, 1),
    catchup=False,
    tags=["data-mesh", "sales"],
) as dag:

    # Example: run seed / raw SQL if needed
    load_raw_sales = BashOperator(
        task_id="load_raw_sales",
        bash_command="psql $POSTGRES_CONN_STRING -f /opt/postgres_setup/02_seed_raw_data.sql",
    )

    dbt_run_sales = BashOperator(
        task_id="dbt_run_sales",
        bash_command="cd /opt/dbt/dbt_sales_domain && dbt run --models sales_data_product --profiles-dir .",
    )

    dbt_test_sales = BashOperator(
        task_id="dbt_test_sales",
        bash_command="cd /opt/dbt/dbt_sales_domain && dbt test --models sales_data_product --profiles-dir .",
    )

    load_raw_sales >> dbt_run_sales >> dbt_test_sales
