//
//  ContentView.swift
//  CloneNetflix
//
//  Created by PeterPark on 2023/07/11.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        //탭바를 반투명하게 설정하는 것
        UITabBar.appearance().isTranslucent = true
        
        //탭바 색상변경
        UITabBar.appearance().barTintColor = UIColor.black
    }
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }.tag(0)
            
           SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Seach")
                }.tag(1)
            
            CommingSoon()
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("Coming soon")
                }.tag(2)
            
            Text("Downloads")
                .tabItem {
                    Image(systemName: "arrow.down.to.line.alt")
                    Text("Download")
                }.tag(3)
            
            Text("More")
                .tabItem {
                    Image(systemName: "line.3.horizontal")
                    Text("More")
                }.tag(4)
        }
        .accentColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
