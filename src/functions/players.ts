import {client} from '../lib/prismaClient';
import express from 'express';
import {authMiddleware} from '../middleware/auth';
import {checkPlayer} from '../middleware/checkPlayer';

const app = express();

app.get('/me', authMiddleware, checkPlayer, async (_, res) => {
  const player = res.locals.player;
  if (player) {
    return res.json({player});
  }
  return res.status(401).json({error: 'Player not found'});
});

app.post('/create', authMiddleware, async (_, res) => {
  try {
    const wallet = res.locals.auth;

    if (!wallet) {
      return res.status(401).json({error: 'Unauthenticated'});
    }
    const player = await client.player.create({
      data: {
        id: wallet,
        energy: 20,
        max_energy: 20,
      },
    });
    console.log(player);
    return res.json({player});
  } catch (err) {
    console.error(err);
    return res.status(500).json({error: 'An error occurred'});
  }
});

export const players = app;
