//
//  CityService.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/12/2.
//

import Foundation
import Moya

let mapToken = "2eda52df760c5e2e46265d8297f8b719"

enum CityService {
    case getCityName(lat: Double, lon: Double)
}

extension CityService: TargetType {
    var baseURL: URL {
        URL(string: "https://restapi.amap.com")!
    }
    
    var path: String {
        switch self {
        case .getCityName(_, _):
            return "/v3/geocode/regeo"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getCityName(_, _):
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getCityName(let lat, let lon):
            let parameters: [String: Any] = ["output" : "json", "location" : "\(lat),\(lon)", "key" : "\(mapToken)", "radius" : "10", "extensions" : "base"]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type" : "application/json"]
    }
}
