//
//  SkyconToName.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/11/16.
//

import Foundation

let skyconToName: [String : String] = [
    "CLEAR_DAY" : "晴",
    "CLEAR_NIGHT" : "晴",
    "PARTLY_CLOUDY_DAY" : "多云",
    "PARTLY_CLOUDY_NIGHT" : "多云",
    "CLOUDY" : "阴",
    "LIGHT_HAZE" : "雾霾",
    "MODERATE_HAZE" : "雾霾",
    "HEAVY_HAZE" : "雾霾",
    "LIGHT_RAIN" : "小雨",
    "MODERATE_RAIN" : "中雨",
    "HEAVY_RAIN" : "大雨",
    "STORM_RAIN" : "暴雨",
    "FOG" : "雾",
    "LIGHT_SNOW" : "小雪",
    "MODERATE_SNOW" : "中雪",
    "HEAVY_SNOW" : "大雪",
    "STORM_SNOW" : "暴雪",
    "DUST" : "浮尘",
    "SAND" : "沙尘",
    "WIND" : "大风",
    "SLEET" : "雨夹雪",
    "THUNDER_SHOWER" : "雷阵雨",
    "HAIL" : "冰雹"
]

func getSkyconName(skycon: String) -> String {
    return skyconToName[skycon] ?? " "
}
