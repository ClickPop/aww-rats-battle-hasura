# Rat Battle DB and Serverless Functions

## Pre-requisites

You will need the following installed on your system to get started with this repo:

- [NodeJS](https://nodejs.org/en/)
- [Pnpm](https://pnpm.io/)
- [Docker](docker.com) or local [Postgres](postgresql.org) instance
- GCP auth key
- .env file

## Setup

- Make sure Postgres is started
  - If running with docker, simply run `docker-compose up`
- Run `pnpm i` to install all deps
- Run `pnpx prisma generate` to generate the Prisma client based on the current schema
- Run `pnpx prisma migrate dev` to apply migrations to your database

## Developing

Just run `pnpm run watch` and it will start the Typescript compiler in watch mode, and nodemon watching the build folder.

### Making database changes

Any time you make a change to the prisma schema make sure to run `prisma migrate dev` to create a migration to the database

## Folder structure

The way we are handling this is by including a file in the `src/functions` directory for each set of routes. For instance, all the routes related to players will be in the `src/functions/players.ts` file.

Inside this file we create a new Express app, add the required routes/middleware, then export that app as a named export.
