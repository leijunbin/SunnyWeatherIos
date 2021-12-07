//
//  LifeIndexInformation.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/11/28.
//

import SwiftUI

struct LifeIndexInformation: View {
    var weatherDetialModel: WeatherDetialModel
    
    var body: some View {
        HStack {
            VStack{
                InformationView(des: "洗车", val: "\(weatherDetialModel.carWashing)")
                Spacer()
                    .frame(height: 45)
                InformationView(des: "紫外线", val: "\(weatherDetialModel.ultraviolet)")
            }.padding()
            Spacer()
                .frame(width: 45)
            VStack{
                InformationView(des: "感冒", val: "\(weatherDetialModel.coldRisk)")
                Spacer()
                    .frame(height: 45)
                InformationView(des: "穿衣", val: "\(weatherDetialModel.dressing)")
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
        LifeIndexInformation(weatherDetialModel: WeatherDetialModel())
    }
}
