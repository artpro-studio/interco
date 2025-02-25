import { DataSource } from 'typeorm';
import * as dotenv from 'dotenv';

// Загрузка переменных окружения
dotenv.config();

const dataSource = new DataSource({
    type: 'postgres',
    host: 'postgres',
    port: 5432,
    username:  process.env.DB_USERNAME,
    password:  process.env.DB_PASSWORD,
    database:  process.env.DB_DATABASE_NAME,
    entities: ['dist/**/*.entity{.ts,.js}'],
    migrations: [
        'dist/migrations/**/*.ts'
    ],
    synchronize: false,
    migrationsRun: true,
});

export default dataSource;
