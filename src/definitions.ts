export interface NativeAuthPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
