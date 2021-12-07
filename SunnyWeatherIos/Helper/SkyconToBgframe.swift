//
//  SkyconToBgframe.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/12/7.
//

import Foundation

let skyconToBgframe: [String : String] = [
    "CLEAR_DAY" : "frame_bg_sun",
    "CLEAR_NIGHT" : "frame_bg_sun_nightfall",
    "PARTLY_CLOUDY_DAY" : "frame_bg_sun",
    "PARTLY_CLOUDY_NIGHT" : "frame_bg_sun_nightfall",
    "CLOUDY" : "frame_bg_overcast",
    "LIGHT_HAZE" : "frame_bg_smog",
    "MODERATE_HAZE" : "frame_bg_smog",
    "HEAVY_HAZE" : "frame_bg_smog",
    "LIGHT_RAIN" : "frame_bg_rain",
    "MODERATE_RAIN" : "frame_bg_rain",
    "HEAVY_RAIN" : "frame_bg_thunder",
    "STORM_RAIN" : "frame_bg_storm",
    "FOG" : "frame_bg_fog",
    "LIGHT_SNOW" : "frame_bg_snow",
    "MODERATE_SNOW" : "frame_bg_snow",
    "HEAVY_SNOW" : "frame_bg_storm",
    "STORM_SNOW" : "frame_bg_storm",
    "DUST" : "frame_bg_sand_dust",
    "SAND" : "frame_bg_sand_dust",
    "WIND" : "frame_bg_wind",
    "SLEET" : "frame_bg_snow",
    "THUNDER_SHOWER" : "frame_bg_thundershower_hail",
    "HAIL" : "frame_bg_hail"
]

func getSkyconBgframe(skycon: String) -> String {
    return skyconToBgframe[skycon] ?? ""
}
