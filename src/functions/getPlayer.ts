import {RequestHandler} from 'express';
import {client} from '../lib/prismaClient';

export const getPlayer: RequestHandler = async (_, res) => {
  const playerId = res.locals.auth;
  if (playerId) {
    const player = await client.player.findUnique({
      where: {
        id: playerId,
      },
    });
    return res.json(player);
  }
  return res.status(401).json({error: 'Player not found'});
};
