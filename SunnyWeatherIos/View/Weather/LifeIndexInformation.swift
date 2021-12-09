//
//  LifeIndexInformation.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/11/28.
//

import SwiftUI

import SwiftUI

struct LifeIndexInformation: View {
    var weatherDetialModel: WeatherDetialModel
    
    var body: some View {
        HStack {
            VStack{
                InformationView(des: "洗车", val: "\(weatherDetialModel.carWashing)", image: "xiche")
                Spacer()
                    .frame(height: 45)
                InformationView(des: "紫外线", val: "\(weatherDetialModel.ultraviolet)", image: "ziwaixian1")
            }
            .padding()
            VStack{
                InformationView(des: "感冒", val: "\(weatherDetialModel.coldRisk)", image: "ganmaozhishu")
                Spacer()
                    .frame(height: 45)
                InformationView(des: "穿衣", val: "\(weatherDetialModel.dressing)", image: "chuanyi")
            }
            .padding()
        }
        .padding(Edge.Set.init(arrayLiteral: .top), 5)
        .padding(Edge.Set.init(arrayLiteral: .top, .bottom, .leading, .trailing), 5)
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
