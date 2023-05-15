//
//  AddArticleView.swift
//  NewsApp
//
//  Created by Viktor on 2023-05-15.
//

import SwiftUI

struct AddArticleView: View {
    @State var titleContent : String = "Enter Title..."
    @State var textContent : String = "Enter your article text here..."
    
    var body: some View {
            VStack{
                TextEditor(text: $titleContent).padding(30).background(Color(red: 240/255, green: 240/255, blue: 245/255))
                    .frame(height: 100)
                TextEditor(text: $textContent).padding(30).background(Color(red: 240/255, green: 240/255, blue: 245/255))
                Button("Publish", action: {print("Pressed button")})
            }
            .background(Color(red: 240/255, green: 240/255, blue: 245/255))
        
    }
    
    //Move to viewmodel later
    private func requestArticle(){
        let newArticle = Article(heading:titleContent, content: textContent)
        //upload to firebase
    }
    
}

struct AddArticleView_Previews: PreviewProvider {
    static var previews: some View {
        AddArticleView()
    }
}
