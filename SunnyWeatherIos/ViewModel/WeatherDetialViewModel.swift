//
//  WeatherDetialViewModel.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/11/8.
//

import Foundation
import SwiftUI
import RxSwift

class WeatherDetialViewModel: ObservableObject {
    private let weatherNetworkManger = WeatherNetworkManager()
    private let cityNetworkManger = CityNetworkManager()
    private let locationManager = LocationManager()
    private let disposeBag = DisposeBag()
    private let userDefaultsManager = UserDefaultsManager()
    
    @Published var currentIndex = 0
    @Published var isCityManager = false
    @Published var isSetting = false
    
    @Published var temperatureUnit = UserDefaults.standard.integer(forKey: "temperatureUnit")
    @Published var windSpeedUnit = UserDefaults.standard.integer(forKey: "windSpeedUnit")
    
    @Published var searchResultModel = SearchResultModel()
    
    @Published var weatherDetialModels: WeatherDetialModels
    init() {
        weatherDetialModels = userDefaultsManager.getAllPlace()
    }
    
    func refreshWeather(index: Int) {
        weatherNetworkManger.getWeather(lat: weatherDetialModels.models[index].lat, lon: weatherDetialModels.models[index].lon).subscribe(onNext:{ weatherModel in
            self.weatherDetialModels.models[index].skycon = weatherModel.result.realtime.skycon
            for i in 0..<min(24, weatherModel.result.hourly.skycon.count) {
                self.weatherDetialModels.models[index].hourlyInformation[i].time = self.getHourMinute(date: weatherModel.result.hourly.skycon[i].datetime)
                self.weatherDetialModels.models[index].hourlyInformation[i].skycon = weatherModel.result.hourly.skycon[i].value
            }
            for i in 0..<min(5, weatherModel.result.daily.skycon.count) {
                self.weatherDetialModels.models[index].dailyInformation[i].time = self.getMouth(date: weatherModel.result.daily.skycon[i].date) + "月" + self.getDate(date: weatherModel.result.daily.skycon[i].date) + "日"
                self.weatherDetialModels.models[index].dailyInformation[i].skycon = weatherModel.result.daily.skycon[i].value
            }
            self.weatherDetialModels.models[index].windDir = self.getWindDir(value: weatherModel.result.realtime.wind.direction)
            if self.windSpeedUnit == 0 {
                self.weatherDetialModels.models[index].windSpeed = changeWindDoubleToString(speed: weatherModel.result.realtime.wind.speed)
            }
            else if self.windSpeedUnit == 1 {
                self.weatherDetialModels.models[index].windSpeed = String(weatherModel.result.realtime.wind.speed) + "km/h"
            }
            self.weatherDetialModels.models[index].humidity = Int(weatherModel.result.realtime.humidity * 100)
            self.weatherDetialModels.models[index].pressure = Int(weatherModel.result.realtime.pressure / 100)
            self.weatherDetialModels.models[index].visibility = weatherModel.result.realtime.visibility
            self.weatherDetialModels.models[index].carWashing = weatherModel.result.daily.life_index.carWashing.first?.desc ?? "H"
            self.weatherDetialModels.models[index].coldRisk = weatherModel.result.daily.life_index.coldRisk.first?.desc ?? "H"
            self.weatherDetialModels.models[index].ultraviolet = weatherModel.result.daily.life_index.ultraviolet.first?.desc ?? "H"
            self.weatherDetialModels.models[index].dressing = weatherModel.result.daily.life_index.dressing.first?.desc ?? "H"
            self.weatherDetialModels.models[index].air_quality.no2 = weatherModel.result.realtime.air_quality.no2 + 0.5
            self.weatherDetialModels.models[index].air_quality.pm25 = weatherModel.result.realtime.air_quality.pm25 + 0.5
            self.weatherDetialModels.models[index].air_quality.pm10 = weatherModel.result.realtime.air_quality.pm10 + 0.5
            self.weatherDetialModels.models[index].air_quality.so2 = weatherModel.result.realtime.air_quality.so2 + 0.5
            self.weatherDetialModels.models[index].air_quality.co = weatherModel.result.realtime.air_quality.co + 0.5
            self.weatherDetialModels.models[index].air_quality.o3 = weatherModel.result.realtime.air_quality.o3 + 0.5
            self.weatherDetialModels.models[index].air_quality.aqi = weatherModel.result.realtime.air_quality.aqi.chn
            self.weatherDetialModels.models[index].air_quality.description = weatherModel.result.realtime.air_quality.description.chn
            if weatherModel.result.alert.content.count != 0 {
                self.weatherDetialModels.models[index].isShowAlert = true
                self.weatherDetialModels.models[index].alert.removeAll()
                for i in 0..<weatherModel.result.alert.content.count {
                    var addAlert = Alerts()
                    addAlert.code = weatherModel.result.alert.content[i].code % 100
                    addAlert.description = weatherModel.result.alert.content[i].description
                    addAlert.title = weatherModel.result.alert.content[i].title
                    addAlert.source = weatherModel.result.alert.content[i].source
                    self.weatherDetialModels.models[index].alert.append(addAlert)
                }
                self.weatherDetialModels.models[index].alert.sort (
                    by: {
                        (alert1: Alerts, alert2: Alerts) -> Bool in
                        return alert1.code > alert2.code ? true : false
                    })
            }
            else {
                self.weatherDetialModels.models[index].isShowAlert = false
            }
            if self.temperatureUnit == 1 {
                self.refreshImperialUnit(index: index)
            }
            else {
                self.weatherDetialModels.models[index].temperature = weatherModel.result.realtime.temperature + 0.5
                self.weatherDetialModels.models[index].dateMaxTemperture = weatherModel.result.daily.temperature.first?.max ?? 0.00
                self.weatherDetialModels.models[index].dateMinTemperture = weatherModel.result.daily.temperature.first?.min ?? 0.00
                for i in 0..<min(24, weatherModel.result.hourly.skycon.count) {
                    self.weatherDetialModels.models[index].hourlyInformation[i].hourlyTemperture = weatherModel.result.hourly.temperature[i].value + 0.5
                }
                for i in 0..<min(5, weatherModel.result.daily.skycon.count) {
                    self.weatherDetialModels.models[index].dailyInformation[i].dateMaxTemperture = weatherModel.result.daily.temperature[i].max + 0.5
                    self.weatherDetialModels.models[index].dailyInformation[i].dateMinTemperture = weatherModel.result.daily.temperature[i].min + 0.5
                }
                self.weatherDetialModels.models[index].apparent_temperature = Int(weatherModel.result.realtime.apparent_temperature + 0.5)
            }
            self.getCityName(index: index)
        })
        .disposed(by: disposeBag)
    }
    
