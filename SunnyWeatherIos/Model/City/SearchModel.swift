//
//  SearchModel.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/12/6.
//

import Foundation
import CoreLocation

struct SearchModel: Codable {
    var tips: [Place]
}

struct Place: Codable {
    var name: String
    var district: String
    var address: String
    var location: String
}
