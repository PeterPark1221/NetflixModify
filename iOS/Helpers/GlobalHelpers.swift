//
//  GlobalHelpers.swift
//  CloneNetflix
//
//  Created by PeterPark on 2023/07/11.
//

import Foundation

let exampleVideoURL = URL(string: "https://www.radiantmediaplayer.com/media/big-buck-bunny-360p.mp4")!

let exampleImageURL1 = URL(string: "https://picsum.photos/300/104")!
let exampleImageURL2 = URL(string: "https://picsum.photos/300/105")!
let exampleImageURL3 = URL(string: "https://picsum.photos/300/106")!

var randomExampleImageURL: URL {
    return [exampleImageURL1, exampleImageURL2, exampleImageURL3].randomElement() ?? exampleVideoURL
}

let exampleTrailer1 = Trailer(name: "Season 3 Trailer", videoURL: exampleVideoURL, thumbnailURL: exampleImageURL1)

let exampleTrailer2 = Trailer(name: "The Hero's Journey", videoURL: exampleVideoURL, thumbnailURL: exampleImageURL2)

let exampleTrailer3 = Trailer(name: "The Mysterious", videoURL: exampleVideoURL, thumbnailURL: exampleImageURL3)

let exampleTrailer = [exampleTrailer1, exampleTrailer2, exampleTrailer3]

let examplerMovie1 = Movie(
    id: UUID().uuidString,
    name: "DARK",
    thumbnailURL: URL(string: "https://picsum.photos/200/300")!,
    categories: ["Dysopian", "Eiciting", "Suspense ful", "Sci-Fi TV "],
    year: 2020, rating: "TV-MA",
    numberOfSeasons: 1,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creator: "Baran bo Odan, Jantje Frieses",
    cast: "Louis Hofmann, Oliver Masucci, jordis Triebel",
    moreLikeThisMovies: [examplerMovie2, examplerMovie3, examplerMovie4, examplerMovie5, examplerMovie6, examplerMovie7], trailers: exampleTrailer)
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
    moreLikeThisMovies: [],
    promotionHeadline: "Best Rated Show", trailers: exampleTrailer)
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
    cast: "Louis Hofmann, Oliver Masucci, jordis Triebel",
    moreLikeThisMovies: [], trailers: exampleTrailer)
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
    moreLikeThisMovies: [],
    promotionHeadline: "New episode coming soon!", trailers: exampleTrailer)
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
    cast: "Louis Hofmann, Oliver Masucci, jordis Triebel",
    moreLikeThisMovies: [], trailers: exampleTrailer)
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
    moreLikeThisMovies: [],
    promotionHeadline: "Watch Season 3 Now ", trailers: exampleTrailer)
let examplerMovie7 = Movie(
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
    moreLikeThisMovies: [],
    promotionHeadline: "Watch Season 3 Now ", trailers: exampleTrailer)



var exampleMovies: [Movie] {
    return [examplerMovie1, examplerMovie2, examplerMovie3, examplerMovie4, examplerMovie5, examplerMovie6].shuffled()
}

let exampleEpisodeInfo1 = CurrentEpisodeInfo(episodename: "Beginnings and Endings", description: "Six months after the disappearances, the police form a task force. In 2052, Jonas learns that most of Winden perished in an apocalyptic event.", season: 2, episode: 1)
