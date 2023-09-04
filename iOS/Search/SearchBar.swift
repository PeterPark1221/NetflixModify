//
//  SearchBar.swift
//  CloneNetflix
//
//  Created by PeterPark on 2023/08/18.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    
    @State private var isEditing = true
    
    @Binding var isLoading: Bool
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color("gray_search_background")
                .frame(width: 270, height: 36)
                .cornerRadius(8)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color("gray_search_text"))
                    .padding(.leading, 10)
                
                TextField("Search", text: $text)
                    .padding(7)
                    .padding(.leading, -7)
                    .padding(.horizontal, 10)
                    .background(Color("gray_search_background"))
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .onTapGesture(perform: {
                        isEditing = true
                    })
                    .animation(.default)
                
                if !text.isEmpty {
                    if isLoading {
                        Button(action: {
                            text = ""
                        }, label: {
                            ActivityIndicator(style: .medium, animate: .constant(true))
                                .configure {
                                    $0.color = .white
                                }
                        })
                        .padding(.trailing, 32)
                        .frame(width: 35, height: 35)
                    } else {
                        Button(action: {
                            text = ""
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(Color("gray_search_text"))
                                .frame(width: 35, height: 35)
                        })
                        .padding(.trailing, 18)
                    }
                }
                
                if isEditing {
                    Button(action: {
                        text = ""
                        isEditing = false
                    }, label: {
                        Text("Cancel")
                            .foregroundColor(.white)
                    })
                    .padding(.trailing, 18)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
                }
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
           Color.black
                .ignoresSafeArea(.all)
            
            SearchBar(text: .constant(""), isLoading: .constant(true))
                .padding()
        }
    }
}
