//
//  HomeView.swift
//  CloneNetflix
//
//  Created by PeterPark on 2023/07/11.
//

import SwiftUI

struct HomeView: View {
    var vm: HomeVM = HomeVM()
    
    let screen = UIScreen.main.bounds
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea(.all)
            
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    
                    //넷플릭스 로고 및 tvshow, moives, mylist버튼
                    TopRowButtons()
                        
                    
                    //가장자리에 있는 영화
                    TopMoviePreview(movie: examplerMovie1)
                        .frame(width: screen.width)
                        .padding(.top, -110)
                        .zIndex(-1) //위에 padding때문에 logo가 안 보여줌 그래서 zindex를 통해 뷰를 뒤에다 배치
                    
                    //카테고리별 영화뷰
                    ForEach(vm.allCategories, id: \.self) { category in
                        VStack {
                            HStack {
                                Text(category)
                                    .font(.title3)
                                    .bold()
                                Spacer()
                            }
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(vm.getMovie(forCat: category )) { movie in
                                        StandardHomeMovie(movie: movie)
                                            .frame(width: 100, height: 200)
                                            .padding(.horizontal, 20)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        .foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct TopRowButtons: View {
    var body: some View {
        HStack {
            Button(action: {
                //
            }, label: {
                Image("netflix_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
            })
            .buttonStyle(PlainButtonStyle())
            
            Spacer()
            
            Button(action: {
                //
            }, label: {
                Text("TV Shows")
            })
            .buttonStyle(PlainButtonStyle())
            
            Spacer()
            
            Button(action: {
                //
            }, label: {
                Text("Moives")
            })
            .buttonStyle(PlainButtonStyle())
            
            Spacer()
            
            Button(action: {
                //
            }, label: {
                Text("My List")
            })
            .buttonStyle(PlainButtonStyle())
            
            Spacer()
        }
        .padding(.leading, 10)
        .padding(.trailing, 30)
    }
}
