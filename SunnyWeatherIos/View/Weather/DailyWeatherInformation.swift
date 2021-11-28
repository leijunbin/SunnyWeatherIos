//
//  DailyWeatherInformation.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/11/17.
//

import SwiftUI

struct DailyWeatherInformation: View {
    var dailyInformation: DailyInformation
    var body: some View {
        ZStack {
            HStack(alignment: .center) {
                Text(dailyInformation.time)
                Spacer()
                let temperature = String(Int(dailyInformation.dateMaxTemperture)) + "℃/" + String(Int(dailyInformation.dateMinTemperture)) + "℃"
                Text(temperature)
            }
            HStack(alignment: .center) {
                Spacer()
                Text(getSkyconName(skycon: dailyInformation.skycon))
                Spacer()
            }
        }
    }
}

struct DailyWeatherInformation_Previews: PreviewProvider {
    static var previews: some View {
        DailyWeatherInformation(dailyInformation: DailyInformation())
    }
}
