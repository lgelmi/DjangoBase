#!/bin/sh


if [ "$DATABASE" = "db" ]
then
    echo "Waiting for PostgreSQL db..."

    while ! nc -z db 5432; do
      sleep 0.1
    done

    echo "PostgreSQL started."
else
    echo "Database name not set."
fi

python src/manage.py flush --no-input
python src/manage.py migrate

exec "$@"