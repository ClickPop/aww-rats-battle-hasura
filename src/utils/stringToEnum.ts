import {RATTRIBUTE, RAT_TYPE} from '@prisma/client';

export const ratTypeStringToEnum = (str: string): RAT_TYPE => {
  switch (str) {
    case 'PET':
      return RAT_TYPE.PET;
    case 'LAB':
      return RAT_TYPE.LAB;
    case 'PACK':
      return RAT_TYPE.PACK;
    case 'STREET':
      return RAT_TYPE.STREET;
    default:
      throw new Error('Invalid rat type');
  }
};

export const rattributeStringToEnum = (str: string): RATTRIBUTE => {
  switch (str) {
    case 'cuteness':
      return RATTRIBUTE.CUTENESS;
    case 'cunning':
      return RATTRIBUTE.CUNNING;
    case 'rattitude':
      return RATTRIBUTE.RATTITUDE;
    default:
      throw new Error('Invalid rattribute');
  }
};
