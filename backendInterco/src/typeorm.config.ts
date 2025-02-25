import { DataSource } from "typeorm"
import dataSource from "./data-source"

const AppDataSource = new DataSource({
    type: 'postgres',
    host: 'localhost',
    port: 4040,
    username:  process.env.DB_USERNAME,
    password:  process.env.DB_PASSWORD,
    database:  process.env.DB_DATABASE_NAME,
    entities: ['dist/**/*.entity{.ts,.js}'],
    migrations: [
        'src/migrations/*.ts'
    ],
    synchronize: false,
})

AppDataSource.initialize()
    .then(() => {
        console.log("Data Source has been initialized!")
    })
    .catch((err) => {
        console.log(dataSource.options)
        console.error("Error during Data Source initialization", err)
    });

export  default AppDataSource;
