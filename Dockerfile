# Use the official Apache Airflow image
FROM apache/airflow:2.7.2

# Set the working directory
WORKDIR /opt/airflow

# Install additional Python packages if needed
RUN pip install --no-cache-dir apache-airflow-providers-google

# Set Airflow environment variables
ENV AIRFLOW_HOME=/opt/airflow

# Set the default command to start Airflow
CMD ["airflow", "scheduler"]
