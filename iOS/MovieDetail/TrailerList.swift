//
//  TrailerList.swift
//  CloneNetflix
//
//  Created by PeterPark on 2023/08/02.
//

import SwiftUI

struct TrailerList: View {
    var trailers: [Trailer]
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ForEach(trailers) { trailer in
                    
                    VStack(alignment: .leading) {
                        VideoPreviewImage(imageURL: trailer.thumbnailURL, videoURL: trailer.videoURL)
                            .frame(width: screen.width - 20)
                        
                        Text(trailer.name)
                            .font(.headline)
                    }
                    .foregroundColor(.white)
                    .padding(.bottom, 10)
                }
            }
        }
    }
}

struct TrailerList_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            TrailerList(trailers: exampleTrailer)
        }
    }
}
