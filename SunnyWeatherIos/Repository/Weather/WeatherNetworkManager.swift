//
//  WeatherNetworkManager.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/11/7.
//

import Foundation
import RxSwift
import Moya
import CleanJSON

class WeatherNetworkManager {
    private let provider = MoyaProvider<WeatherService>()
    
    init(){}
    
    func getWeather(lat: Double, lon: Double) -> Observable<WeatherModel> {
        let decoder = CleanJSONDecoder()
        return provider.rx
            .request(.getWeather(lat: lat, lon: lon))
            .filterSuccessfulStatusCodes()
            .map(WeatherModel.self, using: decoder)
            .asObservable()
    }
    
    
}
