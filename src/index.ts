import express from 'express';
import cookieParser from 'cookie-parser';
import {COOKIE_SECRET} from './config/env';
import {auth} from './functions/auth';
import {players} from './functions/players';
import {encounters} from './functions/encounters';
import {gauntlets} from './functions/gauntlets';
import {raids} from './functions/raids';

const app = express();

app.use(cookieParser(COOKIE_SECRET));

app.use('/auth', auth);
app.use('/players', players);
app.use('/encounters', encounters);
app.use('/gauntlets', gauntlets);
app.use('/raids', raids);

export const functions = app;
