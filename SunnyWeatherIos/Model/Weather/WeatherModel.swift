//
//  WeatherModel.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/11/7.
//

import Foundation

struct WeatherModel: Codable {
    var result: Result
}

struct Result: Codable {
    var alert: Alert
    var realtime: Realtime
    var hourly: Hourly
    var daily: Daily
    var forecast_keypoint: String
}

struct Alert: Codable {
    var content: [Content]
}

struct Content: Codable {
    var code: Int
    var description: String
    var title: String
    var source: String
}

struct Realtime: Codable {
    var temperature: Double
    var humidity: Double
    var cloudrate: Double
    var skycon: String
    var visibility: Double
    var wind: Wind
    var pressure: Double
    var apparent_temperature: Double
    var air_quality: Air_quality
}

struct Wind: Codable {
    var speed: Double
    var direction: Double
}

struct Air_quality: Codable {
    var pm25: Double
    var pm10: Double
    var o3: Double
    var so2: Double
    var no2: Double
    var co: Double
    var aqi: Aqi
    var description: Description
}

struct Aqi: Codable {
    var chn: Double
    var usa: Double
}

struct Description: Codable {
    var chn: String
    var usa: String
}

struct Hourly: Codable {
    var temperature: [DD]
    var skycon: [DV]
}

struct DD: Codable {
    var datetiem: String
    var value: Double
}

struct DV: Codable {
    var datetime: String
    var value: String
}

struct Daily: Codable {
    var astro: [Astro]
    var temperature: [Temperature]
    var skycon: [Skycon]
    var life_index: Life_index
}

struct Astro: Codable {
    var date: String
    var sunrise: Time
    var sumset: Time
}

struct Time: Codable {
    var time: String
}

struct Temperature: Codable {
    var datetime: String
    var max: Double
    var min: Double
}

struct Skycon: Codable {
    var date: String
    var value: String
}

struct Life_index: Codable {
    var ultraviolet: [Index]
    var carWashing: [Index]
    var dressing: [Index]
    var coldRisk: [Index]
}

struct Index: Codable {
    var data: String
    var index: Double
    var desc: String
}
