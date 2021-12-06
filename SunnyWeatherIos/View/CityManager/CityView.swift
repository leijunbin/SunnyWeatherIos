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
    
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                HStack {
                    Text(flag ? weatherDetialModel.district : weatherDetialModel.township)
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                        .font(Font.headline.weight(.light))
                    if flag == false {
                        Image("location_")
                            .resizable()
                            .frame(width: 17, height: 17)
                    }
                }
                    
                let cityTemperture = String(Int(weatherDetialModel.dateMaxTemperture)) + "℃/" + String(Int(weatherDetialModel.dateMinTemperture)) + "℃"
                Text(cityTemperture)
                    .foregroundColor(.black)
                    .font(.system(size: 17))
            }
            Spacer()
            Text(String(Int(weatherDetialModel.temperature)) + "℃")
                .foregroundColor(.black)
                .font(.system(size: 40))
                .font(Font.headline.weight(.light))
        }
        .padding()
        .background(Image("bg_cloudy").resizable().blur(radius: 5))
        .cornerRadius(20)
    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        CityView(weatherDetialModel: WeatherDetialModel(), flag: false)
    }
}
