-- 00_init_auth.sql
CREATE USER dbt_user WITH PASSWORD 'dbt_password';
CREATE DATABASE data_mesh;
GRANT ALL PRIVILEGES ON DATABASE data_mesh TO dbt_user;
ALTER DATABASE data_mesh OWNER TO dbt_user;
