# Используем Node.js с поддержкой альпайна (легковесный образ)
FROM node:20-alpine

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем package.json и package-lock.json для кеширования зависимостей
COPY package.json package-lock.json ./

# Устанавливаем Quasar CLI глобально
RUN npm install -g @quasar/cli

# Устанавливаем зависимости
RUN npm install

# Копируем весь проект (исключая файлы, указанные в .dockerignore)
COPY . .

# Проверяем, что находимся в папке Quasar-проекта
RUN test -f quasar.conf.js || (echo "Not a Quasar project!" && exit 1)

# Собираем Quasar SSR
RUN quasar build -m ssr

# Запускаем сервер SSR
CMD ["node", "dist/ssr/index.js"]
