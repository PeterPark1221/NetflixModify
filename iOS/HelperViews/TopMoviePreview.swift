//
//  TopMoviereview.swift
//  CloneNetflix
//
//  Created by PeterPark on 2023/07/16.
//

import SwiftUI
import Kingfisher

struct TopMoviePreview: View {
    
    var movie: Movie
    
    func isCategoryLast(_ cat: String) -> Bool {
        let catCount = movie.categories.count
        
        if let index = movie.categories.firstIndex(of: cat) {
            if index + 1 != catCount {
                return false
            }
        }
        
        return true
    }
    
    var body: some View {
        ZStack {
            KFImage(movie.thumbnailURL)
                .resizable()
                .scaledToFill()
                .clipped()
            
            VStack {
                Spacer()
                
                HStack {
                    ForEach(movie.categories, id: \.self) { category in
                        HStack {
                            Text(category)
                                .font(.footnote)
                            
                            if !isCategoryLast(category) {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 3))
                            }
                        }
                    }
                }
                
                HStack {
                    Spacer()
                    
                    SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: true)
                    
                    Spacer()
                    
                    PlayButton(text: "Play", imageName: "play.fill")
                        .frame(width: 120)
                    
                    Spacer()
                    
                    SmallVerticalButton(text: "Info", isOnImage: "info.circle", isOffImage: "info.circle", isOn: true)
                    
                    Spacer()
                }
            }//그라운데이션를 통해 배경화면을 점점 내려갈수록 어둡게 설정
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.black.opacity(0.0), Color.black.opacity(0.95)]),
                    startPoint: .top,
                    endPoint: .bottom)
            )
            .padding(.top, 200)
        }
        .foregroundColor(.white )
    }
}

struct TopMoviePreview_Previews: PreviewProvider {
    static var previews: some View {
        TopMoviePreview(movie: examplerMovie1)
    }
}
