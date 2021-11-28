//
//  Date.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/11/16.
//

import Foundation

func getDate() -> String {
    let date = Date()
    let timeFormatter = DateFormatter()
    timeFormatter.dateFormat = "MM月dd日' 周'"
    var strnowtime = timeFormatter.string(from: date) as String
    let interval = Int(date.timeIntervalSince1970)
    let days = Int(interval / 86400)
    let weekday = ((days + 4) % 7 + 7) % 7
    let weekDays = ["日", "一", "二", "三", "四", "五", "六"]
    strnowtime = strnowtime + weekDays[weekday]
    return strnowtime
}
