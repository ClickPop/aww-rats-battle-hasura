import {RequestHandler} from 'express';
import {client} from '../lib/prismaClient';

export const getEncounters: RequestHandler = async (_, res) => {
  const encounters = await client.encounter.findMany();
  return res.json({encounters});
};
