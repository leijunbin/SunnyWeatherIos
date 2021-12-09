//
//  DailyWeatherInformation.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/11/17.
//

import SwiftUI

struct DailyWeatherInformation: View {
    var dailyInformation: DailyInformation
    var temperatureUnitOn: String
    
    var body: some View {
        ZStack {
            HStack(alignment: .center) {
                Text(dailyInformation.time)
                Spacer()
                let temperature = String(Int(dailyInformation.dateMaxTemperture)) + temperatureUnitOn + "/" + String(Int(dailyInformation.dateMinTemperture)) + temperatureUnitOn
                Text(temperature)
            }
            HStack(alignment: .center) {
                Spacer()
                Image(getSkyconImage(skycon: dailyInformation.skycon))
                    .resizable()
                    .frame(width: 25, height: 25, alignment: .center)
                Spacer()
            }
        }
    }
}

struct DailyWeatherInformation_Previews: PreviewProvider {
    static var previews: some View {
        DailyWeatherInformation(dailyInformation: DailyInformation(), temperatureUnitOn: " ")
    }
}
