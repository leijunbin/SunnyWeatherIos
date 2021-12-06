//
//  SearchModel.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/12/6.
//

import Foundation
import CoreLocation

struct SearchModel: Codable {
    var places: [Place]
}

struct Place: Codable {
    var formatted_address: String
    var location: Location
}

struct Location: Codable {
    var lat: Double
    var lng: Double
}
