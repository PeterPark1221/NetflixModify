//
//  SearchVM.swift
//  CloneNetflix
//
//  Created by PeterPark on 2023/08/20.
//

import Foundation
import SwiftUI


class SearchVM : ObservableObject  {
    
    @Published var isLoading: Bool = true
    
    @Published var viewState: ViewState = .ready
    
    @Published var popularMovies: [Movie] = []
    @Published var searchResult: [Movie] = []
    
    @Published var isShowingPopularMovies = true
    
    
    init() {
        getpopularMovies()
    }
    
    public func updateSearchText(with text: String) {
        setViewState(to: .loading)
        
        
        if text.count > 0 {
            isShowingPopularMovies = false
            getSearchResult(forText: text)
        } else {
            isShowingPopularMovies = true
        }
        
        getSearchResult(forText: text )
    }
    
    private func getpopularMovies() {
        self.popularMovies = generateMovies(40)
    }
    
    private func getSearchResult(forText text: String) {
        let haveResult = Int.random(in: 0...3)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            if haveResult == 0 {
                self.searchResult = []
                self.setViewState(to: .empty)
            } else {
                let movies = generateMovies(21)
                self.searchResult = movies
                self.setViewState(to: .ready)
            }
        }
    }
    
    public func setViewState(to state: ViewState) {
        DispatchQueue.main.async {
            self.viewState = state
            
            self.isLoading = state == .loading
        }
    }
}

enum ViewState {
    case empty
    case loading
    case ready
    case error
}
