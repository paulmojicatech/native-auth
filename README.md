# @paulmojicatech/native-auth

Plugin to provide native auth solutions

## Install

```bash
npm install @paulmojicatech/native-auth
npx cap sync
```

## API

<docgen-index>

* [`echo(...)`](#echo)
* [`showAppleSignIn(...)`](#showapplesignin)
* [Type Aliases](#type-aliases)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### echo(...)

```typescript
echo(options: { value: string; }) => Promise<{ value: string; }>
```

| Param         | Type                            |
| ------------- | ------------------------------- |
| **`options`** | <code>{ value: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### showAppleSignIn(...)

```typescript
showAppleSignIn(options: NativeAuthConfigOptions) => Promise<NativeAuthResponse>
```

| Param         | Type                                                                        |
| ------------- | --------------------------------------------------------------------------- |
| **`options`** | <code><a href="#nativeauthconfigoptions">NativeAuthConfigOptions</a></code> |

**Returns:** <code>Promise&lt;<a href="#nativeauthresponse">NativeAuthResponse</a>&gt;</code>

--------------------


### Type Aliases


#### NativeAuthResponse

<code>{ isSuccess: boolean; userIdentifier: string; fullName: string; email: string; }</code>


#### NativeAuthConfigOptions

<code>{ xOffset: number; yOffset: number; width: number; height: number; }</code>

</docgen-api>
