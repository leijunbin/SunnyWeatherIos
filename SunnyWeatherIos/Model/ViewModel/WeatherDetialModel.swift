//
//  WeatherDetialModel.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/11/8.
//

import Foundation

struct WeatherDetialModels {
    var models = [WeatherDetialModel](repeating: WeatherDetialModel(), count: 1)
}

struct WeatherDetialModel {
    var isShowAlert = false
    
    var city: String
    var district: String
    var township: String
    
    var lat: Double
    var lon: Double
    
    var temperature: Double
    var skycon: String
    var date: String
    
    var dateMaxTemperture: Double
    var dateMinTemperture: Double
    
    var hourlyInformation = [HourlyInformation](repeating: HourlyInformation(), count: 24)
    var dailyInformation = [DailyInformation](repeating: DailyInformation(), count: 5)
    
    var windDir: String
    var windSpeed: Double
    
    var humidity: Int
    var pressure: Int
    var visibility: Double
    var apparent_temperature: Int
    
    var carWashing: String
    var coldRisk: String
    var ultraviolet: String
    var dressing: String
    
    var air_quality: Air
    
    var alert = [Alerts](repeating: Alerts(), count: 1)
    
    init(){
        city = "Beijing"
        lat = 39.909229
        lon = 116.409315
        temperature = 0.00
        skycon = "CLEAR_DAY"
        date = getDate()
        dateMaxTemperture = 0.00
        dateMinTemperture = 0.00
        windDir = "中"
        windSpeed = 0.00
        humidity = 0
        pressure = 0
        visibility = 0.00
        apparent_temperature = 0
        carWashing = "H"
        coldRisk = "H"
        ultraviolet = "H"
        dressing = "H"
        district = "Beijing"
        township = "Xueyuanlu"
        air_quality = Air()
    }
}

struct HourlyInformation {
    var time: String
    var skycon: String
    
    var hourlyTemperture: Double
    
    init() {
        time = "00:00"
        skycon = "CLEAR_DAY"
        hourlyTemperture = -1.00
    }
}

struct DailyInformation {
    var time: String
    var skycon: String
    
    var dateMaxTemperture: Double
    var dateMinTemperture: Double
    
    init(){
        time = "12月2日"
        skycon = "CLEAR_DAY"
        dateMaxTemperture = 0.00
        dateMinTemperture = 0.00
    }
}

struct Air {
    var pm25: Double
    var pm10: Double
    var o3: Double
    var so2: Double
    var no2: Double
    var co: Double
    var aqi: Double
    var description: String
    
    init() {
        pm25 = 0
        pm10 = 0
        o3 = 0
        so2 = 0
        no2 = 0
        co = 0
        aqi = 0
        description = "优"
    }
}

struct Alerts {
    var code: Int
    var description: String
    var title: String
    var source: String
    
    init() {
        code = 01
        description = " "
        title = " "
        source = " "
    }
}
