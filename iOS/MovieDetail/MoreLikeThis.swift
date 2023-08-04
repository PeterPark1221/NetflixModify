//
//  MoreLikeThis.swift
//  CloneNetflix
//
//  Created by PeterPark on 2023/08/01.
//

import SwiftUI

struct MoreLikeThis: View {
    //프리뷰에 하나만 나타내고싶으면 그냥 Movie, 여러개의 구현된 거를 띄우고 싶으면 [Movie]
    var movies: [Movie]
    
    let column = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: column) {
                //exapmlermovie1~7여서 0~6 총 6개
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
