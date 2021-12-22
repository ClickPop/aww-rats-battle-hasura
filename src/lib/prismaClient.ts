import {PrismaClient} from '@prisma/client';

export const client = new PrismaClient();

client.$connect();
