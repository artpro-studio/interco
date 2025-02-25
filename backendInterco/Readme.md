# Создать бекап БД
docker exec -t postgresCMS pg_dump -U postgress cms > backup.sql

# Удалние БД
docker exec -i postgresCMS psql -U postgress -d cms -c "DROP SCHEMA public CASCADE; CREATE SCHEMA public;"

# Восстановление бекапа
docker exec -i postgresCMS psql -U postgress -d cms < backup.sql
