import {RequestHandler} from 'express';
import {client} from '../lib/prismaClient';

export const checkPlayer: RequestHandler = async (req, res, next) => {
  try {
    const wallet = res.locals.auth;
    const player = await client.player.findFirst({
      where: {
        id: wallet,
      },
    });
    if (!player) {
      return res.status(401).json({error: 'Player does not exist'});
    }
    res.locals.player = player;
  } catch (err) {
    return next(err);
  }
  return next();
};
