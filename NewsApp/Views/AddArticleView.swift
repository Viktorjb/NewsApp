//
//  AddArticleView.swift
//  NewsApp
//
//  Created by Viktor on 2023-05-15.
//

import SwiftUI



struct AddArticleView: View {
    @StateObject var viewModel = AddArticleViewModel()
    let lists = ArticleLists()
    //For alert-popup
    @State var showingAlert = false
    
    var body: some View {
            VStack{
                TextEditor(text: $viewModel.titleContent).padding(30).background(Color(red: 240/255, green: 240/255, blue: 245/255))
                    .frame(height: 100)
                TextEditor(text: $viewModel.textContent).padding(30).background(Color(red: 240/255, green: 240/255, blue: 245/255))
                Menu { //Not very elegant, should be possible with for-loop
                    Button {
                        viewModel.categoryContent = Category.world
                    } label: {
                        Text("World")
                    }
                    Button {
                        viewModel.categoryContent = Category.economy
                    } label: {
                        Text("Economy")
                    }
                    Button {
                        viewModel.categoryContent = Category.sports
                    } label: {
                        Text("Sports")
                    }
                    Button {
                        viewModel.categoryContent = Category.tech
                    } label: {
                        Text("Tech")
                    }
                    Button {
                        viewModel.categoryContent = Category.politics
                    } label: {
                        Text("Politics")
                    }
                } label: {
                    Image(systemName: "newspaper.circle.fill")
                    Text("Category")
                }.padding([.bottom, .trailing], 25)
                
                Button("Publish", action: {viewModel.requestArticle()
                    showingAlert = true
                }
                ).alert(viewModel.alertMessage, isPresented: $showingAlert) {
                    Button("OK", role: .cancel) { }
                }
            }
            .background(Color(red: 240/255, green: 240/255, blue: 245/255))
        
    }
}

struct AddArticleView_Previews: PreviewProvider {
    static var previews: some View {
        AddArticleView()
    }
}
