//
//  StandardHomeMovie.swift
//  CloneNetflix
//
//  Created by PeterPark on 2023/07/11.
//


import SwiftUI
import Kingfisher


struct StandardHomeMovie: View {
    var movie: Movie
    
    var body: some View {
        KFImage(movie.thumbnailURL)
            .resizable()
            .scaledToFill()
            
    }
}

struct StandardHomeMovie_Previews: PreviewProvider {
    static var previews: some View {
        StandardHomeMovie(movie: examplerMovie1)
    }
}
