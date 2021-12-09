//
//  HourlyTemperatureInformation.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/11/17.
//

import SwiftUI

struct HourlyTemperatureInformation: View {
    var weatherDetialModel: WeatherDetialModel
    var temperatureUnitOn: String
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                ForEach(weatherDetialModel.hourlyInformation.indices, id: \.self){ i in
                    VStack(spacing: 5){
                        Text(weatherDetialModel.hourlyInformation[i].time)
                        Image(getSkyconImage(skycon: weatherDetialModel.hourlyInformation[i].skycon))
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .center)
                        Text(String(Int(weatherDetialModel.hourlyInformation[i].hourlyTemperture)) + temperatureUnitOn)
                    }
                }
            }
        }
    }
}

struct HourlyTemperatureInformation_Previews: PreviewProvider {
    static var previews: some View {
        HourlyTemperatureInformation(weatherDetialModel: WeatherDetialModel(), temperatureUnitOn: " ")
    }
}
