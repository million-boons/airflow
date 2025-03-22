# Wait for database to be ready
sleep 12

# Modify `airflow.cfg` to enable basic auth
sed -i 's/^#*\s*auth_backend.*/auth_backend = airflow.api.auth.backend.basic_auth/' /opt/airflow/airflow.cfg

# Initialize the database
airflow db init

# Create an admin user (if not exists)
airflow users create \
    --username admin \
    --firstname Mohan \
    --lastname Thakur \
    --role Admin \
    --email admin@example.com \
    --password admin

# Start the webserver
exec airflow webserver & airflow scheduler

# Keep the container running
tail -f /dev/null