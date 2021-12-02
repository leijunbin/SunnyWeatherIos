//
//  DateInformation.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/11/17.
//

import SwiftUI

struct DateInformation: View {
    var weatherDetialModel: WeatherDetialModel
    
    var body: some View {
        HStack(spacing: 20) {
            Text(weatherDetialModel.date)
                .font(.system(size: 18))
            let todayTemperture=String(Int(weatherDetialModel.dateMaxTemperture)) + "℃/" + String(Int(weatherDetialModel.dateMinTemperture)) + "℃"
            Text(todayTemperture)
                .font(.system(size: 18))
            Spacer()
        }
    }
}

struct DateInformation_Previews: PreviewProvider {
    static var previews: some View {
        DateInformation(weatherDetialModel: WeatherDetialModel())
    }
}
