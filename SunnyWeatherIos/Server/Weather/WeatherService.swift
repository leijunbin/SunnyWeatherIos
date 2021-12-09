//
//  WeatherService.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/11/7.
//

import Foundation
import Moya

let weatherToken = "cjVEVQndqLbtJ7H8"

enum WeatherService {
    case getWeather(lat: Double, lon: Double)
    case getWeatherImperialUnit(lat: Double, lon: Double)
    case searchPlace(queryString: String)
}

extension WeatherService: TargetType {
    var baseURL: URL {
        URL(string: "https://api.caiyunapp.com")!
    }
    
    var path: String {
        switch self {
        case .getWeather(let lat, let lon):
            return "/v2.5/\(weatherToken)/\(lon),\(lat)/weather.json"
        case .getWeatherImperialUnit(let lat, let lon):
            return "/v2.5/\(weatherToken)/\(lon),\(lat)/weather.json"
        case .searchPlace(_):
            return "v2/place"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getWeather(_, _):
            return .get
        case .getWeatherImperialUnit(_, _):
            return .get
        case .searchPlace(_):
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getWeather(_, _):
            let parameters: [String: Any] = ["lang" : "zh_CN", "alert" : "true"]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        case .getWeatherImperialUnit(_, _):
            let parameters: [String: Any] = ["lang" : "zh_CN", "alert" : "true", "unit" : "imperial"]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        case .searchPlace(let queryString):
            let parameters: [String: Any] = ["query" : "\(queryString)","token" : "\(weatherToken)", "lang" : "zh_CN"]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type" : "application/json"]
    }
}
