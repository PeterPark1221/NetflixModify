//
//  CommingSoon.swift
//  CloneNetflix
//
//  Created by PeterPark on 2023/08/23.
//

import SwiftUI

struct CommingSoon: View {
    @State private var showNotificationList = false
    @State private var navBarHidden = true
    @State private var movieDetailToShow: Movie? = nil
    
    @State private var scrollOffset: CGFloat = 0.0
    @State private var activeIndex = 0
    
    @ObservedObject var vm = ComingSoonVM()
    
    func updateActiveIndex(fromScroll scroll: CGFloat) {
        if scroll > 105  {
            activeIndex = 0
        } else {
            let remove105 = scroll - 105
            let active = Int(remove105 / 410) + 1
            activeIndex = Int(active)
        }
    }
    
    
    var body: some View {
        let movies = vm.movies.enumerated().map({ $0 })
        
        _ = Binding {
            return scrollOffset
        } set: { newVal in
            scrollOffset = newVal
            updateActiveIndex(fromScroll: newVal)
        }
        
        return ZStack {
            Color.black
                .ignoresSafeArea(.all)
                
            TrackableScrollView(.vertical, showIndicators: false, contentOffset: $scrollOffset) {
                LazyVStack {
                    NotificationBar(showNotificationList: $showNotificationList)
                        
                    ForEach(Array(movies), id: \.offset) { index, movie in
                        ComingSoonRow(movie: movie, movieDetailToShow: $movieDetailToShow)
                            .frame(height: 400)
                            .overlay (
                                Group {
                                    index == activeIndex ? Color.clear :
                                    Color.black.opacity(0.8)
                                }
                                    .animation(.easeOut)
                            )
                    }
                }
            }
            .foregroundColor(.white)
                
            NavigationLink(
                destination: Text("notification List"),
                isActive: $showNotificationList,
                label: {
                    EmptyView()
                })
                .navigationTitle("")
                .navigationBarHidden(navBarHidden)
                .onReceive(NotificationCenter.default.publisher(for:
                    UIApplication.willEnterForegroundNotification), perform: { _ in
                    self.navBarHidden = true
                })
                .onReceive(NotificationCenter.default.publisher(for:
                    UIApplication.willResignActiveNotification), perform: { _ in
                    self.navBarHidden = false
                })
            }
    }
}
struct CommingSoon_Previews: PreviewProvider {
    static var previews: some View {
        CommingSoon()
    }
}
