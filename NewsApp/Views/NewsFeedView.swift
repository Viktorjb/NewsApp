//
//  NewsFeedView.swift
//  NewsApp
//
//  Created by David Salmberg on 2023-05-15.
//

import SwiftUI

struct NewsFeedView: View {
    @StateObject var viewModel = NewsFeedViewModel()
    @State private var isProfileActive: Bool = false
    @State private var isMenuActive: Bool = false
    @State private var menuOffset: CGFloat = -UIScreen.main.bounds.width // Initial offset to hide the menu
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    ZStack {
                        Color.black
                            .frame(height: 110) // Adjust the height as needed
                        Text("News")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .bold()
                    }
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 110) // Adjust the height as needed
                    
                    VStack {
                        ScrollView {
                            VStack {
                                ForEach(viewModel.articles, id: \.heading) { article in
                                    HStack {
                                        Text(article.heading)
                                            .font(.title)
                                            .bold()
                                            .padding(.leading, 10)
                                        
                                        Spacer()
                                        
                                        Image("Image")
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                            .padding(10)
                                    }
                                }
                            }
                        }
                        .frame(maxHeight: .infinity) // Occupy the remaining available space
                        
                        Spacer() // Add a spacer to push the content above the toolbar
                    }
                }
                
                // Menu view
                MenuView(isMenuActive: $isMenuActive)                    .frame(width: UIScreen.main.bounds.width * 0.8) // Adjust the width as needed
                    .offset(x: isMenuActive ? 0 : -UIScreen.main.bounds.width) // Apply the offset to control the slide-out animation
                    .animation(.easeInOut) // Apply animation
                    .zIndex(1) // Ensure the menu appears above the content
                    
            }
            .modifier(InitialMenuActivationModifier(isMenuActive: $isMenuActive))
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                viewModel.articleMockData()
            }
            .navigationBarTitle("", displayMode: .inline) // Set an empty title to keep the navigation bar visible
            .navigationBarItems(
                leading: Button(action: {
                    isMenuActive.toggle()
                }) {
                    Image(systemName: "line.horizontal.3")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                },
                trailing: NavigationLink(destination: ProfileView(), isActive: $isProfileActive) {
                    Image(systemName: "person.circle")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                }
            )
        }
    }
}

struct InitialMenuActivationModifier: ViewModifier {
    @Binding var isMenuActive: Bool
    @State private var isFirstAppearance = true
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                // Delay the initial activation of the menu only on the first appearance
                if isFirstAppearance {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        isMenuActive = false
                        isFirstAppearance = false
                    }
                }
            }
    }
}



struct MenuView: View {
    @Binding var isMenuActive: Bool
    
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
           
            VStack(spacing: 20) {
                
                Text("Senaste nyheterna")
                Text("Sport")
                Text("Kultur")
                
                
                Button(action: {
                    isMenuActive = false
                }) {
                    Image(systemName: "xmark.circle")
                        .font(.title)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .padding(.top, 80)
                }
            }
            .font(.title)
            .padding()
        }
    }
}

struct NewsFeedView_Previews: PreviewProvider {
    static var previews: some View {
        NewsFeedView()
    }
}


