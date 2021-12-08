//
//  AirDesToColor.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/12/8.
//

import Foundation
import SwiftUI

let AirDesToColor: [String : Color] = [
    "优" : Color.green,
    "良" : Color.yellow,
    "轻度污染" : Color.orange,
    "中度污染" : Color.red,
    "重度污染" : Color.purple,
    "严重污染" : Color(red: 1, green: 0.29411, blue: 0)
]

func getAirColor(des: String) -> Color {
    return AirDesToColor[des] ?? Color.gray
}
