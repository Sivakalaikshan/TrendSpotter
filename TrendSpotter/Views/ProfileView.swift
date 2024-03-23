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
                        Text("User Name")
                            .padding(.trailing,250)
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
                        Text("Email Address")
                            .padding(.trailing,230)
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
                        Text("Date Of Birth")
                            .padding(.trailing,240)
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
                                .padding(.horizontal, 56)
                            }
                    }.padding(.bottom,5)
                    
                    
                   
                    VStack{
                        Text("Password")
                            .padding(.trailing,260)
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
