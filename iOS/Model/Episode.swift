//
//  Episode.swift
//  CloneNetflix
//
//  Created by PeterPark on 2023/07/28.
//

import Foundation

struct Episode: Identifiable {
    var id = UUID().uuidString
    
    var name: String
    var season: Int
    var thumbnailImageURLString: String
    var description: String
    var length: Int
    
    var thumbnailURL: URL {
        return URL(string: thumbnailImageURLString)! 
    }
}
