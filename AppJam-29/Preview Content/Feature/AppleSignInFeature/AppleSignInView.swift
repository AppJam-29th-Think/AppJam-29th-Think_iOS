//
//  AppleSignInView.swift
//  AppJam-29
//
//  Created by 서지완 on 2/8/25.
//

import SwiftUI
import AuthenticationServices
import FirebaseAuth
import Firebase
import CryptoKit

struct AppleSignInView: View {
    @StateObject private var loginData = LoginViewModel()
    @State private var appleIsPressed = false
    @State private var googleIsPressed = false
    @State private var emailIsPressed = false

    var body: some View {
        ZStack {
            Color.black900.ignoresSafeArea()
        VStack {

            Image("thinkLogo")
                .padding(.top, 140)
            Text("Think")
                .font(.pretendard(.extraBold, size: 50))
                .foregroundStyle(.black0)
                .padding(.top, 28)
            Text("생각하다")
                .font(.pretendard(.medium, size: 20))
                .foregroundStyle(.black0)
            HStack {
                Image("googleLogo")
                Text("Google 계정으로 시작하기")
                    .font(.pretendard(.bold, size: 16))
            }
            .padding(.vertical, 14)
            .padding(.horizontal, 81)
            .background(RoundedRectangle(cornerRadius: 15).fill(.black0))
            .scaleEffect(googleIsPressed ? 0.95 : 1.0)
            .opacity(googleIsPressed ? 0.7 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: googleIsPressed)
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { _ in googleIsPressed = true }
                    .onEnded { _ in
                        googleIsPressed = false
                    }
            )
            .padding(.top, 55)

            HStack {
                Image("appleLogo")
                Text("Apple 계정으로 시작하기")
                    .font(.pretendard(.bold, size: 16))
            }
            .padding(.vertical, 14)
            .padding(.horizontal, 86)
            .background(RoundedRectangle(cornerRadius: 15).fill(.black0))
            .scaleEffect(appleIsPressed ? 0.95 : 1.0)
            .opacity(appleIsPressed ? 0.7 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: appleIsPressed)
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { _ in appleIsPressed = true }
                    .onEnded { _ in
                        appleIsPressed = false
                        loginData.performAppleSignIn()
                    }
            )
            .padding(.top, 3)


            HStack {
                Rectangle()
                    .frame(width: 120, height: 0.4)
                    .foregroundStyle(.black60)

                Text("또는")
                    .foregroundStyle(.black40)
                    .font(.pretendard(.regular, size: 13))

                Rectangle()
                    .frame(width: 120, height: 0.4)
                    .foregroundStyle(.black60)
            }
            .padding(.vertical, 10)

            HStack {
                Image("emailLogo")
                Text("이메일로 시작하기")
                    .font(.pretendard(.bold, size: 16))
            }
            .padding(.vertical, 14)
            .padding(.horizontal, 81)
            .background(RoundedRectangle(cornerRadius: 15).fill(.black0))
            .scaleEffect(emailIsPressed ? 0.95 : 1.0)
            .opacity(emailIsPressed ? 0.7 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: emailIsPressed)
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { _ in emailIsPressed = true }
                    .onEnded { _ in
                        emailIsPressed = false
                    }
            )
            Spacer()
        }
    }
    }
}

class LoginViewModel: NSObject, ObservableObject {
    @Published var nonce = ""

    func performAppleSignIn() {
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        nonce = randomNonceString()
        request.requestedScopes = [.email, .fullName]
        request.nonce = sha256(nonce)

        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
    }

    func authenticate(credential: ASAuthorizationAppleIDCredential) {
        guard let token = credential.identityToken else {
            print("Firebase 인증 실패: ID 토큰 없음")
            return
        }

        guard let tokenString = String(data: token, encoding: .utf8) else {
            print("Firebase 인증 실패: 토큰 문자열 변환 오류")
            return
        }

        let firebaseCredential = OAuthProvider.credential(
            withProviderID: "apple.com",
            idToken: tokenString,
            rawNonce: nonce
        )

        Auth.auth().signIn(with: firebaseCredential) { result, error in
            if let error = error {
                print("Firebase 로그인 실패: \(error.localizedDescription)")
            } else {
                print("Apple 로그인 성공!")
                print("UID: \(result?.user.uid ?? "No UID")")
                print("Email: \(result?.user.email ?? "No Email")")
                print("Display Name: \(result?.user.displayName ?? "No Display Name")")
            }
        }
    }
}

// ✅ Apple 로그인 Delegate 및 Presentation Context 처리
extension LoginViewModel: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            authenticate(credential: appleIDCredential)
        }
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Apple 로그인 실패: \(error.localizedDescription)")
    }

    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return UIApplication.shared.windows.first!
    }
}

// 🔒 SHA256 해시 생성
func sha256(_ input: String) -> String {
    let inputData = Data(input.utf8)
    let hashedData = SHA256.hash(data: inputData)
    return hashedData.compactMap { String(format: "%02x", $0) }.joined()
}

// 🔀 난수 Nonce 생성
func randomNonceString(length: Int = 32) -> String {
    precondition(length > 0)
    let charset: [Character] =
        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
    var result = ""
    var remainingLength = length

    while remainingLength > 0 {
        var random: UInt8 = 0
        let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
        if errorCode != errSecSuccess {
            fatalError("Nonce 생성 실패: OSStatus \(errorCode)")
        }

        if random < charset.count {
            result.append(charset[Int(random)])
            remainingLength -= 1
        }
    }

    return result
}

@main
struct AppjamApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

// 🔥 Firebase 초기화
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

// 미리보기 지원
//#Preview {
//    AppleSignInView()
//}
