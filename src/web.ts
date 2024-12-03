import { WebPlugin } from '@capacitor/core';

import type { NativeAuthPlugin } from './definitions';
import type { NativeAuthConfigOptions, NativeAuthResponse } from './models/native-auth.types';

export class NativeAuthWeb extends WebPlugin implements NativeAuthPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }

  async showAppleSignIn(options: NativeAuthConfigOptions): Promise<NativeAuthResponse> {
    console.log('signInWithApple', options);
    return { isSuccess: false, userIdentifier: '', fullName: '', email: '' };
  }
}
