//
//  NavigationBarView.swift
//  TrendSpotter
//
//  Created by NIBM on 2024-03-17.
//

import SwiftUI

struct NavigationBarView: View {
    @Binding var isTabViewHidden: Bool
    var body: some View {
        VStack {
                   if !isTabViewHidden {
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
        .navigationBarBackButtonHidden(true)
    
        
        
    }
    }
struct FirstView: View {
    var body: some View {
        HomeView()
    }
}

struct SecondView: View {
    var body: some View {
        ProductView( brand: "")
    }
}

struct ThirdView: View {
    var body: some View {
        CartView(productID: "")
    }
}

struct FourthView: View {
    var body: some View {
         ProfileView()
    }

}


#Preview {
    NavigationBarView(isTabViewHidden: .constant(false))
}


