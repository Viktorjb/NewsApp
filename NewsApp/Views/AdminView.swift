//
//  AdminView.swift
//  NewsApp
//
//  Created by Youssef Azroun on 2023-05-15.
//

import SwiftUI
import FirebaseAuth

struct AdminView: View {
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    do{
                        try Auth.auth().signOut()
                    } catch let signOutError as NSError {
                        print("Error signing out: %@", signOutError)
                    }
                    
                    
                }){
                    Text("Logout")
                }
                .padding()
                .offset(x: -150, y: -400)
            }
            Text("Admin View")
        }
        
    }
}

struct AdminView_Previews: PreviewProvider {
    static var previews: some View {
        AdminView()
    }
}
