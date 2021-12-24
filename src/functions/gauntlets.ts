import express from 'express';
import {client} from '../lib/prismaClient';
const app = express();

app.get('/active', async (_, res) => {
  const gauntlets = await client.gauntlet.findMany({
    where: {
      active: true,
    },
  });
  return res.json({gauntlets});
});

export const gauntlets = app;
