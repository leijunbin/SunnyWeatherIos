//
//  WeatherDetialModel.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/11/8.
//

import Foundation

struct WeatherDetialModel {
    var temperature: Double
    var skycon: String
    var date: String
    
    var dateMaxTemperture: Double
    var dateMinTemperture: Double
    
    var hourlyInformation = [HourlyInformation](repeating: HourlyInformation(), count: 24)
    var dailyInformation = [DailyInformation](repeating: DailyInformation(), count: 5)
    
    
    
    init(){
        temperature = 0.00
        skycon = "CLEAR_DAY"
        date = getDate()
        dateMaxTemperture = 0.00
        dateMinTemperture = 0.00
    }
}

struct HourlyInformation {
    var time: String
    var skycon: String
    
    var hourlyTemperture: Double
    
    init() {
        time = "00:00"
        skycon = "CLEAR_DAY"
        hourlyTemperture = 0.00
    }
}

struct DailyInformation {
    var time: String
    var skycon: String
    
    var dateMaxTemperture: Double
    var dateMinTemperture: Double
    
    init(){
        time = "11月17日"
        skycon = "CLEAR_DAY"
        dateMaxTemperture = 0.00
        dateMinTemperture = 0.00
    }
}
