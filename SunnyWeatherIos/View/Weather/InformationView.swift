//
//  InformationView.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/11/28.
//

import SwiftUI

struct InformationView: View {
    var des: String
    var val: String
    var image: String
    
    var body: some View {
        HStack{
            Image(image)
                .resizable()
                .frame(width: 30, height: 30)
            
            VStack{
                Text(des)
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                Spacer()
                Text(val)
                    .font(.system(size: 20))
                    .foregroundColor(.black)
            }
            .frame(height: 50)
        }
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView(des: "___", val: "0.0", image: "xiche")
    }
}
