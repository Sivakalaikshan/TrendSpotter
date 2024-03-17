//
//  HomeView.swift
//  TrendSpotter
//
//  Created by NIBM on 2024-03-17.
//

import SwiftUI


struct HomeView: View {
  
    
    @State private var search: String = ""
    @State private var currentIndex = 0
       @State private var timer: Timer?
       let images = ["kids", "women", "men"]
       //let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            
            HStack {
                Text("CHOOSE YOUR BEST TRENDS \nBEST DRESSES")
                            .foregroundColor(.black)
                Image(systemName: "cart")
                    .foregroundColor(.gray)
                    .padding(.leading, 70) // Adjust the padding as needed
                Spacer()
            }
            .padding()

            RoundedRectangle(cornerRadius: 25)
                .stroke(lineWidth: 0.5)
                .frame(width: 350, height: 50)
                .padding(.horizontal, 48)
                .overlay {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("search", text: $search)
                    
                    }
                    .padding(.horizontal, 56)
                }

            
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
                                        }) {
                                            Text("See More")
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
                                        }) {
                                            Text("See More")
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
                                        }) {
                                            Text("See More")
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
                                            // Add action here
                                        }) {
                                            Text("See More")
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
                                        }) {
                                            Text("See More")
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
                    
                }
                .padding()
                
                
                
            }

            

          


            
           Spacer()
            
        }// this is end of top vstack
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
