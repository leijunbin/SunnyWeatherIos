//
//  WeatherBackground.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/11/8.
//

import SwiftUI

struct WeatherBackground: View {
    var skycon: String
    var body: some View {
        Image(getSkyconBackground(skycon: skycon))
            .resizable()
            .scaledToFill()
    }
}

struct WeatherBackground_Previews: PreviewProvider {
    static var previews: some View {
        WeatherBackground(skycon: "CLEAR_DAY")
    }
}
