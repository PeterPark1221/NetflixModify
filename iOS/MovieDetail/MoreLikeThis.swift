//
//  MoreLikeThis.swift
//  CloneNetflix
//
//  Created by PeterPark on 2023/08/01.
//

import SwiftUI

struct MoreLikeThis: View {
    var movies: [Movie]
    
    let column = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: column) {
                ForEach(0..<movies.count) { index in
                    StandardHomeMovie(movie: movies[index])
                }
            }
        }
    }
}

struct MoreLikeThis_Previews: PreviewProvider   {
    static var previews: some View {
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            MoreLikeThis(movies: exampleMovies)
        }
    }
}
