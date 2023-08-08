//
//  CustomTabSwitcher.swift
//  CloneNetflix
//
//  Created by PeterPark on 2023/07/29.
//

import SwiftUI

struct CustomTabSwitcher: View {
    //@State는 말 그대로 현재 상태를 나타내는 속성으로써 뷰의 어떤 값을 저장하는데 사용
    @State private var currentTab: CustomTab = .episodes
    
    var tabs: [CustomTab]
    var movie: Movie
    
    @Binding var showSeasonPicker: Bool
    @Binding var selectedSeason: Int
    
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(tabs, id: \.self ) { tab in
                        VStack {
                            
                            //red Bar
                            Rectangle()
                                .frame( height: 6)
                                .foregroundColor(tab == currentTab ? Color.red : Color.clear) // tab이랑 currenttab이 같으면 빨간색이고, 다르면 색이없다
                            
                            
                            Button(action: {
                                currentTab = tab
                            }, label: {
                                Text(tab.rawValue)
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(tab == currentTab ? Color.white : Color.gray)
                            })
                            .buttonStyle(PlainButtonStyle())
                            .frame(height: 30)
                        }
                    }
                }
            }
            
            switch currentTab {
            case .episodes:
                EpisdoeView(episode: movie.episodes ?? [], showSeasonPicker: $showSeasonPicker, selectedSeason: $selectedSeason)
            case .trailers:
                TrailerList(trailers: movie.trailers)
            case .more:
                MoreLikeThis(movies: movie.moreLikeThisMovies)
            }
        }
        .foregroundColor(.white)
    }
}

//열거형로 CustomTab 구현
enum CustomTab: String {
    case episodes = "EPISODES"
    case trailers = "TRAILERS & MORE"
    case more = "MORE LIKE THIS"
}

struct CustomTabSwitcher_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            CustomTabSwitcher(tabs: [.episodes, .trailers, .more], movie: examplerMovie2, showSeasonPicker: .constant(false), selectedSeason: .constant(1))
        }
    }
}
