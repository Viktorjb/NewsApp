//
//  NAButton.swift
//  NewsApp
//
//  Created by Linda Bergsängel on 2023-05-13.
//

import SwiftUI

struct NAButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    var body: some View {
        Button{
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
    }
}
    
    struct NAButton_Previews: PreviewProvider {
        static var previews: some View {
            NAButton(title: "Value", background: .pink){
            }
        }
    }

