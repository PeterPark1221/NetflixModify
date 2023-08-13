//
//  HomeVM.swift
//  CloneNetflix
//
//  Created by PeterPark on 2023/07/12.
//

import Foundation

/*ObservableObject는 프로토콜이며, 관찰 가능한 객체를 나타냄. 이 프로토콜을 채택한 클래스 또는 구조체의 속성이 변경되면, SwiftUI는 이를 감지하고 관련된 뷰를 자동으로 업데이트함*/
/* swiftUI에서 데이터를 관찰 가능한 상태로 만들기 위해 사용되는 프로토콜임.
   이 프로토콜을 클래스에 채택하면 해당 클래스의 객체는 SwiftUI 뷰에 연결될 수 있으며,
   내부의 데이터 변경이 자동으로 뷰에 반영됨.
 */
class HomeVM: ObservableObject {
    
    //string == Category
    //데이터의 상태 변화를 감지하고 뷰에 반영하는 데 도움이 됩.
    @Published var movies: [String: [Movie]] = [:]
    
    //allCategories는 movies딕셔너리의 모든 키값을 문자열로 반환하고 새로운 배열에 넣는 연산 프로퍼티임.
    public var allCategories: [String] {
        return movies.keys.map({ String($0) })
    }
    
    public var allGenre: [HomeGenre] = [.AllGenres, .Action, .Comedy, .Horror, .Thriller]
    
    public func getMovie(forCat cat: String, andHomeRow homeRow: HomeTopRow, andGenre genre: HomeGenre) -> [Movie] {
        switch homeRow {
        case .home:
            return movies[cat] ?? []
        case .movies:
            return (movies[cat] ?? []).filter({ ($0.movieType == .movie) && ($0.genre == genre) })
        case .tvShows:
            return (movies[cat] ?? []).filter({ ($0.movieType == .tvShow) && ($0.genre == genre)})
        case .myList:
            return movies[cat] ?? []
        }
    }
    
    //생성자 메소드 클래스의 인스턴스가 생성될 때 자동으로 호출 그래서 setupMovies를 호출하게 된다
    init() {
        setupMovies()
    }
    
    func setupMovies() {
        //shuffled()는 배열를 무작위로 짜서 새로운 배열를 생성함
        movies["Trending Now"] = exampleMovies
        movies["Stand-Up comedy"] = exampleMovies.shuffled()
        movies["New Releases"] = exampleMovies.shuffled()
        movies["Watch It Again"] = exampleMovies.shuffled()
        movies["Sci"] = exampleMovies.shuffled()
        
    }
}
