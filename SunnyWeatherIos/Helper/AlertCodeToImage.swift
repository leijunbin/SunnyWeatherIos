//
//  AlertCodeToImage.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/12/9.
//

import Foundation

func getAlertCodeImage(level: Int) -> String {
    if level==1{
        return "warn_blue"
    }
    else if level==2{
        return "warn_yellow"
    }
    else if  level==3{
        return "warn_orange"
    }
    else if level==4{
        return "warn_red"
    }
    return " "
}
