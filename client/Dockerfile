FROM node:20-alpine As development

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем package.json и package-lock.json
COPY package*.json ./

# Устанавливаем зависимости
RUN npm install

# Копируем исходники
COPY . .

# Собираем Quasar в SSR-режиме
RUN npm run build

# Запускаем сервер Quasar
CMD ["node", "dist/ssr/index.js"]
