//
//  ComingSoonVM.swift
//  CloneNetflix
//
//  Created by PeterPark on 2023/08/24.
//

import Foundation

class ComingSoonVM: ObservableObject {
    @Published var movies: [Movie] = []
    
    init() {
        self.movies = generateMovies(20)
    }
}
