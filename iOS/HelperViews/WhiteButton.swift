//
//  WhiteButton.swift
//  CloneNetflix
//
//  Created by PeterPark on 2023/07/17.
//

import SwiftUI

struct WhiteButton: View {
    //프로퍼티 생성
    var text: String
    var imageName: String
    
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
            .foregroundColor(.black)
            .background(Color.white)
            .frame(width: 120)
            .cornerRadius(3.0 )
        })
    }
}

struct WhiteButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            WhiteButton(text: "Play", imageName: "play.fill")
        }
    }
}
