//
//  SpalshView.swift
//  TrendSpotter
//
//  Created by NIBMPC04PC03 on 2024-03-31.
//

import SwiftUI

struct SpalshView: View {
    @State private var isActive = false
    var body: some View {
        VStack {
                   Image("logo")
                       .padding()
               }
               .onAppear {
                   DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                       self.isActive = true
                   }
               }
               .background(NavigationLink("", destination: NavigationBarView(isTabViewHidden: .constant(false)), isActive: $isActive))
               .navigationBarHidden(true)
           }
       }
#Preview {
    SpalshView()
}
