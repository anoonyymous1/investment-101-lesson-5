//
//  SignInViewModel.swift
//  investment 101
//
//  Created by Celine Tsai on 11/10/23.
//

//import SwiftUI
//import Firebase
//import GoogleSignIn
//import FirebaseAuth
//
//class SignInViewModel: ObservableObject{
//    //part one
//    enum signInState{
//        case signedIn
//        case signedOut
//    }
//    @Published var state: signInState = .signedOut
//    
//    func signIn() {
//        // checked if there is previous sign in if there is then we send directly to mainmenu if not then let them signin
//        if GIDSignIn.sharedInstance.hasPreviousSignIn() {
//            GIDSignIn.sharedInstance.restorePreviousSignIn { [unowned self] user, error in
//                authenticateUser(for: user, with: error)
//            }
//        } else {
//            //get clientid from firebase
//            guard let clientID = FirebaseApp.app()?.options.clientID else { return }
//            
//            // making the google signin a configuration object
//            let configuration = GIDConfiguration(clientID: clientID)
//            
//            //find the rootview controller
//            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
//            guard let rootViewController = windowScene.windows.first?.rootViewController else { return }
//            
//            // authenticate user signin
//            GIDSignIn.sharedInstance.signIn(with: configuration, presenting: rootViewController) { [unowned self] user, error in
//                authenticateUser(for: user, with: error)
//            }
//        }
//    }
//    private func authenticateUser(for user: GIDGoogleUser?, with error: Error?){
//        // finds error
//          if let error = error {
//            print(error.localizedDescription)
//            return
//          }
//          
//          // create idtoken and accesstoken for user
//          guard let authentication = user?.authentication, let idToken = authentication.idToken else { return }
//          
//          let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
//          
//          // 3
//          Auth.auth().signIn(with: credential) { [unowned self] (_, error) in
//            if let error = error {
//              print(error.localizedDescription)
//            } else {
//              self.state = .signedIn
//            }
//          }
//    }
//}
