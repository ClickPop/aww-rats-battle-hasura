import express from 'express';
import {authenticate} from './functions/authenticate';
import {getPlayer} from './functions/getPlayer';
import './middleware/auth';
const app = express();
app.post('/authenticate', authenticate);
app.get('/player', getPlayer);
export const functions = app;
