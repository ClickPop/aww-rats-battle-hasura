import {RequestHandler} from 'express';
import {client} from '../lib/prismaClient';

export const getRaids: RequestHandler = async (_, res) => {
  const raids = await client.raid.findMany();
  return res.json({raids});
};
