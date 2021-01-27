//
//  Login.swift
//  SwiftUI-CRS Tool
//
//  Created by Phat Luong on 2021-01-22.
//

import SwiftUI
import Firebase
import GoogleSignIn

struct Login: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var delegate: AppDelegate
    
    @State private var email = ""
    @State private var isShowAlert = false
    @State var title = ""
    @State var message = ""
    @State var isSignInGoogle = false
    
    var body: some View {
        GeometryReader {_ in
            VStack(spacing: 20) {
                VStack {
                    Text("Sign in to CRS Tool")
                        .font(.title).bold()
                    Text("get free consulting from us")
                        .font(.subheadline)
                }.foregroundColor(Color(K.LightBlue))
                TextField("Email", text: $email)
                    .padding()
                    .keyboardType(.emailAddress)
                    .textContentType(.emailAddress)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .background(RoundedRectangle(cornerRadius: K.CornerValue).stroke(email == "" ? Color(K.LightBlue) : Color(K.LightGreen), lineWidth: 2))
                
                Button(action: singIn, label: {
                    Text("Sign in")
                        .font(.headline)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(email == "" ? Color(K.LightBlue) : Color(K.LightGreen))
                        .cornerRadius(K.CornerValue)
                }).disabled(email == "")
                
                Text("or")
                    .font(.title3).bold()
                    .foregroundColor(Color(K.LightBlue))
                
                Button(action: {
                    GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.first?.rootViewController
                    GIDSignIn.sharedInstance()?.signIn()
                    isSignInGoogle.toggle()
                }, label: {
                    HStack{
                        Image(K.GoogleLogo)
                        Text("Continue with Google")
                            .font(.headline).bold().padding()
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(Color(K.GoogleButtonColor))
                    .cornerRadius(K.CornerValue)
                })
                
            }.padding()
            .alert(isPresented: isSignInGoogle ? $delegate.isShowAlert : $isShowAlert) {
                Alert(title: Text(isSignInGoogle ? delegate.title : title).font(.headline),
                      message: Text(isSignInGoogle ? delegate.message : message).font(.caption), dismissButton: .default(Text("Ok"), action: {
                    self.presentationMode.wrappedValue.dismiss()
                }))
            }
            
        }
    }
    
    func singIn() {
        Auth.auth().createUser(withEmail: email, password: "q1!w2@e3#r4$t5%y6^") { authResult, error in
            if let error = error {
                isShowAlert = true
                title = "Error"
                message = error.localizedDescription
            } else {
                isShowAlert = true
                title = "Sign in successfully"
                message = "Thank you for sign in. We will connect you soon."
            }
        }
    }
}
