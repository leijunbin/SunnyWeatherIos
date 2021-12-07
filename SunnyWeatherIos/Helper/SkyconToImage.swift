//
//  SkyconToImage.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/12/2.
//

import Foundation

let skyconToImage: [String : String] = [
    "CLEAR_DAY" : "icon_gray_bg_sunny",
    "CLEAR_NIGHT" : "icon_gray_bg_sunny_night",
    "PARTLY_CLOUDY_DAY" : "icon_gray_bg_cloudy",
    "PARTLY_CLOUDY_NIGHT" : "icon_gray_bg_cloudy_night",
    "CLOUDY" : "icon_gray_bg_overcast",
    "LIGHT_HAZE" : "icon_gray_bg_pm_dirt",
    "MODERATE_HAZE" : "icon_gray_bg_pm_dirt",
    "HEAVY_HAZE" : "icon_gray_bg_pm_dirt",
    "LIGHT_RAIN" : "icon_gray_bg_light_rain",
    "MODERATE_RAIN" : "icon_gray_bg_moderate_rain",
    "HEAVY_RAIN" : "icon_gray_bg_heavy_rain",
    "STORM_RAIN" : "icon_gray_bg_heavy_rain",
    "FOG" : "icon_gray_bg_fog",
    "LIGHT_SNOW" : "icon_gray_bg_light_snow",
    "MODERATE_SNOW" : "icon_gray_bg_moderate_snow",
    "HEAVY_SNOW" : "icon_gray_bg_heavy_snow",
    "STORM_SNOW" : "icon_gray_bg_heavy_snow",
    "DUST" : "icon_gray_bg_sand",
    "SAND" : "icon_gray_bg_sand",
    "WIND" : "icon_gray_bg_sunny",
    "SLEET" : "icon_gray_bg_rain_snow",
    "THUNDER_SHOWER" : "icon_gray_bg_t_storm",
    "HAIL" : "icon_gray_bg_ice_rain"
]

func getSkyconImage(skycon: String) -> String {
    return skyconToImage[skycon] ?? ""
}
