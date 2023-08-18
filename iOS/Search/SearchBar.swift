//
//  SearchBar.swift
//  CloneNetflix
//
//  Created by PeterPark on 2023/08/18.
//

import SwiftUI

struct SearchBar: View {
    
    @State private var text : String =  ""
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color("gray_search_text"))
                .padding(.leading, 10 )
            
            TextField("Search", text: $text)
                .background(Color("gray_search_background"))
                .cornerRadius(8)
                .foregroundColor(.white)
        }
        
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
           Color.black
                .ignoresSafeArea(.all)
            
            SearchBar()
        }
    }
}
