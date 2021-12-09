//
//  DateInformation.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/11/17.
//

import SwiftUI

struct DateInformation: View {
    var weatherDetialModel: WeatherDetialModel
    var temperatureUnitOn: String
    
    var body: some View {
        HStack(spacing: 20) {
            Text(weatherDetialModel.date)
                .font(.system(size: 18))
            let todayTemperture=String(Int(weatherDetialModel.dateMaxTemperture)) + temperatureUnitOn + "/" + String(Int(weatherDetialModel.dateMinTemperture)) + temperatureUnitOn
            Text(todayTemperture)
                .font(.system(size: 18))
            Spacer()
        }
    }
}

struct DateInformation_Previews: PreviewProvider {
    static var previews: some View {
        DateInformation(weatherDetialModel: WeatherDetialModel(), temperatureUnitOn: " ")
    }
}
