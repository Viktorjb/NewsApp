//
//  NewsFeedView.swift
//  NewsApp
//
//  Created by David Salmberg on 2023-05-15.
//

import SwiftUI

struct NewsFeedView: View {
    @StateObject var viewModel = NewsFeedViewModel()
    
    var body: some View {
        ScrollView {
            //Hämta alla artiklar
        }
    }
}

struct NewsFeedView_Previews: PreviewProvider {
    static var previews: some View {
        NewsFeedView()
    }
}
