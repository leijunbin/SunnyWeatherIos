//
//  WeatherBackground.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/11/8.
//

import SwiftUI

struct WeatherBackground: View {
    var body: some View {
        Image("bg_sun_noon")
            .resizable()
            .scaledToFill()
    }
}

struct WeatherBackground_Previews: PreviewProvider {
    static var previews: some View {
        WeatherBackground()
    }
}
