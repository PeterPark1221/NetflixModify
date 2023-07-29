//
//  CustomTabSwitcher.swift
//  CloneNetflix
//
//  Created by PeterPark on 2023/07/29.
//

import SwiftUI

struct CustomTabSwitcher: View {
    
    var tabs: [CustomTab]
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(tabs, id: \.self ) { tab in
                        VStack {
                            
                            //red Bar
                            Rectangle()
                                .frame( height: 6)
                            
                            
                            Button(action: {
                                //
                            }, label: {
                                Text(tab.rawValue)
                                    .font(.system(size: 16, weight: .bold))
                            })
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
        }
        .foregroundColor(.white)
    }
}

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
            
            CustomTabSwitcher(tabs: [.episodes, .trailers, .more])
        }
    }
}
