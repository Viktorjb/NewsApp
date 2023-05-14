//
//  LoginView.swift
//  GoalReacher
//
//  Created by Linda Bergsängel on 2023-05-06.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        
        NavigationView{
            VStack{
                VStack{
                    Rectangle().fill().background(Color.black)
                        .frame(height: 135)
                }
                Text("Login to news app")
                    .foregroundColor(Color.black)
                    .font(.system(size: 30))

                Form{
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    NAButton(title: "Login", background: .green){
                        viewModel.login()
                    }
   
                }
                .background(Color(red: 47/255, green:79/255,blue: 79/255))
                
                //Create account
                
                    Text("Don't have an account yet?")
                        .foregroundColor(Color.black)
                    NavigationLink("Create an account",
                                   destination: RegisterView())
                    }
                
                
            }
        VStack{
            Rectangle().fill().background(Color.black)
                .frame(height: 150)
        }
            
        }
    }

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
