import { registerPlugin } from '@capacitor/core';

import type { NativeAuthPlugin } from './definitions';

const NativeAuth = registerPlugin<NativeAuthPlugin>('NativeAuth', {
  web: () => import('./web').then((m) => new m.NativeAuthWeb()),
});

export * from './definitions';
export { NativeAuth };
export {NativeAuthConfigOptions, NativeAuthResponse} from '../src/models/native-auth.types';