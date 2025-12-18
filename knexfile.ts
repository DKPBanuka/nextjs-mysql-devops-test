import * as dotenv from 'dotenv';
dotenv.config();

const connection = {
  host: process.env.DB_HOST || process.env.MYSQL_HOST,
  user: process.env.DB_USER || process.env.MYSQL_USER,
  password: process.env.DB_PASSWORD || process.env.MYSQL_PASSWORD,
  database: process.env.DB_NAME || process.env.MYSQL_DATABASE_NAME
};

const knexConfig = {
  // Development Mode
  development: {
    client: 'mysql2',
    connection: connection,
    migrations: {
      tableName: 'migrations',
      directory: './database/migrations'
    },
    seeds: {
      directory: './database/seeds'
    }
  },
  // Production Mode 
  production: {
    client: 'mysql2',
    connection: connection,
    migrations: {
      tableName: 'migrations',
      directory: './database/migrations'
    },
    seeds: {
      directory: './database/seeds'
    }
  }
};

export default knexConfig;