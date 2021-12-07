//
//  SkyconToBackground.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/12/7.
//

import Foundation

let skyconToBackground: [String : String] = [
    "CLEAR_DAY" : "bg_sun",
    "CLEAR_NIGHT" : "bg_sun_nightfall",
    "PARTLY_CLOUDY_DAY" : "bg_sun",
    "PARTLY_CLOUDY_NIGHT" : "bg_sun_nightfall",
    "CLOUDY" : "bg_overcast",
    "LIGHT_HAZE" : "bg_smog",
    "MODERATE_HAZE" : "bg_smog",
    "HEAVY_HAZE" : "bg_smog",
    "LIGHT_RAIN" : "bg_rain",
    "MODERATE_RAIN" : "bg_rain",
    "HEAVY_RAIN" : "bg_thunder",
    "STORM_RAIN" : "bg_storm",
    "FOG" : "bg_fog",
    "LIGHT_SNOW" : "bg_snow",
    "MODERATE_SNOW" : "bg_snow",
    "HEAVY_SNOW" : "bg_storm",
    "STORM_SNOW" : "bg_storm",
    "DUST" : "bg_sand_dust",
    "SAND" : "bg_sand_dust",
    "WIND" : "bg_sun_moring",
    "SLEET" : "bg_snow",
    "THUNDER_SHOWER" : "bg_thundershower_hail",
    "HAIL" : "bg_hail"
]

func getSkyconBackground(skycon: String) -> String {
    return skyconToBackground[skycon] ?? ""
}
