//
//  AirPositionView.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/12/8.
//

import SwiftUI

struct AirPositionView: View {
    var name: String
    var value: Int
    
    var body: some View {
        VStack(spacing: 5){
            Text(name)
                .font(.system(size: 25))
            Text(String(value))
                .font(.system(size: 25))
        }
    }
}

struct AirPositionView_Previews: PreviewProvider {
    static var previews: some View {
        AirPositionView(name: "HHHH", value: 1)
    }
}
