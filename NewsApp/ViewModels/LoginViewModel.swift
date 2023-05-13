//
//  LoginViewModel.swift
//  NewsApp
//
//  Created by Linda Bergsängel on 2023-05-13.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login(){
        
        guard validate() else{
            return
        }
        Auth.auth().signIn(withEmail: email, password: password)
    }
   
    private func validate() -> Bool {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields."
            return false
        }
        
        guard email.contains("@") && email.contains(".") else{
            errorMessage = "Please enter valid email."
            return false
        }
        return true
    }
}
