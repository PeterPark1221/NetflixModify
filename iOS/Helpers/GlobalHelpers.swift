//
//  GlobalHelpers.swift
//  CloneNetflix
//
//  Created by PeterPark on 2023/07/11.
//

import Foundation

let examplerMovie1 = Movie(
    id: UUID().uuidString,
    name: "DARK",
    thumbnailURL: URL(string: "https://picsum.photos/200/300")!,
    categories: ["Dysopian", "Eiciting", "Suspense ful", "Sci-Fi TV "],
    year: 2020, rating: "TV-MA",
    numberOfSeasons: 1,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creator: "Baran bo Odan, Jantje Frieses",
    cast: "Louis Hofmann, Oliver Masucci, jordis Triebel")
let examplerMovie2 = Movie(
    id: UUID().uuidString,
    name: "Travelers",
    thumbnailURL: URL(string: "https://picsum.photos/200/300/")!,
    categories: ["Dysopian", "Eiciting", "Suspense ful", "Sci-Fi TV "],
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 3,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creator: "Baran bo Odan, Jantje Frieses",
    cast: "Louis Hofmann, Oliver Masucci, jordis Triebel",
    promotionHeadline: "Best Rated Show")
let examplerMovie3 = Movie(
    id: UUID().uuidString,
    name: "Community",
    thumbnailURL: URL(string: "https://picsum.photos/200/301")!,
    categories: ["Dysopian", "Eiciting", "Suspense ful", "Sci-Fi TV "],
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 2,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creator: "Baran bo Odan, Jantje Frieses",
    cast: "Louis Hofmann, Oliver Masucci, jordis Triebel")
let examplerMovie4 = Movie(
    id: UUID().uuidString,
    name: "Alone",
    thumbnailURL: URL(string: "https://picsum.photos/200/302")!,
    categories: ["Dysopian", "Eiciting", "Suspense ful", "Sci-Fi TV "],
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 3,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creator: "Baran bo Odan, Jantje Frieses",
    cast: "Louis Hofmann, Oliver Masucci, jordis Triebel",
    promotionHeadline: "New episode coming soon!")
let examplerMovie5 = Movie(
    id: UUID().uuidString,
    name: "Hannibal",
    thumbnailURL: URL(string: "https://picsum.photos/200/303")!,
    categories: ["Dysopian", "Eiciting", "Suspense ful", "Sci-Fi TV "],
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 4,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creator: "Baran bo Odan, Jantje Frieses",
    cast: "Louis Hofmann, Oliver Masucci, jordis Triebel")
let examplerMovie6 = Movie(
    id: UUID().uuidString,
    name: "After Life",
    thumbnailURL: URL(string: "https://picsum.photos/200/304")!,
    categories: ["Dysopian", "Eiciting", "Suspense ful", "Sci-Fi TV "],
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 2,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creator: "Baran bo Odan, Jantje Frieses",
    cast: "Louis Hofmann, Oliver Masucci, jordis Triebel",
    promotionHeadline: "Watch Season 3 Now ")



let exampleMovies: [Movie] = [examplerMovie1, examplerMovie2, examplerMovie3, examplerMovie4, examplerMovie5, examplerMovie6]

let exampleEpisodeInfo1 = CurrentEpisodeInfo(episodename: "Beginnings and Endings", description: "Six months after the disappearances, the police form a task force. In 2052, Jonas learns that most of Winden perished in an apocalyptic event.", season: 2, episode: 1)
