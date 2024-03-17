//
//  NavigationBarView.swift
//  TrendSpotter
//
//  Created by NIBM on 2024-03-17.
//

import SwiftUI

struct NavigationBarView: View {
    var body: some View {
        TabView {
                   FirstView()
                       .tabItem {
                           Image(systemName: "house")
                           Text("Home")
                       }
                   SecondView()
                .tabItem {
                    Image(systemName: "suitcase")
                    Text("Products")
                }
                   ThirdView()
                       .tabItem {
                           Image(systemName: "cart")
                           Text("Cart")
                       }
                   FourthView()
                       
                       .tabItem {
                           Image(systemName: "person")
                           Text("Account")
                       }
                   
               }
               .tabViewStyle(DefaultTabViewStyle())
               .accentColor(.black)
               .edgesIgnoringSafeArea(.all)
    
        
        
    }
    }
struct FirstView: View {
    var body: some View {
        HomeView()
    }
}

struct SecondView: View {
    var body: some View {
        Text("second View")
    }
}

struct ThirdView: View {
    var body: some View {
        Text("Third View")
    }
}

struct FourthView: View {
    var body: some View {
         ProfileView()
    }

}

#Preview {
    NavigationBarView()
}
