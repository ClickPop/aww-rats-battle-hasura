import {decodeSignedMessage} from '../utils/decodeSignedMessage';
import express from 'express';

const app = express();

app.post('/login', async (req, res) => {
  const {wallet, msg} = req.body;
  const signer = decodeSignedMessage(msg);
  console.log(signer);
  if (signer === wallet.toLowerCase()) {
    res.cookie('wallet', wallet, {
      maxAge: 1000 * 60 * 60 * 24 * 7,
      secure: process.env.NODE_ENV === 'prod',
      signed: true,
    });
    return res.json({authenticated: true});
  }
  return res.status(401).json({authenticated: false});
});

export const auth = app;
