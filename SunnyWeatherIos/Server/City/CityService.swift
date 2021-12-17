//
//  CityService.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/12/2.
//

import Foundation
import Moya

let mapToken = ""

enum CityService {
    case getCityName(lat: Double, lon: Double)
    case searchPlace(queryString: String)
}

extension CityService: TargetType {
    var baseURL: URL {
        URL(string: "https://restapi.amap.com")!
    }
    
    var path: String {
        switch self {
        case .getCityName(_, _):
            return "/v3/geocode/regeo"
        case .searchPlace(_):
            return "/v3/assistant/inputtips"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getCityName(_, _):
            return .get
        case .searchPlace(_):
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getCityName(let lat, let lon):
            let parameters: [String: Any] = ["output" : "json", "location" : "\(lon),\(lat)", "key" : "\(mapToken)", "radius" : "10", "extensions" : "base"]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        case .searchPlace(let queryString):
            let parameters: [String: Any] = ["output" : "json", "keywords" : "\(queryString)", "key" : "\(mapToken)"]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type" : "application/json"]
    }
}
