//
//  WeatherInformation.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/11/18.
//

import SwiftUI

struct WeatherInformation: View {
    var weatherDetialModel: WeatherDetialModel
    var temperatureUnitOn: String
    
    var body: some View {
        HStack(spacing: 20) {
            VStack{
                InformationView(des: "风向", val: weatherDetialModel.windDir, image: "fengxiang")
                Spacer()
                    .frame(height: 45)
                InformationView(des: "湿度", val: "\(weatherDetialModel.humidity)%", image: "shidu")
                Spacer()
                    .frame(height: 45)
                InformationView(des: "能见度", val: "\(weatherDetialModel.visibility)km", image: "nengjiandu")
            }
            VStack{
                InformationView(des: "风速", val: weatherDetialModel.windSpeed, image: "fengsu")
                Spacer()
                    .frame(height: 45)
                InformationView(des: "气压", val: "\(weatherDetialModel.pressure)hPa", image: "qiya")
                Spacer()
                    .frame(height: 45)
                InformationView(des: "体感", val: "\(weatherDetialModel.apparent_temperature)" + temperatureUnitOn, image: "tigan")

            }
        }
        .padding(Edge.Set.init(arrayLiteral: .bottom), 20)
        .padding(Edge.Set.init(arrayLiteral: .top, .leading, .trailing), 15)
        .background(Rectangle().fill(Color.gray).blur(radius: 200))
        .foregroundColor(Color.white)
        .cornerRadius(20)
    }
}


struct WeatherInformation_Previews: PreviewProvider {
    static var previews: some View {
        WeatherInformation(weatherDetialModel: WeatherDetialModel(), temperatureUnitOn: " ")
    }
}
