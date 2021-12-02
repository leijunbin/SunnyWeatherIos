//
//  CityModel.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/12/2.
//

import Foundation

struct CityModel: Codable {
    var regeocode: Regeocode
}

struct Regeocode: Codable {
    var addressComponent: AddressComponent
}

struct AddressComponent: Codable {
    var district: String
    var township: String
}
