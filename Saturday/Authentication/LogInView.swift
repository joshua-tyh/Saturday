//
//  LogInView.swift
//  Saturday
//
//  Created by Joshua Tan on 10/6/22.
//

import SwiftUI

struct LogInView: View {
    
    @EnvironmentObject var viewModel: UserViewModel
    
    @State var email = ""
    
    @State var password = ""
    
    @State var isShowingSignUpView: Bool = false
    
    @FocusState var isFocused: Bool
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color.systemIndigo, Color.background]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            Circle()
                .scale(1.7)
                .foregroundColor(Color.background.opacity(0.15))
            
            Circle()
                .scale(1.35)
                .foregroundColor(Color.background)
            
            // MARK: Navigation Bar
            VStack {
                NavBarView(
                    topLeftButtonView: "",
                    topRightButtonView: "",
                    titleString: "",
                    topLeftButtonAction: {},
                    topRightButtonAction: {})
                
                Spacer()
            }
            
            VStack {
                
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                    TextField("Email", text: $email)
                        .multilineTextAlignment(.center)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(50)
                        .focused($isFocused)
                
                Spacer()
                    .frame(height: 10)
                
                    SecureField("Password", text: $password)
                        .multilineTextAlignment(.center)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(50)
                        .focused($isFocused)
                
                Spacer()
                    .frame(height: 10)
                
                Button {
                    viewModel.login(withEmail: email, password: password)
                    viewModel.refresh()
                } label: {
                    Text("Login")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.systemBlue)
                        .cornerRadius(50)
                }
                
                HStack {
                    Text("New around here?")
                        .font(.headline)
                    
                    Button {
                        isShowingSignUpView = true
                    } label: {
                        Text("Sign Up")
                            .foregroundColor(Color.systemBlue)
                            .font(.subheadline)
                    }
                    
                    NavigationLink(isActive: $isShowingSignUpView) {
                        SignUpView(isShowingSignUpView: $isShowingSignUpView)
                            .environmentObject(viewModel)
                            .navigationBarHidden(true)
                    } label: {}
                    
                }
                
                Text("By signing in, you agree with our")
                    .font(.system(size: 12))
                    .foregroundColor(Color.gray)
                    .padding(.top, 4)
                
                HStack {
                    
                    Link(destination: URL(string: "https://teamsaturdaydevs.wixsite.com/saturday")!) {
                        Text("Terms")
                            .font(.system(size: 12))
                            .underline()
                            .foregroundColor(Color.gray)
                    }
                    
                    Text("|")
                        .font(.system(size: 12))
                        .foregroundColor(Color.gray)
                    
                    Link(destination: URL(string: "https://teamsaturdaydevs.wixsite.com/saturday")!) {
                        Text("Privacy Policy")
                            .font(.system(size: 12))
                            .underline()
                            .foregroundColor(Color.gray)
                    }
                }
                
            }
            
            if isFocused {
                Color.white.opacity(0.001)
                    .onTapGesture {
                        isFocused = false
                    }
            }
            
        }
        .onAppear {
            viewModel.reset()
        }
    }
}


//struct LogInView_Previews: PreviewProvider {
//    static var previews: some View {
//        LogInView()
//            .environmentObject(UserViewModel())
//            .environment(\.colorScheme, .dark)
//    }
//}
