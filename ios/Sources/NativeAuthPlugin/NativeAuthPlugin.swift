import Foundation
import Capacitor
import AuthenticationServices

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(NativeAuthPlugin)
public class NativeAuthPlugin: CAPPlugin, CAPBridgedPlugin, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    public let identifier = "NativeAuthPlugin"
    public let jsName = "NativeAuth"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "echo", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "showAppleSignIn", returnType: CAPPluginReturnPromise)
    ]
    private let implementation = NativeAuth()

    var call: CAPPluginCall?

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": implementation.echo(value)
        ])
    }

    @objc func showAppleSignIn(_ call: CAPPluginCall) {
      self.call = call
      handleAuthorizationAppleIDButtonPress()
    }

  @objc private func handleAuthorizationAppleIDButtonPress() {
      let request = ASAuthorizationAppleIDProvider().createRequest()
      request.requestedScopes = [.fullName, .email]

      let authorizationController = ASAuthorizationController(authorizationRequests: [request])
      authorizationController.delegate = self
      authorizationController.presentationContextProvider = self
      authorizationController.performRequests()
  }

  // ASAuthorizationControllerDelegate function
  @objc public func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
      if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
          let userIdentifier = appleIDCredential.user
          let fullName = appleIDCredential.fullName
          let email = appleIDCredential.email

          // Handle the received credentials
          call?.resolve([
              "isSuccess": true,
              "userIdentifier": userIdentifier,
              "fullName": fullName?.description ?? "",
              "email": email ?? ""
          ])
      }
  }

  @objc public func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
      // Handle error
      call?.reject("Authorization failed: \(error.localizedDescription)")
  }

  // ASAuthorizationControllerPresentationContextProviding function
  @objc public func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
    self.bridge?.viewController?.view.window ?? ASPresentationAnchor()
  }
}
