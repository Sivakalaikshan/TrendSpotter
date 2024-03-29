//
//  ProductDetailsView.swift
//  TrendSpotter
//
//  Created by NIBMPC04PC03 on 2024-03-29.
//

import SwiftUI

struct ProductDetailsView: View {
    @State private var selectedButton: String?
    var body: some View {
        VStack{
            Image("odelshirt")
                .resizable()
                .scaledToFit()
                .frame(width: 350, height: 500) // Set the desired width and height for the larger image
                .cornerRadius(10)
                .padding()
            
            VStack(alignment: .leading) {
                Text("Rayon Printed Shirt")
                    .font(.title)
                    .padding(.bottom, 4)
                    .background(Color.white)
                
                Text("ODEL - Rs. 2500.00")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }.offset(x:-50)
            
            HStack(spacing: 20) {
                ForEach(["S", "M", "L", "XL", "XXL"], id: \.self) { title in
                    Button(action: {
                        selectedButton = title
                    }) {
                        Text(title)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 8)
                            .foregroundColor(selectedButton == title ? .white : .black)
                            .background(selectedButton == title ? Color.black : Color.white)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                    }
                }
            }
            .padding()
            
            Button(action: {
                
            }) {
                Text("Add Cart")
                    .padding()
                    .frame(width: 360)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .font(.headline)
                    .cornerRadius(10)
            }
            
            Spacer()

        }//end of top vstack
    }
}

#Preview {
    ProductDetailsView()
}
