import { WebPlugin } from '@capacitor/core';

import type { NativeAuthPlugin } from './definitions';

export class NativeAuthWeb extends WebPlugin implements NativeAuthPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
