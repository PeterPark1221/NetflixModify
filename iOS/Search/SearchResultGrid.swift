//
//  SearchResultGrid.swift
//  CloneNetflix
//
//  Created by PeterPark on 2023/08/21.
//

import SwiftUI

struct SearchResultGrid: View {
    var movie: [Movie]
    
    @Binding var movieDetailToShow: Movie?
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(movie, id: \.id) { movie in
                StandardHomeMovie(movie: movie)
                    .frame(height: 160)
                    .onTapGesture(perform: {
                        movieDetailToShow = movie
                    })
            }
        }
    }
}

struct SearchResultGrid_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultGrid(movie: generateMovies(20), movieDetailToShow: .constant(nil))
    }
}