    func refreshAlltempure() {
        for i in 0..<weatherDetialModels.models.count {
            refreshWeather(index: i)
        }
    }
    
    func getCurrentLocation() {
        locationManager.getLocation().subscribe(onNext: { location in
            guard let location = location else{
                return
            }
            self.weatherDetialModels.models[0].lon = Double(String(format: "%.6f", location.coordinate.longitude)) ?? 0.00
            self.weatherDetialModels.models[0].lat = Double(String(format: "%.6f", location.coordinate.latitude)) ?? 0.00
            self.refreshWeather(index: 0)
        })
        .disposed(by: disposeBag)
    }
    
    func getSearchResult(queryString: String) {
        cityNetworkManger.searchCity(queryString: queryString).subscribe(onNext: { searchModel in
            for i in 0..<searchModel.tips.count {
                self.searchResultModel.result[i].name = searchModel.tips[i].name
                self.searchResultModel.result[i].district = searchModel.tips[i].district
                if searchModel.tips[i].address == "(\n)" {
                    self.searchResultModel.result[i].address = ""
                }
                else {
                    self.searchResultModel.result[i].address = searchModel.tips[i].address
                }
                let location: [Substring] = searchModel.tips[i].location.split(separator: ",")
                
                var arrayStrings: [String] = []
                for item in location {
                    arrayStrings.append("\(item)")
                }
                
                if arrayStrings.count == 2 {
                    self.searchResultModel.result[i].lat = Double(arrayStrings[1]) ?? 0.0
                    self.searchResultModel.result[i].lng = Double(arrayStrings[0]) ?? 0.0
                }
            }
        })
        .disposed(by: disposeBag)
    }
    
