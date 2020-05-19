//
//  AppView.swift
//  Instagram
//
//  Created by Dinesh Kachhot on 18/05/20.
//  Copyright © 2020 Dinesh Kachhot. All rights reserved.
//

import SwiftUI

struct AppView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "house")
                    .font(.title)
//                    Text("Home")
            }
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                        .font(.title)
//                    Text("Search")
            }
            
            NewPostView()
                .tabItem {
                    Image(systemName: "plus.square")
                        .font(.title)
                    
            }
            
            ActivityView()
                .tabItem {
                    Image(systemName: "heart")
                        .font(.title)
                    
            }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                        .font(.title)
                    
            }
        }.accentColor(colorScheme == .dark ? .white : .black)
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView().environment(\.colorScheme, .dark)
    }
}
