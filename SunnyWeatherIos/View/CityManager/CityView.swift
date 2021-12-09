//
//  CityView.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/12/5.
//

import SwiftUI

struct CityView: View {
    var weatherDetialModel: WeatherDetialModel
    var flag: Bool
    var temperatureUnitOn: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10){
                HStack {
                    Text(flag ? weatherDetialModel.district : weatherDetialModel.township)
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                        .font(Font.headline.weight(.light))
                    if flag == false {
                        Image("location")
                            .resizable()
                            .frame(width: 17, height: 17)
                    }
                }
                    
                let cityTemperture = String(Int(weatherDetialModel.dateMaxTemperture)) + temperatureUnitOn + " / " + String(Int(weatherDetialModel.dateMinTemperture)) + temperatureUnitOn
                Text(cityTemperture)
                    .foregroundColor(.black)
                    .font(.system(size: 17))
            }
            Spacer()
            Text(String(Int(weatherDetialModel.temperature)) + temperatureUnitOn)
                .foregroundColor(.black)
                .font(.system(size: 35))
                .font(Font.headline.weight(.light))
        }
        .padding()
        .frame(height: 100)
        .background(Image(getSkyconBgframe(skycon:weatherDetialModel.skycon)).resizable().blur(radius: 5))
        .cornerRadius(20)
    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        CityView(weatherDetialModel: WeatherDetialModel(), flag: false, temperatureUnitOn: " ")
    }
}
