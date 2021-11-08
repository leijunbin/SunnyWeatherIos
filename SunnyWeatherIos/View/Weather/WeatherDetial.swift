//
//  WeatherDetial.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/11/8.
//

import SwiftUI

struct WeatherDetial: View {
    @ObservedObject var viewMode = WeatherDetialViewModel()
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack{
                WeatherBackground()
                
            }
        }
    }
}

struct WeatherDetial_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetial()
    }
}
