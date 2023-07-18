//
//  SmallVerticalButton.swift
//  CloneNetflix
//
//  Created by PeterPark on 2023/07/17.
//

import SwiftUI


//제일 첫번째 영화에 버튼기능 설정뷰
struct SmallVerticalButton: View {
    var text: String
    
    var isOnImage: String
    var isOffImage: String
    
    var isOn: Bool
    
    var imageName: String {
        if isOn {
            return isOnImage
        }else {
            return isOffImage
        }
    }
    
    var body: some View {
        Button(action: {
            //
        }, label: {
            VStack {
               Image(systemName: imageName)
                
                Text(text)
            }
        })
    }
}

struct SmallVerticalButton_Previews: PreviewProvider {
    static var previews: some View {
        SmallVerticalButton(text: "My List",
                            isOnImage: "checkmark",
                            isOffImage: "plus",
                            isOn: false
        )
    }
}
