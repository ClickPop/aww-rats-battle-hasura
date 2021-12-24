import express from 'express';
import {client} from '../lib/prismaClient';
const app = express();

app.get('/active', async (_, res) => {
  const raids = await client.raid.findMany({
    where: {
      active: true,
    },
  });
  return res.json({raids});
});

export const raids = app;
