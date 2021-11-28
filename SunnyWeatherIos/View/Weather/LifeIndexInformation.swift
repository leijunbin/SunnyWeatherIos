//
//  LifeIndexInformation.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/11/28.
//

import SwiftUI

struct LifeIndexInformation: View {
    var body: some View {
        HStack {
            VStack{
                InformationView(des: "洗车", val: 0.0)
                Spacer()
                    .frame(height: 45)
                InformationView(des: "紫外线", val: 0.0)
            }.padding()
            Spacer()
                .frame(width: 70)
            VStack{
                InformationView(des: "感冒", val: 0.0)
                Spacer()
                    .frame(height: 45)
                InformationView(des: "穿衣", val: 0.0)
            }.padding()
        }
        .padding()
        .background(Rectangle().fill(Color.gray).blur(radius: 200))
        .foregroundColor(Color.white)
        .cornerRadius(20)
    }
}

struct LifeIndexInformation_Previews: PreviewProvider {
    static var previews: some View {
        LifeIndexInformation()
    }
}
