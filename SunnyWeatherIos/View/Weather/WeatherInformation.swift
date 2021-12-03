//
//  WeatherInformation.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/11/18.
//

import SwiftUI

struct WeatherInformation: View {
    var weatherDetialModel: WeatherDetialModel
    
    var body: some View {
        HStack {
            VStack{
                InformationView(des: "风向", val: weatherDetialModel.windDir)
                Spacer()
                    .frame(height: 45)
                InformationView(des: "湿度", val: "\(weatherDetialModel.humidity)%")
                Spacer()
                    .frame(height: 45)
                InformationView(des: "能见度", val: "\(weatherDetialModel.visibility)km")
            }.padding()
            Spacer()
                .frame(width: 30)
            VStack{
                InformationView(des: "风速", val: "\(weatherDetialModel.windSpeed)km/h")
                Spacer()
                    .frame(height: 45)
                InformationView(des: "气压", val: "\(weatherDetialModel.pressure)hPa")
                Spacer()
                    .frame(height: 45)
                InformationView(des: "体感", val: "\(weatherDetialModel.apparent_temperature)℃")

            }.padding()
        }
        .padding()
        .background(Rectangle().fill(Color.gray).blur(radius: 200))
        .foregroundColor(Color.white)
        .cornerRadius(20)
    }
}

struct WeatherInformation_Previews: PreviewProvider {
    static var previews: some View {
        WeatherInformation(weatherDetialModel: WeatherDetialModel())
    }
}
