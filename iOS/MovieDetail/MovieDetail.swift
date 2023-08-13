//
//  MovieDetail.swift
//  CloneNetflix
//
//  Created by PeterPark on 2023/07/28.
//

import SwiftUI

struct MovieDetail: View {
    var movie: Movie
    
    let screen = UIScreen.main.bounds
    
    @State private var showSeasonPicker = false
    @State private var selectedSeason = 1
    
    @Binding var moveDetailToShow: Movie?
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        moveDetailToShow = nil
                    }, label: {
                        Image(systemName: "xmark.circle")
                            .font(.system(size: 28))
                    })
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.horizontal, 22)
                
                //가로로 된 스크롤 뷰, 스크롤 바를 false하는 것
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        //episode 이미지
                        StandardHomeMovie(movie: movie)
                            .frame(width: screen.width / 2.5)
                        
                        //좋아요 버튼, 상영년도, rated, 시즌 횟수
                        MovieInfoSubheadline(movie: movie)
                        
                        //promotion를 뷰에 나오게 하는 것, 옵셔널 값이기에 없으면 출력 안함
                        if movie.promotionHeadline != nil {
                            Text(movie.promotionHeadline!)
                                .bold()
                                .font(.headline)
                        }
                        
                        PlayButton(text: "Play", imageName: "play.fill", backgroundColor: .red)
                        
                        //current episode
                        CurrentEpisodeInformation(movie: movie)
                        
                        CastInfo(movie: movie)
                        
                        
                        //리스트추가버튼, 좋아요버튼, 공유버튼
                        HStack(spacing: 30) {
                            SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: true)
                            
                            SmallVerticalButton(text: "Rate", isOnImage: "hand.thumbsup.fill", isOffImage: "hand.thumbsup", isOn: false )
                            
                            SmallVerticalButton(text: "Share", isOnImage: "paperplane", isOffImage: "paperplane", isOn: true)
                            
                            //SmallVerticalButton(text: "Comment", isOnImage: "bubble.right", isOffImage: "bubble.right", isOn: true)
                            
                            Spacer()
                        }
                        .padding(.leading, 20)
                        
                        CustomTabSwitcher (tabs: [.episodes, .trailers, .more], movie: movie, showSeasonPicker: $showSeasonPicker, selectedSeason: $selectedSeason)
                        
                    }
                    .padding(.horizontal, 10)
                }
                
                Spacer()
                
            }
            .foregroundColor(.white)
            
            if showSeasonPicker {
                Group {
                    Color.black.opacity(0.9)
                    
                    VStack(spacing: 40) {
                        Spacer()
                        
                        ForEach(0..<(movie.numberOfSeasons ?? 0)) { season in
                            Button(action: {
                                self.selectedSeason = season + 1
                                self.showSeasonPicker = false
                            }, label: {
                                Text("Season \(season + 1)")
                                    .foregroundColor(selectedSeason == season + 1 ? .white : .gray)
                                    .bold()
                                    .font(selectedSeason == season + 1 ? .title : .title2)
                            })
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            self.showSeasonPicker = false
                        }, label: {
                            Image(systemName: "x.circle.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 40))
                                .scaleEffect(x: 1.1)
                        })
                        .padding(.bottom, 30)
                    }
                }
                .ignoresSafeArea(.all)
            }
        }
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: examplerMovie1, moveDetailToShow: .constant(nil))
    }
}

struct MovieInfoSubheadline: View {
    var movie: Movie
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "hand.thumbsup.fill")
                .foregroundColor(.white)
            
            Text(String(movie.year))
            
            RatingView(rating: movie.rating)
            
            Text(movie.numberOfSeasonsDisplay)
        }
        .foregroundColor(.gray)
        .padding(.vertical, 6)
    }
}

struct RatingView: View {
    var rating: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
            
            Text(rating)
                .foregroundColor(.white)
                .font(.system(size: 12))
                .bold()
        }
        .frame(width: 50, height:20)
    }
}

struct CastInfo: View {
    var movie: Movie
    
    var body: some View {
        VStack(spacing: 3) {
            HStack {
                Text("Cast: \(movie.cast)")
                
                Spacer()
            }
            
            HStack {
                Text("Creator: \(movie.creator)")
                
                Spacer()
            }
        }
        .font(.caption)
        .foregroundColor(.gray)
        .padding(.vertical, 10)
    }
}

struct CurrentEpisodeInformation: View {
    var movie: Movie
    
    var body: some View {
        Group {
            HStack {
                Text(movie.episodeInfoDisplay)
                    .bold()
                
                Spacer()
            }
            .padding(.vertical, 4)
            
            HStack {
                Text(movie.episodeDescriptionDisplay)
                    .font(.subheadline)
                
                Spacer()
            }
        }
    }
}
