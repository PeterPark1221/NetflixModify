//
//  Movie.swift
//  CloneNetflix
//
//  Created by PeterPark on 2023/07/11.
//

import Foundation

//Identifiable 프로토콜은 구조체 또는 클래스가 고유한 식별자(identifier)를 가지도록 요구하는 프로토콜입니다. Identifer 이를 활용하여 간단하게 일치 여부를 확인하거나 리스트에서 해당 요소를 선택하는 등의 작업을 수행할 수 있습니다.
struct Movie: Identifiable {
    var id: String
    var name: String
    var thumbnailURL: URL
    
    var categories: [String]
}
