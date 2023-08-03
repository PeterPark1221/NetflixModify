//
//  SwiftUIVideoView.swift
//  CloneNetflix
//
//  Created by PeterPark on 2023/08/02.
//

import SwiftUI
//AVKit은 비디오 컨텐츠를 재생 할 수 있는 고급 인터페이스를 제공하는 프레임워크
//AVFoundation보다 더 특화되어있음 
import AVKit

struct SwiftUIVideoView: View {
    var url: URL
    
    private var player: AVPlayer {
        AVPlayer(url: url)
    }
    
    var body: some View {
        VideoPlayer(player: player)
    }
}

struct SwiftUIVideoView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIVideoView(url: exampleVideoURL)
    }
}
