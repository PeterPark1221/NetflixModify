//
//  Movie.swift
//  CloneNetflix
//
//  Created by PeterPark on 2023/07/11.
//

import Foundation

//Identifiable 프로토콜은 구조체 또는 클래스가 고유한 식별자(identifier)를 가지도록 요구하는 프로토콜임. Identifer 이를 활용하여 간단하게 일치 여부를 확인하거나 리스트에서 해당 요소를 선택하는 등의 작업을 수행할 수 있습니다.
struct Movie: Identifiable {
    var id: String
    var name: String
    var thumbnailURL: URL
    
    var categories: [String]
    var genre: HomeGenre = .AllGenres
    
    //movieDetail
    var year: Int
    var rating: String
    var numberOfSeasons: Int?
    
    var currentEpisode: CurrentEpisodeInfo?
    
    
    var defaultEpisodeInfo: CurrentEpisodeInfo
    var creator: String
    var cast: String
    
    var moreLikeThisMovies: [Movie]
    
    var episodes: [Episode]?
    
    var movieType: MovieType {
        return episodes == nil ? .movie : .tvShow
    }
    
    var promotionHeadline: String?
    //if let는 옵셔널을 안전하게 추출하게 해줌 -> unwrapping
    //값이 있을 경우 상수let에 할당된 값을 출력하면서 옵셔널이 벗겨짐
    
    var trailers: [Trailer]
    
    var numberOfSeasonsDisplay: String {
        if let num = numberOfSeasons {
            if num == 1 {
                return "1 seasons"
            } else {
                return "\(num) seasons"
            }
        }
        return ""
    }
    
    
    var episodeInfoDisplay : String {
        if let current = currentEpisode {
            return "S\(current.season):E\(current.episode) \(current.episodename)"
        } else {
            return "S\(defaultEpisodeInfo.season):E\(defaultEpisodeInfo.episode) \(defaultEpisodeInfo.episodename)"
        }
    }
    
    
    var episodeDescriptionDisplay: String {
        if let current = currentEpisode {
            return current.description
        } else {
            return defaultEpisodeInfo.description
        }
    }
}



struct CurrentEpisodeInfo: Hashable, Equatable {
    var episodename: String
    var description: String
    var season: Int
    var episode: Int
}


enum MovieType {
    case movie
    case tvShow
}
