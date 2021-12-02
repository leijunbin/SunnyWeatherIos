//
//  TemperatureImformation.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/11/17.
//

import SwiftUI

struct TemperatureImformation: View {
    var weatherDetialModel: WeatherDetialModel
    var body: some View {
        HStack {
            HStack{
                Text(String(Int(weatherDetialModel.temperature)))
                    .italic()
                    .font(.system(size: 100))
                VStack{
                    Text("℃")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                    Text(getSkyconName(skycon: weatherDetialModel.skycon))
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                    }
                }
                Spacer()
        }
    }
}

struct TemperatureImformation_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureImformation(weatherDetialModel: WeatherDetialModel())
    }
}