    func deleteModels(at offsets: IndexSet) {
        currentIndex = 0
        weatherDetialModels.models.remove(atOffsets: offsets)
        userDefaultsManager.saveAllPlace(result: weatherDetialModels)
    }
    
    func moveModels(source: IndexSet, destination: Int) {
        weatherDetialModels.models.move(fromOffsets: source, toOffset: destination)
        userDefaultsManager.saveAllPlace(result: weatherDetialModels)
    }
    
    func addModels(lat: Double, lon: Double) {
        var newModel = WeatherDetialModel()
        newModel.lat = lat
        newModel.lon = lon
        weatherDetialModels.models.append(newModel)
        let pos = weatherDetialModels.models.count - 1
        refreshWeather(index: pos)
        self.currentIndex = pos
        userDefaultsManager.saveAllPlace(result: weatherDetialModels)
    }
    
    private func refreshImperialUnit(index: Int) {
        weatherNetworkManger.getWeatherImperialUnit(lat: weatherDetialModels.models[index].lat, lon: weatherDetialModels.models[index].lon).subscribe(onNext:{ weatherModel in
            self.weatherDetialModels.models[index].temperature = weatherModel.result.realtime.temperature + 0.5
            self.weatherDetialModels.models[index].dateMaxTemperture = weatherModel.result.daily.temperature.first?.max ?? 0.00
            self.weatherDetialModels.models[index].dateMinTemperture = weatherModel.result.daily.temperature.first?.min ?? 0.00
            for i in 0..<min(24, weatherModel.result.hourly.skycon.count) {
                self.weatherDetialModels.models[index].hourlyInformation[i].hourlyTemperture = weatherModel.result.hourly.temperature[i].value + 0.5
            }
            for i in 0..<min(5, weatherModel.result.daily.skycon.count) {
                self.weatherDetialModels.models[index].dailyInformation[i].dateMaxTemperture = weatherModel.result.daily.temperature[i].max + 0.5
                self.weatherDetialModels.models[index].dailyInformation[i].dateMinTemperture = weatherModel.result.daily.temperature[i].min + 0.5
            }
            self.weatherDetialModels.models[index].apparent_temperature = Int(weatherModel.result.realtime.apparent_temperature + 0.5) 
        })
        .disposed(by: disposeBag)
    }
    
    private func getCityName(index: Int) {
        cityNetworkManger.getCityName(lat: weatherDetialModels.models[index].lat, lon: weatherDetialModels.models[index].lon).subscribe(onNext: { cityModel in
            self.weatherDetialModels.models[index].district = cityModel.regeocode.addressComponent.district
            self.weatherDetialModels.models[index].township = cityModel.regeocode.addressComponent.township
            let cityName = cityModel.regeocode.addressComponent.district + " " + cityModel.regeocode.addressComponent.township
            self.weatherDetialModels.models[index].city = cityName
        })
        .disposed(by: disposeBag)
    }
    
    private func getHourMinute(date: String) -> String {
        let startIndex = date.index(date.startIndex, offsetBy: 11)
        let endIndex = date.index(date.startIndex, offsetBy: 16)
        return String(date[startIndex..<endIndex])
    }
    
    private func getMouth(date: String) -> String {
        let startIndex = date.index(date.startIndex, offsetBy: 5)
        let endIndex = date.index(date.startIndex, offsetBy: 7)
        return String(Int(String(date[startIndex..<endIndex])) ?? 0)
    }
    
    private func getDate(date: String) -> String {
        let startIndex = date.index(date.startIndex, offsetBy: 8)
        let endIndex = date.index(date.startIndex, offsetBy: 10)
        return String(Int(String(date[startIndex..<endIndex])) ?? 0)
    }
    
    private func getWindDir(value: Double) -> String {
        if value == 0 {
            return "北"
        }
        else if value > 0 && value < 90 {
            return "东北"
        }
        else if value == 90 {
            return "东"
        }
        else if value > 90 && value < 180 {
            return "东南"
        }
        else if value == 180 {
            return "南"
        }
        else if value > 180 && value < 270 {
            return "西南"
        }
        else if value == 270 {
            return "西"
        }
        else {
            return "西北"
        }
    }
}


