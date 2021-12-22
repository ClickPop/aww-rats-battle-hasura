import {RequestHandler} from 'express';
import {decodeSignedMessage} from '../utils/decodeSignedMessage';

export const authenticate: RequestHandler = async (req, res) => {
  const {wallet, msg} = req.body;
  const signer = decodeSignedMessage(msg);
  if (signer === wallet) {
    res.cookie('wallet', wallet, {
      maxAge: 1000 * 60 * 60 * 24 * 7,
      secure: process.env.NODE_ENV === 'prod',
      signed: true,
    });
    return res.json({authenticated: true});
  }
  return res.status(401).json({authenticated: false});
};
