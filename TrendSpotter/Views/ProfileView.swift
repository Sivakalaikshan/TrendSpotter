//
//  ProfileView.swift
//  TrendSpotter
//
//  Created by NIBM on 2024-03-17.
//

import SwiftUI

struct ProfileView: View {
    @State private var name: String = ""
    @State private var isDatePickerVisible = false
    @State private var selectedDate = Date()
    @State private var dateString: String = ""
    @State private var selectedGender = "Male"
        
        let genders = ["Male", "Female", "Other"]

    var body: some View {
        VStack{
            Text("Logout")
                .bold(true)
                .foregroundColor(.red)
                .padding(.leading,280)
            Circle()
                .foregroundColor(.gray)
                .frame(width: 200)
                .padding()
            
            ScrollView {
                VStack {
                   
                    VStack {
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
                    }.padding(.bottom,5)
                    
                   
                    
                    
                    VStack {
                        
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
                    }.padding(.bottom,5)
                    
                    
                    
                    VStack {
                        RoundedRectangle(cornerRadius: 15)
                                   .stroke(lineWidth: 0.5)
                                   .frame(width: 350, height: 50) // Adjusted width
                                   .padding(.horizontal, 48)
                                   .overlay {
                                       HStack {
                                           Spacer()
                                           Button(action: {
                                               isDatePickerVisible.toggle()
                                           }) {
                                               Text(dateString.isEmpty ? "Select a date" : dateString)
                                           }
                                           .padding()
                                           .foregroundColor(.black)
                                           Spacer()
                                       }
                                   }
                               if isDatePickerVisible {
                                   VStack {
                                       DatePicker("", selection: $selectedDate, displayedComponents: .date)
                                           .datePickerStyle(GraphicalDatePickerStyle())
                                           .labelsHidden()
                                           .frame(width: 200, height: 200) // Adjusted width and height
                                           .padding()
                                       Button("Done") {
                                           dateString = formatDate(selectedDate)
                                           isDatePickerVisible = false
                                       }
                                       .padding()
                                   }
                                   .background(Color.white)
                                   .cornerRadius(10)
                                   .shadow(radius: 5)
                                   .frame(maxWidth: .infinity, maxHeight: .infinity)
                                   .background(Color.black.opacity(0.4).ignoresSafeArea())
                               }
                    }.padding(.bottom,5)
                    
                    
                   
                    VStack{
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
                    }.padding(.bottom,5)
                    
                    
                    Button(action: {
                        
                    }) {
                        Text("Done")
                            .padding()
                            .frame(width: 350)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .font(.headline)
                            .cornerRadius(10)
                    }


                        
                    
                }
            }
        
            
                
                
            
                
            
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
