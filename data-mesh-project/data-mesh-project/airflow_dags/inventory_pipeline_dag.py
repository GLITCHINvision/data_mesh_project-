from datetime import datetime, timedelta

from airflow import DAG
from airflow.operators.bash import BashOperator

default_args = {
    "owner": "data-mesh-inventory",
    "depends_on_past": False,
    "retries": 1,
    "retry_delay": timedelta(minutes=5),
}

with DAG(
    dag_id="inventory_pipeline_dag",
    default_args=default_args,
    description="Inventory domain pipeline: load raw data + dbt models",
    schedule_interval="@daily",
    start_date=datetime(2025, 1, 1),
    catchup=False,
    tags=["data-mesh", "inventory"],
) as dag:

    load_raw_inventory = BashOperator(
        task_id="load_raw_inventory",
        bash_command="psql $POSTGRES_CONN_STRING -f /opt/postgres_setup/02_seed_raw_data.sql",
    )

    dbt_run_inventory = BashOperator(
        task_id="dbt_run_inventory",
        bash_command="cd /opt/dbt/dbt_inventory_domain && dbt run --models inventory_data_product --profiles-dir .",
    )

    dbt_test_inventory = BashOperator(
        task_id="dbt_test_inventory",
        bash_command="cd /opt/dbt/dbt_inventory_domain && dbt test --models inventory_data_product --profiles-dir .",
    )

    load_raw_inventory >> dbt_run_inventory >> dbt_test_inventory
