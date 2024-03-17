//
//  ProfileView.swift
//  TrendSpotter
//
//  Created by NIBM on 2024-03-17.
//

import SwiftUI

struct ProfileView: View {
    @State private var name: String = ""
    @State private var selectedDate = Date()
        @State private var isDatePickerVisible = false
        @State private var dateString = ""

    var body: some View {
        VStack{
            Circle()
                .foregroundColor(.gray)
                .frame(width: 200)
                .padding()
            
            ScrollView {
                VStack {
                   
                        Text("User Name")
                            .padding()
                       
                    
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(lineWidth: 0.5)
                        .frame(width: 350, height: 50)
                        .padding(.horizontal, 48)
                        .overlay {
                            HStack {
                                TextField("Username", text: $name)
                            }
                            .padding(.horizontal, 56)
                        }
                    
                    
                        Text("Email Address")
                            .padding()
                        
                    
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(lineWidth: 0.5)
                        .frame(width: 350, height: 50)
                        .padding(.horizontal, 48)
                        .overlay {
                            HStack {
                                TextField("email", text: $name)
                            }
                            .padding(.horizontal, 56)
                        }
                    
                    
                        Text("Date Of Birth")
                            .padding()
                        Spacer()
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(lineWidth: 0.5)
                        .frame(width: 350, height: 50)
                        .padding(.horizontal, 48)
                        .overlay {
                            HStack {
                                TextField("Select a date", text: $dateString)
                                    .padding()
                                    .onTapGesture {
                                        isDatePickerVisible.toggle()
                                    }
                                if isDatePickerVisible {
                                    DatePicker("", selection: $selectedDate, displayedComponents: .date)
                                        .datePickerStyle(GraphicalDatePickerStyle())
                                        .labelsHidden()
                                        .frame(maxHeight: 400)
                                        .padding()
                                        .background(Color.white)
                                        .cornerRadius(10)
                                        .shadow(radius: 5)
                                        .onChange(of: selectedDate) { _ in
                                            dateString = formatDate(selectedDate)
                                            isDatePickerVisible = false
                                        }
                                }
                            }
                            .padding()
                            .padding(.horizontal, 56)
                        }
                    
                   
                        Text("Password")
                            .padding()
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(lineWidth: 0.5)
                        .frame(width: 350, height: 50)
                        .padding(.horizontal, 48)
                        .overlay {
                            HStack {
                                TextField("password", text: $name)
                            }
                            .padding(.horizontal, 56)
                        }
                }
            }
            .padding()
        
            
                
                
            
                
            
            Spacer()
        }//end of top vstack
    }
    
    func formatDate(_ date: Date) -> String {
           let formatter = DateFormatter()
           formatter.dateStyle = .medium
           return formatter.string(from: date)
       }
}

#Preview {
    ProfileView()
}
