//
//  WhiteButton.swift
//  CloneNetflix
//
//  Created by PeterPark on 2023/07/17.
//

import SwiftUI

struct PlayButton: View {
    //프로퍼티 생성
    var text: String
    var imageName: String
    var backgroundColor: Color = Color.white
    
    var body: some View {
        
        Button(action: {
            //
        }, label: {
            HStack{
                Spacer()
                
                Image(systemName: imageName)
                    .font(.headline)
                
                Text(text)
                    .font(.system(size: 16))
                    .bold()
                
                Spacer()
            }
            .padding(.vertical, 6)
            .foregroundColor(backgroundColor == .white ? .black : .white)
            .background(backgroundColor)
            .cornerRadius(3.0 )
        })
    }
}

struct WhiteButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            PlayButton(text: "Play", imageName: "play.fill")
        }
    }
}
