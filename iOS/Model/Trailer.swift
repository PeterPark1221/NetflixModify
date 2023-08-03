//
//  Trailer.swift
//  CloneNetflix
//
//  Created by PeterPark on 2023/08/02.
//

import Foundation

struct Trailer: Identifiable, Hashable{
    var id: String = UUID().uuidString
    var name: String
    var videoURL: URL
    var thumbnailURL: URL
}
