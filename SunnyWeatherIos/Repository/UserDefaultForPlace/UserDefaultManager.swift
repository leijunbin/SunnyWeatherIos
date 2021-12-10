//
//  UserDefaultManager.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/12/9.
//

import Foundation

class UserDefaultsManager {
    private var defaultNumber: Int
    
    init() {
        defaultNumber = UserDefaults.standard.integer(forKey: "defaultNumber")
        if defaultNumber < 1 {
            defaultNumber = 1
        }
    }
    
    func getAllPlace() -> WeatherDetialModels {
        var weatherDetialModels = WeatherDetialModels()
        
        for i in 1..<defaultNumber {
            var weatherDetialModel = WeatherDetialModel()
            weatherDetialModel.lat = UserDefaults.standard.double(forKey: "\(i)lat")
            weatherDetialModel.lon = UserDefaults.standard.double(forKey: "\(i)lon")
            weatherDetialModels.models.append(weatherDetialModel)
        }
        
        return weatherDetialModels
    }
    
    func saveAllPlace(result: WeatherDetialModels) {
        defaultNumber = result.models.count
        UserDefaults.standard.set(defaultNumber, forKey: "defaultNumber")
        
        for i in 1..<defaultNumber {
            UserDefaults.standard.set(result.models[i].lat, forKey: "\(i)lat")
            UserDefaults.standard.set(result.models[i].lon, forKey: "\(i)lon")
        }
    }
}
