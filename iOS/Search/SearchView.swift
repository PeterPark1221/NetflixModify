//
//  SearchView.swift
//  CloneNetflix
//
//  Created by PeterPark on 2023/08/20.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var vm = SearchVM()
    
    @State private var searchText = ""
    
    @State private var movieDetailToShow: Movie? = nil
    
    var body: some View {
        
        let searchTextBinding = Binding {
            return searchText
        } set: {
            searchText = $0
            vm.updateSearchText(with: $0)
        }
        
        return ZStack {
            Color.black
                .ignoresSafeArea(.all)
            
            VStack {
                SearchBar(text: searchTextBinding, isLoading: $vm.isLoading)
                    .padding()
                
                ScrollView {
                    if vm.isShowingPopularMovies {
                        PopularList(movies: vm.popularMovies, movieDetailToShow: $movieDetailToShow)
                    }
                    
                    if vm.viewState == .empty {
                        Text("Your search did not have any result")
                            .bold()
                            .padding(.top, 150)
                    } else if vm.viewState == .ready && !vm.isShowingPopularMovies {
                        VStack {
                            HStack {
                                Text("Movie & TV")
                                    .bold()
                                    .font(.title3)
                                    .padding(.leading, 12)
                                
                                Spacer()
                            }
                            
                            SearchResultGrid(movie: vm.searchResult, movieDetailToShow: $movieDetailToShow)
                        }
                    }
                }
                
                Spacer()
            }
            
            if movieDetailToShow != nil {
                MovieDetail(movie: movieDetailToShow!, moveDetailToShow: $movieDetailToShow)
            }
        }
        .foregroundColor(.white)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

struct PopularList: View {
    var movies: [Movie]
    
    @Binding var movieDetailToShow: Movie?
    
    var body: some View {
        VStack {
            HStack {
                Text("Popular Movies")
                    .bold()
                    .font(.title3)
                Spacer()
            }
            
            LazyVStack {
                ForEach(movies, id: \.id) { movie in
                    PopularMovieView(movie: movie, movieDetailToShow: $movieDetailToShow)
                        .frame(height: 75)
                }
            }
        }
    }
}
