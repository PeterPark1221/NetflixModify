//
//  HomeVM.swift
//  CloneNetflix
//
//  Created by PeterPark on 2023/07/12.
//

import Foundation

/*ObservableObject는 프로토콜이며, 관찰 가능한 객체를 나타냄. 이 프로토콜을 채택한 클래스 또는 구조체의 속성이 변경되면, SwiftUI는 이를 감지하고 관련된 뷰를 자동으로 업데이트함*/
class HomeVM: ObservableObject {
    
    //string == Category
    @Published var movies: [String: [Movie]] = [:]
    
    public var allCategories: [String] {
        return movies.keys.map({ String($0) })
    }
    
    public func getMovie(forCat cat: String) -> [Movie] {
        return movies[cat] ?? []
    }
    
    init() {
        setupMovies()
    }
    
    func setupMovies() {
        movies["Trending Now"] = exampleMovies
        movies["Stand-Up comedy"] = exampleMovies.shuffled()
        movies["New Releases"] = exampleMovies.shuffled()
        movies["Watch It Again"] = exampleMovies.shuffled()
        movies["Sci"] = exampleMovies.shuffled()
        
    }
}
