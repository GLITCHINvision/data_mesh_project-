FROM apache/airflow:2.7.1

USER root

# Install git, Postgres client (psql) and system deps dbt may need
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
         git \
         libpq-dev \
         postgresql-client \
  && apt-get autoremove -yqq --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

USER airflow

# Install dbt-core + dbt-postgres inside Airflow image
RUN pip install --no-cache-dir dbt-core dbt-postgres

# Copy your project into the container (Airflow DAGs, dbt projects, SQL)
COPY airflow_dags/ /opt/airflow/dags/
COPY dbt_sales_domain/ /opt/dbt/dbt_sales_domain/
COPY dbt_inventory_domain/ /opt/dbt/dbt_inventory_domain/
COPY postgres_setup/ /opt/postgres_setup/

WORKDIR /opt/airflow

