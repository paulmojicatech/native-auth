import Foundation
import Capacitor
import AuthenticationServices

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(NativeAuthPlugin)
public class NativeAuthPlugin: CAPPlugin, CAPBridgedPlugin {
    public let identifier = "NativeAuthPlugin"
    public let jsName = "NativeAuth"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "echo", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "showAppleSignIn", returnType: CAPPluginReturnPromise)
    ]
    private let implementation = NativeAuth()

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": implementation.echo(value)
        ])
    }

    @objc func showAppleSignIn(_ call: CAPPluginCall) {
        DispatchQueue.main.async {
            let signInVC = SignInWithAppleViewController()
            signInVC.pluginCall = call
            signInVC.modalPresentationStyle = .formSheet
            self.bridge?.viewController?.present(signInVC, animated: true, completion: nil)
        }
    }
}
