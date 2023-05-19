//
//  ProfileView.swift
//  NewsApp
//
//  Created by Linda Bergsängel on 2023-05-13.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    
    var body: some View {
        
        Text("Your Profile")
            .font(.system(size: 30))
        Spacer()
        Button(action: {
            do{
                try Auth.auth().signOut()
            } catch let signOutError as NSError {
                print("Error signing out: %@", signOutError)
            }
            
            
        }){
            Text("Logout")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
