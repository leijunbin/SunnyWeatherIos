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
    private let disposeBag = DisposeBag()
    
    @Published var currentIndex = 0
    @Published var isBack = false
    
    @Published var weatherDetialModels = WeatherDetialModels()
    @Published var searchResultModel = SearchResultModel()
    
    func refreshWeather(index: Int) {
        weatherNetworkManger.getWeather(lat: weatherDetialModels.models[index].lat, lon: weatherDetialModels.models[index].lon).subscribe(onNext:{ weatherModel in
            self.weatherDetialModels.models[index].temperature = weatherModel.result.realtime.temperature
            self.weatherDetialModels.models[index].skycon = weatherModel.result.realtime.skycon
            self.weatherDetialModels.models[index].dateMaxTemperture = weatherModel.result.daily.temperature.first?.max ?? 0.00
            self.weatherDetialModels.models[index].dateMinTemperture = weatherModel.result.daily.temperature.first?.min ?? 0.00
            for i in 0..<min(24, weatherModel.result.hourly.skycon.count) {
                self.weatherDetialModels.models[index].hourlyInformation[i].time = self.getHourMinute(date: weatherModel.result.hourly.skycon[i].datetime)
                self.weatherDetialModels.models[index].hourlyInformation[i].skycon = weatherModel.result.hourly.skycon[i].value
                self.weatherDetialModels.models[index].hourlyInformation[i].hourlyTemperture = Double(weatherModel.result.hourly.temperature[i].value) ?? 0.00
            }
            for i in 0..<min(5, weatherModel.result.daily.skycon.count) {
                self.weatherDetialModels.models[index].dailyInformation[i].time = self.getMouth(date: weatherModel.result.daily.skycon[i].date) + "月" + self.getDate(date: weatherModel.result.daily.skycon[i].date) + "日"
                self.weatherDetialModels.models[index].dailyInformation[i].skycon = weatherModel.result.daily.skycon[i].value
                self.weatherDetialModels.models[index].dailyInformation[i].dateMaxTemperture = weatherModel.result.daily.temperature[i].max
                self.weatherDetialModels.models[index].dailyInformation[i].dateMinTemperture = weatherModel.result.daily.temperature[i].min
            }
            self.weatherDetialModels.models[index].windDir = self.getWindDir(value: weatherModel.result.realtime.wind.direction)
            self.weatherDetialModels.models[index].windSpeed = weatherModel.result.realtime.wind.speed
            self.weatherDetialModels.models[index].humidity = Int(weatherModel.result.realtime.humidity * 100)
            self.weatherDetialModels.models[index].pressure = Int(weatherModel.result.realtime.pressure / 100)
            self.weatherDetialModels.models[index].visibility = weatherModel.result.realtime.visibility
            self.weatherDetialModels.models[index].apparent_temperature = Int(weatherModel.result.realtime.apparent_temperature)
            self.weatherDetialModels.models[index].carWashing = weatherModel.result.daily.life_index.carWashing.first?.desc ?? "H"
            self.weatherDetialModels.models[index].coldRisk = weatherModel.result.daily.life_index.coldRisk.first?.desc ?? "H"
            self.weatherDetialModels.models[index].ultraviolet = weatherModel.result.daily.life_index.ultraviolet.first?.desc ?? "H"
            self.weatherDetialModels.models[index].dressing = weatherModel.result.daily.life_index.dressing.first?.desc ?? "H"
            self.getCityName(index: index)
        })
        .disposed(by: disposeBag)
    }
    
    func getSearchResult(queryString: String) {
        weatherNetworkManger.searchCity(queryString: queryString).subscribe(onNext: { searchModel in
            for i in 0..<searchModel.places.count {
                self.searchResultModel.result[i].formatted_address = searchModel.places[i].formatted_address
                self.searchResultModel.result[i].lat = searchModel.places[i].location.lat
                self.searchResultModel.result[i].lng = searchModel.places[i].location.lng
            }
        })
        .disposed(by: disposeBag)
    }
    
    func addModels(lat: Double, lon: Double) {
        var newModel = WeatherDetialModel()
        newModel.lat = lat
        newModel.lon = lon
        weatherDetialModels.models.append(newModel)
        let pos = weatherDetialModels.models.count - 1
        refreshWeather(index: pos)
        self.currentIndex = pos
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

