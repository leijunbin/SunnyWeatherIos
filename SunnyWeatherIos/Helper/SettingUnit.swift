//
//  SettingUnit.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/12/9.
//

import Foundation

func getTempuratureUnit(index: Int) -> String{
    if index == 0 {
        return "℃"
    }
    else if index == 1{
        return "℉"
    }
    return " "
}

func getWindSpeedUnit(index: Int) -> String{
    if index == 0 {
        return "蒲福风力等级(Beaufort scale)"
    }
    else if index == 1{
        return "千米每小时(km/h)"
    }
    return " "
}
