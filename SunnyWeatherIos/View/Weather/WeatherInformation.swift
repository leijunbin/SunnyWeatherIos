//
//  WeatherInformation.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/11/18.
//

import SwiftUI

struct WeatherInformation: View {
    var body: some View {
        HStack {
            VStack{
                InformationView(des: "风向", val: 0.0)
                Spacer()
                    .frame(height: 45)
                InformationView(des: "湿度", val: 0.0)
                Spacer()
                    .frame(height: 45)
                InformationView(des: "能见度", val: 0.0)
            }.padding()
            Spacer()
                .frame(width: 70)
            VStack{
                InformationView(des: "风速", val: 0.0)
                Spacer()
                    .frame(height: 45)
                InformationView(des: "气压", val: 0.0)
                Spacer()
                    .frame(height: 45)
                InformationView(des: "云量", val: 0.0)

            }.padding()
        }
        .padding()
        .background(Rectangle().fill(Color.gray).blur(radius: 200))
        .foregroundColor(Color.white)
        .cornerRadius(20)
    }
}

struct WeatherInformation_Previews: PreviewProvider {
    static var previews: some View {
        WeatherInformation()
    }
}
