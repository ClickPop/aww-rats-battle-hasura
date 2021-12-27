# Rat Battle Hasura Service

## Pre-requisites

You will need the following installed on your system to get started with this repo:

- [NodeJS](https://nodejs.org/en/)
- [Pnpm](https://pnpm.io/)
- [Docker](docker.com)
- .env file

## Setup

- Run `docker-compose up` to start the Hasura GraphQL Engine and Postgres DB
- Run `pnpm i` to install all deps
- In a new terminal tab/window cd into the `local` folder then run `pnpx hasura console` to start the hasura console so any changes you make will be tracked.
  - You will need the `functions` service running locally.