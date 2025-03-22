from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime, timedelta

def print_hello():
    print("Hello from Airflow DAG in Docker!")


def say_hi():
    print("Second task ::: Say Hi ..!")

# Define DAG
with DAG(
    dag_id="example_dag",
    #schedule_interval="@daily",
    schedule_interval=timedelta(seconds=5),  # Run every 5 second
    start_date=datetime(2025, 3, 12),
    catchup=False
) as dag:

    hello_task = PythonOperator(
        task_id="hello_task",
        python_callable=print_hello
    )

    say_hi = PythonOperator(
        task_id="say_hi",
        python_callable=say_hi
    )

    hello_task  >> say_hi
