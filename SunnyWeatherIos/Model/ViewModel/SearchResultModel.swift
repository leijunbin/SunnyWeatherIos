//
//  SearchResultModel.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/12/6.
//

import Foundation

struct SearchResultModel {
    var result = [SearchResult](repeating: SearchResult(), count: 10)
}

struct SearchResult {
    
    var name: String
    var district: String
    var address: String
    var lat: Double
    var lng: Double
    
    init() {
        name = ""
        district = ""
        address = ""
        lat = 0.0
        lng = 0.0
    }
}
