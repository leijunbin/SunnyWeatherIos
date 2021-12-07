//
//  SearchResultModel.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/12/6.
//

import Foundation

struct SearchResultModel {
    var result = [SearchResult](repeating: SearchResult(), count: 5)
}

struct SearchResult {
    var formatted_address: String
    var lat: Double
    var lng: Double
    
    init() {
        formatted_address = ""
        lat = 0.0
        lng = 0.0
    }
}
