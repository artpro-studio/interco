# Используем официальную версию Node.js (18 LTS) на легковесном Alpine
FROM node:20-alpine

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем весь код проекта
COPY . .

# Устанавливаем зависимости
RUN npm install

# Проверяем, что внутри контейнера есть Quasar
RUN test -f quasar.config.ts || (echo "ERROR: Not a Quasar project!" && exit 1)

# Сборка Quasar SSR
RUN npm run serve-build

# Запускаем сервер Quasar
CMD ["node", "dist/ssr/index.js"]
