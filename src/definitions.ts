import type { NativeAuthConfigOptions, NativeAuthResponse } from './models/native-auth.types';

export interface NativeAuthPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
  showAppleSignIn(options: NativeAuthConfigOptions): Promise<NativeAuthResponse>;
}
