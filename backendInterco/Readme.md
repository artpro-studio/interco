# Создать бекап БД
docker exec -t DOCKER_NAME_CONTAINER pg_dump -U postgres DB_NAME > backup.sql

# Удалние БД
docker exec -i DOCKER_NAME_CONTAINER psql -U postgres -d DB_NAME -c "DROP SCHEMA public CASCADE; CREATE SCHEMA public;"

# Восстановление бекапа
docker exec -i DOCKER_NAME_CONTAINER psql -U postgres -d DB_NAME < backup.sql
