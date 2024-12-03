export type NativeAuthConfigOptions = {
  xOffset: number;
  yOffset: number;
  width: number;
  height: number;
}

export type NativeAuthResponse = {
  isSuccess: boolean;
  userIdentifier: string;
  fullName: string;
  email: string;
}
