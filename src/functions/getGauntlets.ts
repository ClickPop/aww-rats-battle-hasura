import {RequestHandler} from 'express';
import {client} from '../lib/prismaClient';

export const getGauntlets: RequestHandler = async (_, res) => {
  const gauntlets = await client.gauntlet.findMany();
  return res.json({gauntlets});
};
