import {config} from 'dotenv';
config();
export const POLYGON_URL = 'https://polygon-rpc.com/';
export const COOKIE_SECRET = process.env.COOKIE_SECRET ?? '';
export const RAT_CONTRACT_ADDRESS = process.env.RAT_CONTRACT_ADDRESS ?? '';
export const CLOSET_CONTRACT_ADDRESS =
  process.env.CLOSET_CONTRACT_ADDRESS ?? '';
