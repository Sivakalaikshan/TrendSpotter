//
//  HomeView.swift
//  TrendSpotter
//
//  Created by NIBM on 2024-03-17.
//

import SwiftUI


struct HomeView: View {
  
    
    @State private var isActive = false
    @State private var currentIndex = 0
       @State private var timer: Timer?
    @StateObject var navigationManager = NavigationManager.shared
       let images = ["kids", "women", "men"]
       //let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    @State private var selectedBrand: String = ""
    

    var body: some View {
        NavigationView{
        VStack {
            
            HStack {
                Text("CHOOSE YOUR BEST TRENDS \nBEST DRESSES")
                    .foregroundColor(.black)
                
                Spacer()
            }
            .padding()
            
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                ScrollViewReader { scrollViewProxy in
                    HStack(spacing: 0) {
                        ForEach(images.indices, id: \.self) { index in
                            Image(images[index])
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIScreen.main.bounds.width)
                            
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width * CGFloat(images.count), alignment: .leading)
                    .onAppear {
                        startTimer(with: scrollViewProxy)
                    }
                    .onDisappear {
                        stopTimer()
                    }
                }
            }
            .padding()
            
            
            ScrollView {
                VStack(spacing: 20) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(width: 350, height: 150)
                            .foregroundColor(.white)
                            .shadow(radius: 10)
                            .overlay(
                                VStack {
                                    Text("Explore the new crocodile Items")
                                        .foregroundColor(.black)
                                        .font(.headline)
                                        .padding()
                                        .background(Color.white.opacity(0.7))
                                        .cornerRadius(10)
                                    
                                    HStack {
                                        Image("crocodile")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 150, height: 50)
                                            .padding()
                                        
                                        Button(action: {
                                            // Add action here
                                            selectedBrand = "Crocodile"
                                            isActive = true
                                        }) {
                                            Text("See More >")
                                                .bold()
                                                .font(.system(size: 11))
                                                .frame(width: 70, height: 5)
                                                .foregroundColor(.black)
                                                .padding()
                                                .background(Color.white)
                                                .cornerRadius(30)
                                                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2)
                                        }
                                    }
                                }
                                    .padding()
                            )
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(width: 350, height: 150)
                            .foregroundColor(.white)
                            .shadow(radius: 10)
                            .overlay(
                                VStack {
                                    Text("Explore the new ODEL Items")
                                        .foregroundColor(.black)
                                        .font(.headline)
                                        .padding()
                                        .background(Color.white.opacity(0.7))
                                        .cornerRadius(10)
                                    
                                    HStack {
                                        Image("odel")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 150, height: 50)
                                            .padding()
                                        
                                        Button(action: {
                                            // Add action here
                                            selectedBrand = "ODEL"
                                            isActive = true
                                        }) {
                                            Text("See More >")
                                                .bold()
                                                .font(.system(size: 11))
                                                .frame(width: 70, height: 5)
                                                .foregroundColor(.black)
                                                .padding()
                                                .background(Color.white)
                                                .cornerRadius(30)
                                                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2)
                                        }
                                        
                                    }
                                    
                                }
                                    .padding()
                            )
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(width: 350, height: 150)
                            .foregroundColor(.white)
                            .shadow(radius: 10)
                            .overlay(
                                VStack {
                                    Text("Explore the new Levis Items")
                                        .foregroundColor(.black)
                                        .font(.headline)
                                        .padding()
                                        .background(Color.white.opacity(0.7))
                                        .cornerRadius(10)
                                    
                                    HStack {
                                        Image("levis")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 150, height: 50)
                                            .padding()
                                        
                                        Button(action: {
                                            // Add action here
                                            selectedBrand = "levis"
                                            isActive = true
                                        }) {
                                            Text("See More >")
                                                .bold()
                                                .font(.system(size: 11))
                                                .frame(width: 70, height: 5)
                                                .foregroundColor(.black)
                                                .padding()
                                                .background(Color.white)
                                                .cornerRadius(30)
                                                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2)
                                        }
                                    }
                                }
                                    .padding()
                            )
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(width: 350, height: 150)
                            .foregroundColor(.white)
                            .shadow(radius: 10)
                            .overlay(
                                VStack {
                                    Text("Explore the new Boss Items")
                                        .foregroundColor(.black)
                                        .font(.headline)
                                        .padding()
                                        .background(Color.white.opacity(0.7))
                                        .cornerRadius(10)
                                    
                                    HStack {
                                        Image("boss")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 150, height: 50)
                                            .padding()
                                        
                                        Button(action: {
                                            selectedBrand = "Boss"
                                            isActive = true
                                        }) {
                                            Text("See More >")
                                                .bold()
                                                .font(.system(size: 11))
                                                .frame(width: 70, height: 5)
                                                .foregroundColor(.black)
                                                .padding()
                                                .background(Color.white)
                                                .cornerRadius(30)
                                                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2)
                                        }
                                    }
                                }
                                    .padding()
                            )
                    }
                    
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(width: 350, height: 150)
                            .foregroundColor(.white)
                            .shadow(radius: 10)
                            .overlay(
                                VStack {
                                    Text("Explore the new Nike Items")
                                        .foregroundColor(.black)
                                        .font(.headline)
                                        .padding()
                                        .background(Color.white.opacity(0.7))
                                        .cornerRadius(10)
                                    
                                    HStack {
                                        Image("nike")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 150, height: 50)
                                            .padding()
                                        
                                        Button(action: {
                                            // Add action here
                                            selectedBrand = "Nike"
                                            isActive = true
                                        }) {
                                            Text("See More >")
                                                .bold()
                                                .font(.system(size: 11))
                                                .frame(width: 70, height: 5)
                                                .foregroundColor(.black)
                                                .padding()
                                                .background(Color.white)
                                                .cornerRadius(30)
                                                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2)
                                        }
                                    }
                                }
                                    .padding()
                            )
                    }
                    .background(NavigationLink(destination: BrandView(brand: selectedBrand), isActive: $isActive) {
                        EmptyView()
                    })
                    .hidden()
                    
                   
                    
                  
                    
                    
                }
                .padding()
                .navigationBarBackButtonHidden(true)
                
                
                
            }
            
            
            
            
            
            
            
            Spacer()
            
        }// this is end of top vstack
    }
        .navigationBarBackButtonHidden(true)
    }
    
  
   
    private func startTimer(with scrollViewProxy: ScrollViewProxy) {
            timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
                withAnimation {
                    currentIndex = (currentIndex + 1) % images.count
                    scrollViewProxy.scrollTo(currentIndex, anchor: .center)
                }
            }
        }

        private func stopTimer() {
            timer?.invalidate()
            timer = nil
        }
}

#Preview {
    HomeView()
}
