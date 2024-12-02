import UIKit
import AuthenticationServices
import Capacitor

class SignInWithAppleViewController: UIViewController, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {

    var pluginCall: CAPPluginCall?

    override func viewDidLoad() {
        super.viewDidLoad()

        let appleIDButton = ASAuthorizationAppleIDButton()
        appleIDButton.addTarget(self, action: #selector(handleAuthorizationAppleIDButtonPress), for: .touchUpInside)

        appleIDButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(appleIDButton)
        view.backgroundColor = .white
        let xPosition = pluginCall?.getFloat("xPosition") ?? Float(0)
        let yPosition = pluginCall?.getFloat("yPosition") ?? Float(0)
        let width =  pluginCall?.getFloat("width") ?? Float(200)
        let height = pluginCall?.getFloat("height") ?? Float(50)
        NSLayoutConstraint.activate([
            appleIDButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: CGFloat(xPosition)),
            appleIDButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: CGFloat(yPosition)),
            appleIDButton.widthAnchor.constraint(equalToConstant: CGFloat(width)),
            appleIDButton.heightAnchor.constraint(equalToConstant: CGFloat(height))
        ])
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
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email

            // Handle the received credentials
            pluginCall?.resolve([
                "isSuccess": true,
                "userIdentifier": userIdentifier,
                "fullName": fullName?.description ?? "",
                "email": email ?? ""
            ])
        }
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // Handle error
        pluginCall?.reject("Authorization failed: \(error.localizedDescription)")
    }

    // ASAuthorizationControllerPresentationContextProviding function
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}